From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 22 Jan 2012 19:13:21 +0000
Subject: Re: [mlmmj] [patch] man page fixes
Message-Id: <4F1C5FD1.6030407@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BD224.40908@goirand.fr>
In-Reply-To: <4F1BD224.40908@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 01/22/2012 09:56 PM, Ben Schmidt wrote:
> Hi, Thomas,
>=20
> Thanks for this. I have a few issues/questions.
>=20
> 1. This doesn't apply cleanly to current sources in version control.
> Would you be able to provide a patch that does?

Sorry, my patch is from MLMMJ 1.2.17, as I didn't upgrade the Debian
package yet (I'm waiting that you release something).

> I can probably resolve
> the clashes OK, but I know little about groff, so I'm not sure if other
> man-page changes/additions might also require fixing, so it'd be better
> if someone who knows more what they're doing could look at it.

The issue is when you have something with dash "like-this". Groff will
then try to wrap it, and you mind end up with something displayed like-
this (eg: with a return to the next line, when you really don't want
one). Adding a \ in front of the - makes it so that groff wont do the
word break.

If you check with lintian (which is a Debian package checking tool), it
will warn with a message like "hyphen-instead-of-minus" warning. The
extended description in lintian is as follow:

    This manual page seems to contain a hyphen where a minus sign was
intended. By default, "-" chars are interpreted as hyphens (U+2010) by
groff, not as minus signs (U+002D). Since options to programs use minus
signs (U+002D), this means for example in UTF-8 locales that you cannot
cut and paste options, nor search for them easily. The Debian groff
package currently forces "-" to be interpreted as a minus sign due to
the number of manual pages with this problem, but this is a
Debian-specific modification and hopefully eventually can be removed.

    "-" must be escaped ("\-") to be interpreted as minus. If you really
intend a hyphen (normally you don't), write it as "\(hy" to emphasise
that fact. See groff(7) and especially groff_char(7) for details, and
also the thread starting with
http://lists.debian.org/debian-devel/2003/debian-devel-200303/msg01481.html

    If you use some tool that converts your documentation to groff
format, this tag may indicate a bug in the tool. Some tools convert
dashes of any kind to hyphens. The safe way of converting dashes is to
convert them to "\-".

    Because this error can occur very often, Lintian shows only the
first 10 occurrences for each man page and give the number of suppressed
occurrences. If you want to see all warnings, run Lintian with the
-d/--debug option.

    Refer to /usr/share/doc/groff-base/README.Debian and the
groff_char(7) manual page for details.

    Severity: wishlist, Certainty: possible

    Check: manpages, Type: binary

> 2. My system (Mac OS X) doesn't like the UTF-8 encoding. The existing
> Latin-1 encoding works for me (in fact, the =F8 is replaced by just an o
> for me automagically somewhere).

All man pages should be using UTF-8 in Debian, and I believe that you
should have your mac to use UTF-8 if possible. If not, do we care? Is
MLMMJ used in the Apple platform?

Also, what type of encoding do you use? Why is your encoding more valid
than UTF-8? What if the user is let's say Chinese, Russian, or who knows?

It really doesn't make sense to use any type of specific encoding,
everyone should be using UTF-8, IMO.

> I guess this is locale-related. This
> means we need to figure out how to do an encoding conversion appropriate
> to the host system as part of the build/install process, or find a groff
> directive that makes it interpret the file as a particular encoding, or
> something, rather than just change the encoding. I'm happy to change the
> encoding to UTF-8 if we can figure out how to make all systems interpret
> the files properly. Any ideas?

Just fix your system, it should be using UTF-8 anyway.

> 3. Could we keep the separate issues in separate patches?

Feel free to apply what you think is ok, I'll anyway fix again in Debian
if it's still not correct.

Thomas

