From: Christian Laursen <xi@borderworlds.dk>
Date: Tue, 19 Oct 2010 10:00:51 +0000
Subject: Re: [mlmmj] message probes
Message-Id: <4CBD6C53.6060109@borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=zZKQNjJUNLmu74sGCm80zEb7q20XBk8Ns3BwG@mail.gmail.com>
In-Reply-To: <AANLkTi=zZKQNjJUNLmu74sGCm80zEb7q20XBk8Ns3BwG@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 10/19/10 11:39, Mads Martin J=F8rgensen wrote:
> On Tue, Oct 19, 2010 at 11:28 AM, Florian Effenberger<floeff@gmail.com>  =
wrote:
>> some people complain, that from time to time they receive message
>> probes ("The messages X, Y and Z could not be delivered to you").
>> Under which conditions are they sent? Only with 5xx SMTP errors, or
>> also with 4xx SMTP errors?
>
> If the mailserver gets a 4xx reply, it doesn't bounce the mail at
> first, but keeps trying. So mlmmj wont see those before the smtpd
> gives up. What it could be is that when some services bounce spam
> instead of rejecting on smtp level, they bounce it (correctly) to the
> envelope from. And any mail coming in to an mlmmj bounce address will
> be added to the probe queue. Go have a look in the list archive
> directory, and see if any of those numbers is not indeed spam.

I have also seen from time to time, that people forward their mail to=20
two accounts. One of them is the one they actually use which works fine=20
and the other one bounces mails sent to it.

That setup will ensure them a lot of bounce probes. :)

--=20
Christian Laursen


