From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 05 Jul 2009 02:39:32 +0000
Subject: Subscribing a big amount of users (and moderation only by sender
Message-Id: <4A501264.4060106@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Mads Martin J=F8rgensen wrote:
> This functionality doesn't exist in mlmmj right now. BUT;
>=20
> It would be quite easy to implement and if noone else cooks up a patch,
> I'll personally make one before Friday.

+1:

I'd love to have this functionality. We do regularly inform all of the
customers of a given Xen server using MLMMJ lists with subscribers list
auto managed by our panel. When one of the administrator wishes to send
a message to all customers, he's going to confirm the sending by
himself, just right after the sending, and it's a bit useless that other
moderators receive the moderation request.

Also, just a quick question. When we have thousands of customers, using
mlmmj-subscribe thousands of times just doesn't make sense and is too
slow (maybe just because of the process forks)... Because I wanted to
avoid doing so many fork, I do rebuild the subscribers.d content myself,
using our internal data in MySQL, and writing the folder content myself
with PHP. Is that an issue? If yes, would it be possible to have some
kind of API (like a binary shell tool) so I could give a config file to
use as a (new) subscriber list? Or even better, have a new option in
mlmmj-subscribe like:

--subscriber-list /tmp/all-customers-WX2OIA5Q

Obviously, I'd use a tmp file created using mktemp here, to avoid
symlink attacks.

Thomas


