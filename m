From: Chris Webb <chris@arachsys.com>
Date: Sun, 03 Feb 2008 14:23:38 +0000
Subject: [PATCH] mlmmj-receive-strip segfault
Message-Id: <20080203142338.GO16020@arachsys.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi. mlmmj-receive-strip segfaults if either control/mimedeny or
control/mimestrip exist but contain no non-empty lines. (In this case,
ctrlvalues() returns a non-NULL pointer to a strlist with a NULL strs, which
gets passed to findit() and needs to be handled correctly.)

The following tiny patch against mlmmj-1.2.15 fixes this:

--- a/contrib/receivestrip/mlmmj-receive-strip.c	2008-02-01 09:24:06.000000000 +0000
+++ b/contrib/receivestrip/mlmmj-receive-strip.c	2008-02-03 13:30:47.000000000 +0000
@@ -81,6 +81,9 @@ static int findit(char *line, char **hea
         int i = 0;
         size_t len;
 
+	if(!headers)
+		return 0;
+
         while(headers[i]) {
                 len = strlen(headers[i]);
                 if(strncasecmp(line, headers[i], len) = 0)

One other note: the mlmmj-receive-strip README probably ought to mention
that, if you're using mlmmj-receive-strip in place of mlmmj-receive,
control/delheaders should contain X-ThisMailContainsUnwantedMimeParts: to
prevent every message that goes out to the list having a spurious

  X-ThisMailContainsUnwantedMimeParts: N

header added to every message. This header is added regardless of whether or
not the control/mimedeny feature is in use. It can safely be stripped as
this happens after control/access has a chance to deny on the presence of a
Y.

Best wishes,

Chris.
