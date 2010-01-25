From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 25 Jan 2010 13:41:34 +0000
Subject: Re: PATCH: Access priority
Message-Id: <4B5D9F8E.5030506@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040302090708090103000204"
List-Id: <mlmmj.mlmmj.org>
References: <4B5D7A55.4090302@yahoo.com.au>
In-Reply-To: <4B5D7A55.4090302@yahoo.com.au>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------040302090708090103000204
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Here is an updated version of this patch that applies on top of the revised 
notmetoo patch I just emailed.

Ben.



On 25/01/10 10:02 PM, Ben Schmidt wrote:
> This patch fixes something that I got bitten by last week, and since I
> spotted the place in the code while I was working on the other stuff, I
> did this too! It applies over 1.2.17.
>
> The problem is that if you have a list that is 'moderated' or
> 'modnonsubposts', the 'allow' access keyword is ineffective, but behaves
> like 'moderate'. This patch fixes that so that access rules have
> priority, and do what they say.
>
> I think this is more intuitive.
>
> Do others agree? Or could this change cause problems? If not, or the
> perceived problems are minor enough, could this be included in mlmmj?
>
> I have tested it, and it works for me.
>
> Ben.
>

--------------040302090708090103000204
Content-Type: text/x-patch;
 name="mlmmj-access-2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-access-2.patch"

diff -ru mlmmj-1.2.17/src/mlmmj-process.c mlmmj-1.2.17-mod/src/mlmmj-process.c
--- mlmmj-1.2.17/src/mlmmj-process.c	2010-01-26 00:13:49.000000000 +1100
+++ mlmmj-1.2.17-mod/src/mlmmj-process.c	2010-01-26 00:15:26.000000000 +1100
@@ -852,6 +854,9 @@
 	}
 
 startaccess:
+	if(!moderated)
+		moderated = statctrl(listdir, "moderated");
+
 	noaccessdenymails = statctrl(listdir, "noaccessdenymails");
 
 	access_rules = ctrlvalues(listdir, "access");
@@ -918,13 +923,13 @@
 			myfree(donemailname);
 			myfree(discardname);
                 	exit(EXIT_SUCCESS);
+		} else if (accret == ALLOW) {
+			moderated = 0;
 		}
 	}
 
 	notmetoo = statctrl(listdir, "notmetoo");
 
-	if(!moderated)
-		moderated = statctrl(listdir, "moderated");
 	if(moderated) {
 		mqueuename = concatstr(3, listdir, "/moderation/",
 				       randomstr);

--------------040302090708090103000204--


