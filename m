From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 26 Jan 2010 12:17:10 +0000
Subject: PATCH: Bugfix for subjectless listtext
Message-Id: <4B5EDD46.6050706@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090601020606000202080307"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------090601020606000202080307
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I noticed this bug while perusing the code with the view to a future feature 
implementation. If a listtext has no subject, the first line is taken to be part 
of the listtext, but does not undergo substitution as it should. Probably rare for 
it to be needed, but I think it's a bug that it isn't treated properly.

I have *NOT* tested this one. I have neither confirmed the bug is there, nor that 
the patch fixes it. This is more a 'heads up' that you may like to review this 
part of the code.

Ben.



--------------090601020606000202080307
Content-Type: text/x-patch;
 name="mlmmj-fix-subjectless-listtext.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-fix-subjectless-listtext.patch"

diff -r f4d710c7dc54 -r c9510eaa0130 src/prepstdreply.c
--- a/src/prepstdreply.c	Tue Jan 26 22:45:06 2010 +1100
+++ b/src/prepstdreply.c	Tue Jan 26 23:14:28 2010 +1100
@@ -250,6 +250,10 @@
 	if (line) {
 		utfline = unistr_escaped_to_utf8(line);
 		myfree(line);
+		tmp = utfline;
+		str = substitute(utfline, listaddr, listdelim, tokencount, data, mailname);
+		myfree(tmp);
+		utfline = str;
 	} else {
 		utfline = NULL;
 	}

--------------090601020606000202080307--


