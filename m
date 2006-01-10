From: "Jakob Hirsch" <jh@plonk.de>
Date: Tue, 10 Jan 2006 09:03:38 +0000
Subject: Re: about mlmmj / sql support and other features ....
Message-Id: <48582.127.0.0.1.1136883818.squirrel@ymmv.de>
List-Id: <mlmmj.mlmmj.org>
References: <43C2EBB1.7090107@wanadoo.fr>
In-Reply-To: <43C2EBB1.7090107@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

S=E9bastien CRAMATTE wrote:

> But after how mlmmj can select user list stored in SQL or LDAP ?

As with any software using plain text configuration files, you can easily
create a script for exporting config information from any source.
For doing this directly in mlmmj, an abstraction layer for accessing
config information should be inserted, which means a lot of code had to be
rewrited. It's not worth the trouble, I'd say.

> The problem is store configuration by list.

What is the problem about that?

> Moreover why Maildir format is not used to store archive ?

The messages are single files, so it's maildir-like, only the directory
structure (cur,new,tmp) is missing. If you need this, you do this with a
symlink from some other directory (and have all your lists as Maildir++
folders). But you should make sure that nothing is changed (e.g. the usual
Maildir flags), as mlmmj may not react very well on that.

