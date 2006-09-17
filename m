From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 17 Sep 2006 15:07:43 +0000
Subject: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]
Message-Id: <20060917150743.GA20790@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <450B2711.4030008@darkman.de>
In-Reply-To: <450B2711.4030008@darkman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Sven 'Darkman' Michels <sven@darkman.de> [Sep 16. 2006 22:23]:
> > What I meant by reproducing is creating a mail in an editor doing this?
> > I cannot do that. So there must be something seriously fishy with this
> > one. Haven't had a chance to examine it yet.
> 
> it has become even more serious now: with 1.2.12-RC2 the same user
> even can't subscribe to a new list... seems to be the same problem:
> Sep 16 22:19:18 pamphlet /usr/bin/mlmmj-process[8010]:
> listcontrol.c:180: Ignoring mail with invalid From: which was not a
> bounce: Success
> 
> this was the reply to the confsub message... and the message has:
>   -----Original Message-----
> From: test+help@c3f2m.de [mailto:test+help@c3f2m.de]
> Sent: Saturday, September 16, 2006 9:40 PM
> To: my@benjamin-oette.de
> Subject: [test] Confirm subscription to test@c3f2m.de
> 
> in it (notice the missing spaces for from etc!). Mailer is Outlook 11.
> Is it possible that something "removes" leading spaces?
> 
> *help?* ;)

Can you try it without this patch?

--- chomp.c
+++ chomp.c
@@ -38,7 +38,7 @@

        i = strlen(str) - 1;

-       while(str[i] = '\n') {
+       while(str[i] = '\n' || str[i] = '\r') {
                str[i] = 0;
                i--;
        }


-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
