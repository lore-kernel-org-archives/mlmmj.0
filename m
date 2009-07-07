From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Tue, 07 Jul 2009 17:00:47 +0000
Subject: Re: moderation only by sender
Message-Id: <1246986047.4080.20.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
In-Reply-To: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, 2009-07-07 at 18:17 +0800, Thomas Goirand wrote:
> The bounce message does the perfect captcha work...

No, the moderation message can not tell a computer from a human. It can
only authenticate "whatever sent the mail" as "something in control of
that specific mail account."

> I don't like the:
> allow X-MySecret: a6e043b3786d6d19bc141e7d194b6517
> 
> It's not always easy to add such headers. Like explain to me how I can
> do this with the standard mail client of my Nokia phone...

You probably don't send automated newsletters from your phone. The point
of using a mail header with a key, was to allow automated newsletter
dispatching, without having to handle the moderation mail. If you have a
human involved, who does not know how to add headers, moderation is
probably the easiest approach.

You can even have both:

allow X-MySecret: a6e043b3786d6d19bc141e7d194b6517
moderate

Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


