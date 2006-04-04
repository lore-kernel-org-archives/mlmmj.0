From: Christian Laursen <xi@borderworlds.dk>
Date: Tue, 04 Apr 2006 18:16:55 +0000
Subject: Re: Two To: headers added to auto-mails from list
Message-Id: <868xqlp5ns.fsf@borg.borderworlds.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <mlmmj.mlmmj.org>
References: <44312C59.8000100@925.dk>
In-Reply-To: <44312C59.8000100@925.dk>
To: mlmmj@mlmmj.org

--=-=-=

Martin Koch Andersen <martin@925.dk> writes:

> I have noticed that in emails from the list (confirm-sub, sub-ok etc.)
> I get two To: headers.
>
> In the configuration of my list I have 'Add To: header'. And in
> Delete headers' 'To:' is listed also.

I have just reproduced this.

> Why do I get this extra To: header? Could it be a bug with the
> mentioned configuration above?

The problem is that when addtohdr is true, an extra To: header is
always appended by mlmmj-send even for mails not going to the list
subscribers, e.g. subscribe confirmations and mails to moderators.

I have made a small patch that only sets addtohdr from the control
dir when resending earlier failed mails or sending normal list mail.
I am however not sure that this is the right solution, so I would
welcome any input.

The patch is attached.

> Using latest version.

I know. :)

-- 
Christian Laursen

--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline; filename=mlmmj.diff
Content-Description: mlmmj-send.c patch

diff -urN mlmmj-1.2.11.orig/src/mlmmj-send.c mlmmj-1.2.11/src/mlmmj-send.c
--- mlmmj-1.2.11.orig/src/mlmmj-send.c	Tue Nov  1 14:23:49 2005
+++ mlmmj-1.2.11/src/mlmmj-send.c	Tue Apr  4 19:43:42 2006
@@ -823,7 +823,6 @@
 		exit(EXIT_FAILURE);
 	}
 
-	addtohdr = statctrl(listdir, "addtohdr");
 	memmailsizestr = ctrlvalue(listdir, "memorymailsize");
 	ctrlarchive = statctrl(listdir, "noarchive");
 	if(memmailsizestr) {
@@ -886,6 +885,7 @@
 		}
 		break;
 	case '3':
+		addtohdr = statctrl(listdir, "addtohdr");
 	case '4': /* sending mails to subfile */
 		if((subfd = open(subfilename, O_RDONLY)) < 0) {
 			log_error(LOG_ARGS, "Could not open '%s':",
@@ -904,6 +904,7 @@
 						archivefilename);
 		break;
 	default: /* normal list mail -- now handled when forking */
+		addtohdr = statctrl(listdir, "addtohdr");
 		break;
 	}
 

--=-=-=--
