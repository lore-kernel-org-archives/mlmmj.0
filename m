From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Tue, 19 Oct 2010 09:39:34 +0000
Subject: Re: [mlmmj] message probes
Message-Id: <AANLkTimOFzYARVb7AoteUR0TkXi1AAgAx=wbjR0trdZS@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=zZKQNjJUNLmu74sGCm80zEb7q20XBk8Ns3BwG@mail.gmail.com>
In-Reply-To: <AANLkTi=zZKQNjJUNLmu74sGCm80zEb7q20XBk8Ns3BwG@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Tue, Oct 19, 2010 at 11:28 AM, Florian Effenberger <floeff@gmail.com> wr=
ote:
> some people complain, that from time to time they receive message
> probes ("The messages X, Y and Z could not be delivered to you").
> Under which conditions are they sent? Only with 5xx SMTP errors, or
> also with 4xx SMTP errors?

If the mailserver gets a 4xx reply, it doesn't bounce the mail at
first, but keeps trying. So mlmmj wont see those before the smtpd
gives up. What it could be is that when some services bounce spam
instead of rejecting on smtp level, they bounce it (correctly) to the
envelope from. And any mail coming in to an mlmmj bounce address will
be added to the probe queue. Go have a look in the list archive
directory, and see if any of those numbers is not indeed spam.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
=A0and totally illogical, with just a little bit more effort?"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 -- A. P.=
 J.


