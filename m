From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Sun, 07 Jun 2009 12:37:23 +0000
Subject: Re: Patch to extend list command
Message-Id: <1244378243.5381.2.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
In-Reply-To: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Chris,

On Mon, 2009-06-01 at 20:50 +0200, Christoph Wilke wrote:
> I noticed recently that the list command supports only subscribers but
> not digesters and nomailers.

Oh, I didn't know that...

> So I plugged together a simple patch to support this.
> It's fairly straightforward, but I don't have a test system so if
> someone might have a look at it and does some tests would be really
> nice.

It looks clean, but would you mind moving the code to a function, so we
don't have three copies of the same code?

Happy Hacking,
Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


