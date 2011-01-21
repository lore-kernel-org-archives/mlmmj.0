From: Florian Effenberger <floeff@gmail.com>
Date: Fri, 21 Jan 2011 10:41:36 +0000
Subject: Re: [mlmmj] message probes
Message-Id: <AANLkTi==9go581aSU_+twGs922wQF0vvT3JK5hpjV67F@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=zZKQNjJUNLmu74sGCm80zEb7q20XBk8Ns3BwG@mail.gmail.com>
In-Reply-To: <AANLkTi=zZKQNjJUNLmu74sGCm80zEb7q20XBk8Ns3BwG@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi Mads,

2010/10/19 Mads Martin J=F8rgensen <mmj@mmj.dk>:

> If the mailserver gets a 4xx reply, it doesn't bounce the mail at
> first, but keeps trying. So mlmmj wont see those before the smtpd
> gives up. What it could be is that when some services bounce spam
> instead of rejecting on smtp level, they bounce it (correctly) to the
> envelope from. And any mail coming in to an mlmmj bounce address will
> be added to the probe queue. Go have a look in the list archive
> directory, and see if any of those numbers is not indeed spam.

hm... we do spam filtering in the SMTP session, so it's rejected
directly, not bounced. However, it seems the problem vanished as
well... :)

Florian


