From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Tue, 26 Nov 2013 13:52:37 +0000
Subject: Re: [mlmmj] Problems with microsoft
Message-Id: <5294A7A5.8090801@oldelvet.org.uk>
List-Id: <mlmmj.mlmmj.org>
References: <90126ceb66d472c9ae7d603e72640bfb@swn.nu>
In-Reply-To: <90126ceb66d472c9ae7d603e72640bfb@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

Have you tried looking up your mlmmj server's IP address in the various 
blocklists. The following will do a lookup and that might help you to 
see if it is just Microsoft or whether others think your server is a 
problem.

http://www.dnsbl.info/

That will at least give you an idea as to why the blocking may be happening.

Regards

Richard

On 24/11/2013 15:57, Christian Gleerup wrote:
> Hi Ben and List,
> I'm been going through the logs, but I am not getting much wiser.
>
> I hope the information provided here is the correct one, ontherwise please direct me as to what else to look for.
>
>
> Here a snippet from /var/log/mail.log.1
> ---- BEGIN SNIP -----------------------------------------------------
> Nov 10 06:27:22 lists postfix/smtp[8385]: 1465545E8A: to=<someone@hotmail.com>, relay=mx1.hotmail.com[65.55.37.72]:25, delay=0.94, delays=0.16/0.01/0.59/0.19, dsn=5.0.0, status=bounced (host mx1.hotmail.com[65.55.37.72] said: 550 SC-002 (COL0-MC1-F1) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
> Nov 10 06:27:22 lists postfix/smtp[8385]: 1465545E8A: lost connection with mx1.hotmail.com[65.55.37.72] while sending RCPT TO
> Nov 10 06:27:22 lists postfix/cleanup[12147]: 108F1467C2: message-id=<20131110052722.108F1467C2@lists.DOMAIN>
> Nov 10 06:27:22 lists postfix/cleanup[11855]: 0B321467BD: message-id=<1384061241-12392-mlmmj-5f63aeea@lists.DOMAIN>
> Nov 10 06:27:22 lists postfix/smtp[8334]: 50697467AF: to=<someone@live.dk>, relay=mx4.hotmail.com[65.55.92.136]:25, delay=0.73, delays=0.1/0.01/0.47/0.15, dsn=5.0.0, status=bounced (host mx4.hotmail.com[65.55.92.136] said: 550 SC-002 (SNT0-MC1-F19) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
> Nov 10 06:27:22 lists postfix/smtp[8334]: 50697467AF: lost connection with mx4.hotmail.com[65.55.92.136] while sending RCPT TO
> Nov 10 06:27:22 lists postfix/cleanup[12193]: 17834467C3: message-id=<20131110052722.17834467C3@lists.DOMAIN>

