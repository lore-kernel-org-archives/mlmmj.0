From: "Steffen (Daode) Nurpmeso" <steffen@sdaoden.eu>
Date: Thu, 25 Feb 2016 15:38:28 +0000
Subject: [mlmmj] [PATCH 3/6] Replace get_prepped*_from_map() series..
Message-Id: <9fae6e74905fcf4650562e9f447152cc7cea0f38.1456413512.git.steffen@sdaoden.eu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

with a new get_bounds_from_map() plus get_prepped_*_from_bounds().
This avoids some redundancy but mostly addresses problems that
have been seen with mapped messages without mail bodies.  This
implementation normalizes input so that headers without a final
newline, with a newline but without separating empty line and with
anything get treated the same.  Ditto body.

The problem can be reproduced on, e.g., a Alpine/Busybox system
with the Busybox sendmail and a too-simple-minded mail(1) wrapper

  #!/bin/sh -
  sub  if [ "${1}" = "-s" ]; then
    shift
    sub=$2
    shift
  fi
  {
  [ -n "${sub}" ] && echo 'Subject: '${sub} && echo
  cat
  } | sendmail -t "${@}"

when used like "$ </dev/null ./mail LISTADDR" will result in the
intransparent error

  The message from <XXX> with subject "" was unable to be
  delivered to the list

(1.2.18.0) whereas sending to LISTADDR+faq etc. seems to work just
fine.  After applying this patch the resulting error will be

  The message from <XXX> with subject "" was unable to be
  delivered to the list because the list address was not found in
  either the To: or CC: header.

which sounds better.  Even 1.2.18.0 delivers fine if a normal To:
header is included, though.  Also the problem could be
circumvented by setting the memorymailsize tunable to 0.

The new series applies normalization regarding missing final
newline, too, so that a body that only consists of the string
"you" generates the sequence "\015\012you\015\012" regardless of
wether the real input is "you" or "you\n".
The same is true for headers (except for the separator, o.c.).

XXX In the wild messages exist that look like
XXX   field: body
XXX   field: body
XXX   this is already the message body
XXX despite that being invalid, which is not handled.
XXX At least Mutt (and S-nail v14.9) do(es) so, though.

XXX The non-mapped message generator has not been updated
XXX to perform "normalization".
---
 include/mail-functions.h |  15 +++-
 src/mail-functions.c     | 176 ++++++++++++++++++++++++++++++-----------------
 src/mlmmj-send.c         |  16 +++--
 3 files changed, 135 insertions(+), 72 deletions(-)

diff --git a/include/mail-functions.h b/include/mail-functions.h
index 2c17c77..c47ecd1 100644
--- a/include/mail-functions.h
+++ b/include/mail-functions.h
@@ -28,6 +28,15 @@

 #include <stdio.h>

+struct msg_bounds{
+	char const *mb_buf;		/* The input mapping and its size */
+	size_t mb_len;
+	size_t mb_hdr_len;		/* Exclusive last NL (if any) */
+	size_t mb_hdr_pad;		/* Additional pad for NL -> NL CR */
+	char const *mb_body_start;	/* Exclusive sep. empty line (if any) */
+	size_t mb_body_len;
+};
+
 int write_helo(int sockfd, const char *hostname);
 int write_ehlo(int sockfd, const char *hostname);
 int write_mail_from(int sockfd, const char *from_addr, const char *extra);
@@ -35,9 +44,9 @@ int write_rcpt_to(int sockfd, const char *rcpt_addr);
 int write_custom_line(int sockfd, const char *line);
 int write_mailbody_from_map(int sockfd, char *mailmap, size_t mailsize,
 			    const char *tohdr);
-char *get_preppedhdrs_from_map(char *mapstart, size_t *hdrslen);
-char *get_prepped_mailbody_from_map(char *mapstart, size_t size,
-				    size_t *bodylen);
+int get_bounds_from_map(struct msg_bounds *mbp);
+char *get_prepped_hdr_from_bounds(struct msg_bounds *mbp, size_t *hdrlen);
+char *get_prepped_body_from_bounds(struct msg_bounds *mbp, size_t *bodylen);
 int write_replyto(int sockfd, const char *replyaddr);
 int write_dot(int sockfd);
 int write_quit(int sockfd);
diff --git a/src/mail-functions.c b/src/mail-functions.c
index 373cd84..b9a7a8e 100644
--- a/src/mail-functions.c
+++ b/src/mail-functions.c
@@ -185,83 +185,131 @@ int write_mailbody_from_map(int sockfd, char *mapstart, size_t size,
 	return 0;
 }

-char *get_preppedhdrs_from_map(char *mapstart, size_t *hlen)
+int
+get_bounds_from_map(struct msg_bounds *mbp)
 {
-	char *cur, *next, *endhdrs, *retstr, *r;
-	const char newlinebuf[] = "\r\n";
-	size_t hdrlen, n = 0;
-
-	endhdrs = strstr(mapstart, "\n\n");
-	if(endhdrs = NULL)
-		return NULL; /* The map doesn't map a file with a mail */
-
-	hdrlen = endhdrs - mapstart + 1;
-
-	for(next = cur = mapstart; next < mapstart + hdrlen; next++)
-		if(*next = '\n')
-			n++;
-
-	retstr = mymalloc(hdrlen + n);
-	*hlen = hdrlen + n;
-	r = retstr;
+	char c;
+	char const *cp;
+	size_t pad, blen;
+
+	if((blen = mbp->mb_len) = 0)
+		goto jerr;
+
+	for(pad = 0, cp = mbp->mb_buf;;){
+		--blen;
+		if((c = *cp++) != '\n' && blen > 0)
+			continue;
+		++pad;
+
+		/* We do allow mails with only a header, too */
+		if(blen = 0 || *cp = '\n'){
+			blen = (size_t)(cp - mbp->mb_buf);
+			if(c = '\n'){
+				--blen;
+				if(blen > 0 && *cp = '\n')
+					++cp;
+			}

-	for(next = cur = mapstart; next < mapstart + hdrlen; next++) {
-		if(*next = '\n') {
-			strncpy(r, cur, next - cur);
-			r += next - cur;
-			strncpy(r, newlinebuf, 2);
-			r += 2;
-			cur = next + 1;
+			mbp->mb_hdr_len = blen;
+			mbp->mb_hdr_pad = ++pad;
+			mbp->mb_body_start = cp;
+			mbp->mb_body_len = (size_t)(mbp->mb_buf + mbp->mb_len -
+					mbp->mb_body_start);
+			goto jleave;
 		}
 	}
-
-	return retstr;
+jerr:
+	errno = EINVAL; /* we log_error() */
+	cp = NULL;
+jleave:
+	return cp != NULL;
 }

-char *get_prepped_mailbody_from_map(char *mapstart, size_t size, size_t *blen)
+char *
+get_prepped_hdr_from_bounds(struct msg_bounds *mbp, size_t *hdrlen)
 {
-	char *cur, *next, *endhdrs, *retstr, *r;
-	char newlinebuf[3];
-	size_t bodylen, len, n = 0;
-
-	endhdrs = strstr(mapstart, "\n\n");
-	if(endhdrs = NULL)
-		return NULL; /* The map doesn't map a file with a mail */
-
-	endhdrs++; /* Skip the first newline, it's in hdrs */
-
-	bodylen = size - (endhdrs - mapstart);
-
-	for(next = cur = endhdrs; next < mapstart + size; next++) {
-		if(*next = '\n') {
-			n++;
-			if((next < mapstart + size - 1) && *(next+1) = '.')
-				n++;
+	char const netnlbuf[] = "\015\012", *start, *cur;
+	char *rv, *cp, c;
+	size_t i;
+	/*MY_ASSERT(mbp->mb_hdr_len > 0);*/
+
+	i = mbp->mb_hdr_len;
+	/* Be aware of non-terminated last line */
+	rv = mymalloc((*hdrlen = i + mbp->mb_hdr_pad));
+
+	for(cp = rv, start = cur = mbp->mb_buf;;){
+		--i;
+		if((c = *cur++) = '\n' || i = 0){
+			size_t j = (size_t)(cur - start);
+
+			if(c = '\n')
+				--j;
+
+			memcpy(cp, start, j);
+			memcpy(cp += j, netnlbuf, sizeof(netnlbuf) -1);
+			cp += sizeof(netnlbuf) -1;
+			if(i = 0)
+				break;
+			start = cur;
 		}
 	}
+	return rv;
+}

-	retstr = mymalloc(bodylen + n);
-	*blen = bodylen + n;
-	r = retstr;
-
-	for(next = cur = endhdrs; next < mapstart + size; next++) {
-		if(*next = '\n') {
-			strncpy(r, cur, next - cur);
-			r += next - cur;
-			newlinebuf[0] = '\r';
-			newlinebuf[1] = '\n';
-			len = 2;
-			if((next < mapstart + size - 1) && *(next+1) = '.') {
-				newlinebuf[2] = '.';
-				len = 3;
+char *
+get_prepped_body_from_bounds(struct msg_bounds *mbp, size_t *bodylen)
+{
+	char const netnlbuf[] = "\015\012", *start, *cur;
+	char *rv, *cp, c;
+	size_t pad, i;
+
+	if((i = mbp->mb_body_len) > 0){
+		for(pad = (*(cur = mbp->mb_body_start) = '.');;){
+			if(*cur++ = '\n'){
+				++pad;
+				if(i > 1 && *cur = '.')
+					++pad, --i, ++cur;
+			}
+			if(--i = 0)
+				break;
+		}
+	}else
+		pad = 0;
+
+	/* Body starts with separating newline, which we'll always print, and be
+	 * aware of non-terminated last line, too */
+	rv = mymalloc(sizeof(netnlbuf) -1 +
+			(*bodylen = sizeof(netnlbuf) -1 +
+					(i = mbp->mb_body_len) + pad));
+
+	memcpy(rv, netnlbuf, sizeof(netnlbuf) -1);
+	if(i > 0){
+		cp = rv + sizeof(netnlbuf)-1;
+
+		if(*(start = cur = mbp->mb_body_start) = '.')
+			*cp++ = '.';
+
+		for(;;){
+			--i;
+			if((c = *cur++) = '\n' || i = 0){
+				size_t j = (size_t)(cur - start);
+
+				if(c = '\n')
+					--j;
+				else if(i = 0)
+					*bodylen += sizeof(netnlbuf)-1;
+
+				memcpy(cp, start, j);
+				memcpy(cp += j, netnlbuf, sizeof(netnlbuf) -1);
+				if(i = 0)
+					break;
+				cp += sizeof(netnlbuf) -1;
+				if(*(start = cur) = '.')
+					*cp++ = '.';
 			}
-			strncpy(r, newlinebuf, len);
-			r += len;
-			cur = next + 1;
 		}
 	}
-
-	return retstr;
+	return rv;
 }

 int write_dot(int sockfd)
diff --git a/src/mlmmj-send.c b/src/mlmmj-send.c
index 38c3a83..5fdb28f 100644
--- a/src/mlmmj-send.c
+++ b/src/mlmmj-send.c
@@ -1021,14 +1021,20 @@ int main(int argc, char **argv)
 	}

 	if(prepmailinmem) {
-		hdrs = get_preppedhdrs_from_map(mailmap, &hdrslen);
-		if(hdrs = NULL) {
+		struct msg_bounds mb;
+
+		mb.mb_buf = mailmap;
+		mb.mb_len = (size_t)st.st_size;
+
+		if(!get_bounds_from_map(&mb)){
+			log_error(LOG_ARGS, "Invalid message content");
+			exit(EXIT_FAILURE);
+		}
+		if((hdrs = get_prepped_hdr_from_bounds(&mb, &hdrslen)) = NULL){
 			log_error(LOG_ARGS, "Could not prepare headers");
 			exit(EXIT_FAILURE);
 		}
-		body = get_prepped_mailbody_from_map(mailmap, st.st_size,
-						     &bodylen);
-		if(body = NULL) {
+		if((body = get_prepped_body_from_bounds(&mb, &bodylen)) =NULL){
 			log_error(LOG_ARGS, "Could not prepare mailbody");
 			myfree(hdrs);
 			exit(EXIT_FAILURE);
--
2.7.1

