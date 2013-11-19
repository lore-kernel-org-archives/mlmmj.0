From: Paul Fariello <paul@fariello.eu>
Date: Tue, 19 Nov 2013 14:17:03 +0000
Subject: [mlmmj] Re: 8BITMIME
Message-Id: <20131119141703.GS25691@chimay.paulfariello.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DiL7RhKs8rK9YGuF"
List-Id: <mlmmj.mlmmj.org>
References: <20131105133545.GE25691@chimay.paulfariello.fr>
In-Reply-To: <20131105133545.GE25691@chimay.paulfariello.fr>
To: mlmmj@mlmmj.org


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Nov 05, 2013 at 02:35:45PM +0100, Paul Fariello wrote:
> Hi all,
> 
> first I'd like to thank you for the great work you have done on mlmmj. It's
> really joyful to use it !
> 
> Unfortunately I have an issue with some of my mail that contains
> utf-8 chararcters.
> 
> My MTA (OpenSMTPd) is masking data with 0x7f when mail are not coming with the
> 8BITMIME flag. And it seems that mlmmj is not using the 8BITMIME EHLO command
> when sending mail to the list. So it ends up with messy characters like "C'"
> instead of "ç".
> 
> I'm not aware of all specificity of 8BITMIME, may be my mail are missing some
> header. Here is an example of the mail that fails :
> 
> 
> > Delivered-To: mlmmj-test@lists.paulfariello.fr
> > Received: from chimay.paulfariello.fr (chimay.paulfariello.fr [109.190.142.210]);
> > 	by chimay.paulfariello.fr (OpenSMTPD) with ESMTPSA id 2e35f84e;
> > 	TLS version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO;
> > 	for <mlmmj-test@lists.paulfariello.fr>;
> > 	Tue, 5 Nov 2013 10:30:32 +0100 (CET)
> > Date: Tue, 5 Nov 2013 10:30:31 +0100
> > From: Paul Fariello <paul@fariello.eu>
> > To: mlmmj-test@lists.paulfariello.fr
> > Subject: Re: [Test] test mlmmj-send
> > Message-ID: <20131105093031.GM11270@chimay.paulfariello.fr>
> > References: <20131105091721.GB11270@chimay.paulfariello.fr>
> > List-Id: <test.lists.paulfariello.fr>
> > List-Post: <mailto:mlmmj-test@lists.paulfariello.fr>
> > List-Help: <mailto:mlmmj-test+help@lists.paulfariello.fr>
> > List-Subscribe: <mailto:mlmmj-test+subscribe@lists.paulfariello.fr>
> > List-Unsubscribe: <mailto:mlmmj-test+unsubscribe@lists.paulfariello.fr>
> > List-Owner: <mailto:mlmmj-test+owner@lists.paulfariello.fr>
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=utf-8
> > Content-Disposition: inline
> > Content-Transfer-Encoding: 8bit
> > In-Reply-To: <20131105091721.GB11270@chimay.paulfariello.fr>
> > User-Agent: Mutt/1.5.21 (2010-09-15)
> > 
> > ça va ?
> 
> Any idea of what I should do ? Patch mlmnj to set "EHLO" is an option ?
> 
> Regards,
> 
> -- 
> Paul Fariello

Finally, I decided to patch mlmmj to add minimalistic support for 8BITMIME.

Here are my patches.

Regards,

-- 
Paul Fariello

--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=patch-src_mail-function_c

--- src/mail-functions.c.orig	Tue Nov 19 09:49:33 2013
+++ src/mail-functions.c	Tue Nov 19 09:49:52 2013
@@ -47,7 +47,7 @@
 	
 	if((helo = mymalloc(len)) == 0)
 		return errno;
-	snprintf(helo, len, "HELO %s\r\n", hostname);
+	snprintf(helo, len, "EHLO %s\r\n", hostname);
 	len = strlen(helo);
 #if 0
 	fprintf(stderr, "\nwrite_helo, helo = [%s]\n", helo);

--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=patch-src_checkwait_smtpreply_c

--- src/checkwait_smtpreply.c.orig	Tue Nov 19 14:58:41 2013
+++ src/checkwait_smtpreply.c	Tue Nov 19 14:59:08 2013
@@ -35,7 +35,11 @@
 {
 	char *smtpreply;
 
-	smtpreply = mygetline(sockfd);
+	// Consume all 8BITMIME XXX- reply
+	do {
+		smtpreply = mygetline(sockfd);
+	} while (strlen(smtpreply) > 3 && smtpreply[3] == '-');
+
 #if 0
 	printf("replytype = [%d], smtpreply = [%s]\n", replytype, smtpreply);
 	fprintf(stderr, "%s", smtpreply);

--DiL7RhKs8rK9YGuF--

