From: Joel Aelwyn <joel@lightbearer.com>
Date: Mon, 14 Nov 2005 02:26:42 +0000
Subject: Re: recipient delimiter bug with RC1
Message-Id: <4377F5E2.5010704@lightbearer.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enig32653387840F9A63FFB3A88B"
List-Id: <mlmmj.mlmmj.org>
References: <20051113034740.GF4414@hinegardner.org>
In-Reply-To: <20051113034740.GF4414@hinegardner.org>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig32653387840F9A63FFB3A88B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Jeremy Hinegardner wrote:
> Hi all,
> 
> I was looking forward recipient delimiter to be configurable.  But it
> just so happens that on postfix with virtual domains and postfix's
> recipient delimiter set to '-' it doesn't quite work.  The bug manifests
> itself if you have a mailing list that has a name containing the
> recipient delimiter.  
> 
> In other words, if both postfix and mlmmj have their recipient
> delimiters set to '-' and you create a mailing list named 'mlmmj-test'
> then your subscribes, unsubscribes are mishandled by 'mlmmj' when it
> attempts to parse the email address for control commands.
> 
> For example:
>     postfix recipient delimiter = -
>     mlmmj recipient delimiter   = -
>     list name                   = mlmmj-test
> 
> When mlmmj-test-subscribe@example.com gets to mlmmj it parse the command
> as being 'test-subscribe' which doesn't match so it exits.  Even if it
> was just a regular post to mlmmj-test@example.com then mlmmj assumes
> that it has a command since the recipient delimiter is present.
> 
> I'm not sure if I explained the problem very well, but the attached
> patch fixes it for me.

I believe I documented this issue with the original patches; I did consider 
it, but (as your patch shows) the fix for it was highly invasive, and involved 
some significant logic restructuring. I chose not to do that, first pass, 
because one of my goals was "minimize changes" and another was "keep the patch 
as human-readable as possible". Now that it's had some more significant 'field 
testing' of the core, it certainly seems like it might be worth addressing the 
weirder quirks where this sort of thing happens (there are also several memory 
leaks which I left alone, entirely because they were items that would not make 
any significant difference in the typical mlmmj mode of 'run, then end', and 
fixing them was going to introduce either logic changes or additional patch 
dependancies).

As a sidenote, however, I use Exim with a list delimiter of "-" (as in, for 
example, immortal-l@lists.lightbearer.com), and it seemed to be functioning 
basically correctly under those circumstances, during my tests with the 
original patch. It is possible that this is due to some of the logic handled 
by Exim, before it ever hands things to mlmmj (it autodetects valid lists, 
matching a-b-c-d@dom.ain based on the same rules implemented by qmail/ezmlm; 
a-b-c-d, then a-b-c, then a-b, then a...), so it may be doing something that 
shortcuts the entire situation.

I honestly think that there might be some call for an attempt to restructure 
some things for 1.3; there are several points where the list delimiter is 
re-read by different levels of the program, because there was no obviously 
sane way to pass it through the intervening functions; again, I chose the way 
I did based on minimal change in a patch being higher priority than maximum 
efficiency of the final result (note 'maximum'; *useable* efficiency was a 
base requirement, of course).

I still think it's worth looking into allowing the MTA to provide environment 
variables that will be treated as the canonical "list" and "extra" portions, 
if they're set, and bypass all of this. Some MTAs do it automagically, and 
many (even most) can do it if configured to do so. Generally, they have a far 
more flexible configuration language, can do things like "talk to LDAP" or 
"make DNS queries" when relevant, and if the administrator has configured them 
to be able to decide which parts are core delivery and which are permitted 
extras, mlmmj shouldn't try to second-guess them (though keeping the logic 
available, for use when the MTA *doesn't* provide such details, or when there 
is a need to break down the 'extra' section further than the MTA does, is 
still worthwhile).
-- 
Joel Aelwyn <joel@lightbearer.com>

--------------enig32653387840F9A63FFB3A88B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (MingW32)

iD8DBQFDd/XnlZCPwGNtWe4RAqXfAJ9Tbc5CpPAPjGDHyeQG1hmltQEqkQCdHuob
nZJM72V/gIl5QIeKCnveiEY=
=RtUk
-----END PGP SIGNATURE-----

--------------enig32653387840F9A63FFB3A88B--
