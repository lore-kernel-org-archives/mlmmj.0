From: Thomas Goirand <thomas@goirand.fr>
Date: Thu, 27 Jan 2011 20:04:44 +0000
Subject: [mlmmj] New features idea: mlmmj-make-ml enhancement and listownersonlypost
Message-Id: <4D41CFDC.7060704@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quite often, I create a list, only so that I can send to a bunch of
users using MLMMJ, in a one way only, the following tunables activated:

- subonlypost
- moderated
- noarchive

This leads me to believe that it would be cool to allow to set
parameters for the tunables in mlmmj-make-ml. Something like:

mlmmj -subonlypost \
	+moderated \
	-moderators=mail@example.com,ceo@example.net \
	+archive

so that we could change the defaults directly at mailing list creation.
+ would create the boolean tunable, - removes it. In a list tunable, we
could list items after the = sign (see the -moderators parameter above).

The above is only an example, we could imagine another implementation.
Like -t, as in tunable, the followed by the tunable name, then
eventually a parameter. Something like this:

mlmmj -t subonlypost on \
	-t moderated on \
	-t moderators mail@example.com,ceo@example.net \
	-t archive on

As mlmmj-make-ml is written in sh, I don't think it would be hard to
implement the above, but I would like to know what others think of it
before I try to do it.

Also, tt would be cool also to have an option to allow only list owners
to send (self)moderated messages to the list. This tunable could be
called "listownersonlypost" for example. That would be awesome too. But
I don't know the internal C code of MLMMJ. Where would that be
implemented? Is there a way to do this already that I missed?

Just my 2 cents of idea...

Thomas

