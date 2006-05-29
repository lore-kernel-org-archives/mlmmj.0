From: "Jakob Hirsch" <jh@plonk.de>
Date: Mon, 29 May 2006 08:19:35 +0000
Subject: Re: mlmmj code refactoring, for ease of reuse
Message-Id: <48489.127.0.0.1.1148890775.squirrel@ymmv.de>
List-Id: <mlmmj.mlmmj.org>
References: <20060528184943.GB60895@freesbee.wheel.dk>
In-Reply-To: <20060528184943.GB60895@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

S=F8ren Boll Overgaard wrote:

> I would like to create a convenient system for provisioning mlmmj
> mailinglists across a network. That is, I would like to be able to connect
> to a daemon on a given host, and tell it to create a list, subscribe a
> user, unsubscribe a user, etc. This would also make it easier to create
> user interfaces for manipulating mlmmj.
>
> In order to minimize the work involved, I intend to write the thing in C,

I think coding in C does usually not minimize the work. Instead of reusing
the mlmmj code (and therefore having to keep pace with new versions), I'd
rather do it The Unix Way: Write a simple wrapper script/programm (Perl,
Python, Ruby, $whatever, even in C that's no big deal) which reads
commands from a tcp socket or, even easier, reads from STDIN (so you can
use it with inetd), and invokes the corresponding mlmmj binary.
The only reason to do this in a single C programm would be performance,
but I guess you are not going to create thousands of lists per second.


