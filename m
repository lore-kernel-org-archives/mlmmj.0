From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Sun, 28 May 2006 18:49:43 +0000
Subject: mlmmj code refactoring, for ease of reuse
Message-Id: <20060528184943.GB60895@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi,

I wasn't able to find any posts related to this topic, so I am posting to t=
he
list for comments.

I would like to create a convenient system for provisioning mlmmj mailingli=
sts
across a network. That is, I would like to be able to connect to a daemon o=
n a
given host, and tell it to create a list, subscribe a user, unsubscribe a u=
ser,
etc. This would also make it easier to create user interfaces for manipulat=
ing
mlmmj.

In order to minimize the work involved, I intend to write the thing in C, a=
nd=20
I was hoping to reuse mlmmj code, to do most of the actual work.
Unfortunately, lots of mlmmj functionality is hidden away inside various
main() methods, making it quite hard to export the functionality for easy
access from other code.=20

Do you have any suggestions for accessing this functionality, short of copy=
ing
the code verbatim into my own source files?=20

Thanks.

--=20
S=F8ren O.

"Oh, bother" said the Borg, "we've assimilated Pooh".
