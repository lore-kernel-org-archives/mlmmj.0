From: Marco S Hyman <marc@snafu.org>
Date: Fri, 29 Oct 2010 22:36:47 +0000
Subject: Re: [mlmmj] Re: Permission trouble
Message-Id: <CC21115E-FDEC-431D-9EE8-411551290457@snafu.org>
List-Id: <mlmmj.mlmmj.org>
References: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
In-Reply-To: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> other linux flavors as well), but I beg to differ on the nobody/NFS
> story: if you don't want users to have access via NFS, don't map them
> to nobody but just deny the access (even better: don't use NFS, but
> that's my personal opinion).

Alas, it is more than a story.   User nobody is assumed by most
to be a user with limited access on a system.  It is also the
default mapping for UID 0 (root) on unix systems for NFS v2 and
v3.   Any file owned by nobody is therefore open by default to
root clients.  Some docs even suggest doing a mapall=nobody
for security purposes.  That only works if files that can be
accessed by remote NFS clients are NOT owned by nobody.

> Anyway, apache uses nobody on some OS's, postfix uses nobody for stuff
> as well, etc ... "nobody" is an existing account and can thus be used
> as such. What people/programs decide to do with it, is a different
> story.

There is a difference between running as user nobody and creating
files as user nobody.   Some folks get it wrong.  From a system
security point of view it's better to create a user/group per daemon
than re-using nobody.

google "user nobody exploit".   Most of the exploits found are
somewhat benign because they result is a shell login using
the "nobody" credentials.   Now throw in a bunch of files owned
by nobody.   The somewhat benign exploit just got worse.

This is getting far afield from mlmmj.  I'll drop it now.

/\/\arc


