From: Florian Effenberger <floeff@gmail.com>
Date: Fri, 21 Jan 2011 10:38:46 +0000
Subject: Re: [mlmmj] mlmmj and GMANE posting
Message-Id: <AANLkTikx0Y_zSU3BQ1=sKH3-cwgkBe4AsW5ewmBHVUzY@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTik-oBQtEUfMXR3LxYRrrDz4ay_9uvF+gwrPujx9@mail.gmail.com>
In-Reply-To: <AANLkTik-oBQtEUfMXR3LxYRrrDz4ay_9uvF+gwrPujx9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Ben,

2010/10/23 Ben Schmidt <mail_ben_schmidt@yahoo.com.au>:

>>> Do the GMANE servers implement SenderID/SPF and/or Domainkeys/DKIM? If
>>> you can set up your MTA to validate one or both of those, add a header,
>>> and then check that header for Mlmmj access purposes, it would be more
>>> secure.

> Ah, yes. The feature for that wasn't in the last release. It's only in
> version control. The current README.access details it:
>
> http://mlmmj.org/hg/mlmmj/file/tip/README.access
>
> 1.2.18 will be coming soon!

I looked in the file, but it didn't solve my problem. What exactly
should be in the access file, to allow messages with a GMANE header
(like X-Gmane-...) pass through without moderation, even if the sender
is not a subscriber?

Thanks,
Florian

