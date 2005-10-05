From: Joel Aelwyn <joel@lightbearer.com>
Date: Wed, 05 Oct 2005 00:15:59 +0000
Subject: Re: RECIPDELIM patch, italian lists texts, qmail how-to and some
Message-Id: <43431B3F.9070702@lightbearer.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enigCE8A81856DC9A7A9814D1D87"
List-Id: <mlmmj.mlmmj.org>
References: <6.2.3.4.2.20051004222158.03132540@postino.programmazione.it>
In-Reply-To: <6.2.3.4.2.20051004222158.03132540@postino.programmazione.it>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigCE8A81856DC9A7A9814D1D87
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Filippo Fadda wrote:
> Hi Mads,
> 
> here you can find the RECIPDELIM patch, with the italian lists texts and 
> the qmail readme file. I'm running it for about 2 months, and it seems 
> work good. But we have a problem to solve related to the delivery-to 
> field. Qmail with vpopmail doesn't work with mlmmj, because as you can 
> see from headers, vpopmail add the virtual domain name before the list 
> name. So the code from 1.2.8 does not work.
> 
> Return-Path: <newsletter-bounces-25@programmazione.it>
> Delivered-To: fifadd@tin.it
> Received: (qmail 20834 invoked by uid 530); 4 Oct 2005 20:45:55 +0200
> Received: from localhost (HELO postino.programmazione.it) (127.0.0.1)
>   by postino.programmazione.it with SMTP; 4 Oct 2005 20:45:55 +0200
> Delivered-To: programmazione.it-newsletter@programmazione.it
> Received: (qmail 17462 invoked by uid 530); 4 Oct 2005 20:44:11 +0200
> Received: from www.programmazione.it <http://www.programmazione.it> 
> (HELO 10.254.3.10) (212.35.214.84)
>   by postino.programmazione.it with SMTP; 4 Oct 2005 20:44:11 +0200
> MIME-Version: 1.0
> Content-type: text/html; charset=iso-8859-1
> From: noreply@programmazione.it
> To: newsletter@programmazione.it
> Date: Tue,  4 Oct 2005 21:20:36 +0200
> Message-Id: 9be7b2f116a9cec35258e9ae705d83e7@programmazione.it
> Subject: Pensiero Digitale - Varie dal mondo
> 
> To make it working I have made this change. Delivery-to is not a related 
> RFC field so, for me, is not right way, but if you prefer use it you 
> have to find a better solution that is qmail+vpopmail compatible. The 
> original code from 1.2.8 does not work and you need the following changes.
> 
> -       if(whichto && whichto->emaillist && whichto->emaillist[0])
> -                recipdelim = strchr(whichto->emaillist[0], RECIPDELIM);
> -       else
> -                recipdelim = NULL;
> +        if(toemails.emaillist && toemails.emaillist[0])
> +                recipdelim = strstr(toemails.emaillist[0], RECIPDELIM);
> +        else
> +                recipdelim = NULL;
> 
> The patch of Joel Aelwyn that it seems based on my job, cannot work with 
> qmail and vpopmail because it has the same 1.2.8 problems.

Actually, I wrote it from scratch, though I did pay attention to what I could 
see of known issues on the mailing list. There just aren't very many ways to 
do this particular patch that won't look fairly similar, if done right. 
However, using toemails seems like the wrong answer here; that's the whole 
point of the "tocc" tunable, isn't it?

The *best* way to handle it, really, is to do exactly what qmail does 
internally, and rely on the mailer to set environment variables (SENDER, 
RECIPIENT, USER, HOST, LOCAL, and EXT - or rather, a particular subset of 
those that I'd have to look up again to be sure of, other than EXT) with the 
correct data in them, rather than trying to re-process the email addresses 
(either destination or delivery based). This does, of course, require other 
mailers to set those variables, but most things that aren't qmail are 
sufficiently flexible to handle doing that as a config adjustment (if they 
don't already do it by default).

To the best of my knowledge, there *isn't* any RFC-required header that is 
guaranteed to be present, and guaranteed to hold the list's email address. The 
best bet is something that propagates RCPT TO, which actually controls 
delivery - and that pretty much means Delivered-To, where it exists and 
follows the convention of the first line being the RCPT TO data address. Or 
requiring all mailers to either A) make the data available via an environment 
variable, or B) set an RFC-approved, non-required header such as X-SMTP-RCPT_TO.

Or, to pull out the swiss army knife, add another config file - that tells 
mlmmj how to check for the list address (say, for example, "Match the 
following regexp on any header" - but that then raises the question of whether 
headers are handled as-delivered or collapsed, etc... still, this might be a 
useful answer, overall, since much of it already exists in mlmmj for the 
purposes of user checking and moderation controls).
-- 
Joel Aelwyn <joel@lightbearer.com>

--------------enigCE8A81856DC9A7A9814D1D87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (MingW32)

iD8DBQFDQxs/lZCPwGNtWe4RAmbwAJ94Ses9F0rswilU5/aSMPrDu+biGACfbLEd
h8GYDC8Xau8pq31eNU6l71g=
=rTsz
-----END PGP SIGNATURE-----

--------------enigCE8A81856DC9A7A9814D1D87--
