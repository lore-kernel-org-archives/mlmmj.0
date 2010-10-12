From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 12 Oct 2010 02:33:11 +0000
Subject: Re: [mlmmj] mlmmj-maintd recursively
Message-Id: <1286850791.2629.2.camel@Nokia-N900-42-11>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
In-Reply-To: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


----- Original message -----
> > find /var/spool/mlmmj/ -mindepth 1 -maxdepth 1 -type d \
> >     -exec /usr/bin/mlmmj-maintd -F -d {} \;
> 
> Actually, on my system it looks like the trailing slash should be
> omitted, too, or there is a double slash in the argument passed to
> mlmmj-maintd. Probably doesn't matter, but is a little unconventional,
> so I'll take the slash out of the docs.
> 
> Ben.

Using the shell, you add a \
to tell that you want to go to the line but \
you haven't finished your sentence... :)

Thomas



