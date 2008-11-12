From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 12 Nov 2008 09:59:23 +0000
Subject: Re: Change reply-to address for confirming subscription
Message-Id: <20081112095922.GD28005@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <f8abd15f10bc.491aa1eb@plus.net>
In-Reply-To: <f8abd15f10bc.491aa1eb@plus.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* jberry@plus.net <jberry@plus.net> [Nov 12. 2008 10:27]:
> We are currently using EZMLM and installing a new spam filtering technology in
> front of the platform.
>
> Problems are being encountered doing this because each mailbox (i.e. alias) that
> a customer uses must be explicitly specified in the spam filtering system.
>
> What this means is that the bounce control and subscription/unsubscription
> confirmation processs is not working because the address is not one we can know
> in advance and add:
>
> e.g. mlmmj+confsub-123456789123-jberry=plus.net@mmj.dk
>
> I am not too worried about the bounce control as I can chance that behavior by
> patching the software, but this is not the case with sub/unsub.
>
> Is there any way in MLMMJ to change this process so that it uses, for example, a
> static string in the subject of the reply to confirm the action rather than it
> being in the address?
>
> If not then does anyone know of any other mailing list software that works like
> that.

You can patch your way out of it, since mlmmj-send has the -R option to
specify the Reply-To: to use.

--
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
