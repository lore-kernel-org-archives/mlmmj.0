From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Mon, 25 Feb 2008 18:27:10 +0000
Subject: Re: [patch] Static bounce address
Message-Id: <200802251927.11262.thomas.jarosch@intra2net.com>
List-Id: <mlmmj.mlmmj.org>
References: <20080223021959.85x4a8e6sick48gk@intranator.m.i2n>
In-Reply-To: <20080223021959.85x4a8e6sick48gk@intranator.m.i2n>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi Morten,

On Monday, 25. February 2008 11:51:31 Morten K. Poulsen wrote:
> Your patch is very clean, but (when configured to) it changes the bounce
> address from
>
> listname+bounces-1464-morten=AFdelingp.dk@example.com
>
> to
>
> something@example.com
>
> I think it would be better to keep the bounce information, and have the
> bounce mail go to
>
> something+1464-morten=AFdelingp.dk@example.com
>
> That way you can both control where bounces are sent, and see who is
> bouncing. Could I convince you to make the patch so?

Sounds good. I'll see what I can do the next days.
Is there already a function to split an email address into localpart/domain?
Didn't see one when I took a quick look.

> > If all goes well mlmmj will be pushed out to 1.500+ servers
> > as transparent replacement for ecartis at the end of April :-)
>
> I think it's safe to say that you will have the largest mlmmj
> installation on the internet :-)

... until someone from google comes and thinks
it's a good idea to install it on the search cluster :o)
Guess the opensuse list is more high volume though...

Cheers,
Thomas
