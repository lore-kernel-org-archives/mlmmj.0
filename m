From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 17 Jan 2005 23:43:09 +0000
Subject: ERRATA
Message-Id: <20050117234309.GA59584@mmj.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all,

Maybe some of you noticed the wrong envelope from on the last mail. It
was due to a code-snippet getting inside a while() loop where it should
have been on the outside after.

I've attached the patch.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-send-verpfix.diff"

Index: mlmmj-send.c
===================================================================
RCS file: /home/mmj/MMJCVS/mlmmj/src/mlmmj-send.c,v
retrieving revision 1.69
diff -u -r1.69 mlmmj-send.c
--- mlmmj-send.c	16 Jan 2005 18:43:48 -0000	1.69
+++ mlmmj-send.c	17 Jan 2005 23:40:34 -0000
@@ -983,7 +983,7 @@
 					"header. Not sending with VERP.");
 			verp = NULL;
 		}
-
+		
 		if(verp) {
 			initsmtp(&sockfd, relay);
 			if(write_mail_from(sockfd, verpfrom, verp)) {
@@ -1053,49 +1053,45 @@
 					stl.count = 0;
 				}
 			} while(res > 0);
-			if(stl.count) {
-				initsmtp(&sockfd, relay);
-				if(verp) {
-					sendres = send_mail_verp(sockfd,
-							&stl, mailmap,
-							st.st_size,
-							verpfrom,
-							listdir, hdrs, hdrslen,
-							body, bodylen, verp);
-					if(sendres)
-						requeuemail(listdir, strindex,
-								&stl, 0);
-				} else {
-					sendres = send_mail_many_list(sockfd,
-							NULL, NULL, mailmap,
-							st.st_size, &stl,
-							listaddr,
-							archivefilename,
-							listdir, mlmmjbounce,
-							hdrs, hdrslen, body,
-							bodylen);
-				}
-				endsmtp(&sockfd);
-				for(i = 0; i < stl.count; i++)
-					myfree(stl.strs[i]);
-				stl.count = 0;
-			}
-
-			myfree(verpfrom);
 			myfree(subfilename);
-			myfree(stl.strs);
 			close(subfd);
 
-			if (sendres) {
-				/* If send_mail_many() failed we close the
-				 * connection to the mail server in a brutal
-				 * manner, because we could be in any state
-				 * (DATA for instance). */
-				close(sockfd);
+		}
+		if(stl.count) {
+			initsmtp(&sockfd, relay);
+			if(verp) {
+				sendres = send_mail_verp(sockfd, &stl, mailmap,
+						st.st_size, verpfrom, listdir,
+						hdrs, hdrslen, body, bodylen,
+						verp);
+				if(sendres)
+					requeuemail(listdir, strindex, &stl,
+							0);
 			} else {
-				endsmtp(&sockfd);
+				sendres = send_mail_many_list(sockfd, NULL,
+						NULL, mailmap, st.st_size,
+						&stl, listaddr,
+						archivefilename, listdir,
+						mlmmjbounce, hdrs, hdrslen,
+						body, bodylen);
 			}
+			endsmtp(&sockfd);
+			for(i = 0; i < stl.count; i++)
+				myfree(stl.strs[i]);
+			stl.count = 0;
+		}
+
+		if (sendres) {
+			/* If send_mail_many() failed we close the
+			 * connection to the mail server in a brutal
+			 * manner, because we could be in any state
+			 * (DATA for instance). */
+			close(sockfd);
+		} else {
+			endsmtp(&sockfd);
 		}
+		myfree(stl.strs);
+		myfree(verpfrom);
 		closedir(subddir);
 		myfree(subddirname);
 		break;

--BXVAT5kNtrzKuDFl--
