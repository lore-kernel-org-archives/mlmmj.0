From: Marco S Hyman <marc@snafu.org>
Date: Fri, 29 Oct 2010 19:03:59 +0000
Subject: Re: [mlmmj] Re: Permission trouble
Message-Id: <38A01A99-61AF-498F-BCF9-88E78AC2410B@snafu.org>
List-Id: <mlmmj.mlmmj.org>
References: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
In-Reply-To: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> On FreeBSD at least, and with mlmmj executed from a postfix aliases file (owned by root), the mlmmj process is started as nobody:nobody (default_privs).
> Only the primary group of user nobody is read (by postfix local), thus adding user nobody to additional groups has no effect (restart or not).
> 
> Instead I've added user www to group nobody, and made listdirs recursively owned by nobody:nobody with group write permissions. Now it all works.

Do you use NFS?  Nobody is magic to NFS and should never really be
used by anyone outside of NFS.   If your mail host acts as an NFS
server you may have given access to your mail files to every NFS
client.

Ideally, NOTHING should be owned by nobody.  It's an ID that NFS
users are mapped to when their client ID doesn't exist or isn't
allowed on the server.  If something is owned by nobody you've given
control of that file to those NFS client users.

Folks thing that nobody is somehow safe and start using nobody in
various daemons for safety.  What they've actually done is set the
daemons up to share ownership of files that really shouldn't be
shared.

/\/\arc



