From: Joel Aelwyn <joel@lightbearer.com>
Date: Fri, 09 Sep 2005 07:20:32 +0000
Subject: Re: archive directory only has one message in it
Message-Id: <432137C0.60007@lightbearer.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enigD32D933152AF4B8B049DB4FD"
List-Id: <mlmmj.mlmmj.org>
References: <4320A09D.9060608@diamond.name>
In-Reply-To: <4320A09D.9060608@diamond.name>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD32D933152AF4B8B049DB4FD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Jason Diamond wrote:
> Hi.
> 
> I just created my first mailing list today using mlmmj. Everything seems 
> to be working except for the archive. When I look in the archive 
> directory, it contains one file called "0". The contents of that file 
> are the most recent message posted to the list. The rest of the messages 
> seem to have been lost. Is this normal or might I have something 
> misconfigured?
> 
> I'm using Exim 4 on a Debian Sarge machine. The version of mlmmj I'm 
> running is 1.2.7 since that what was in Debian experimental. The 
> ChangeLog didn't say any bug was fixed regarding archives for 1.2.8 so I 
> haven't tried doing a manual upgrade to that version.
> 
> Any ideas? Thanks.

My copy, from the same source but hand-built to handle a few other tweaks 
(like my variant of "support characters other than + as a separator", which I 
need to tweak slightly given something pointed out on the list), certainly 
doesn't appear to have this issue. However, there is one thing you should 
probably check, given the description of the problem: make sure the 'index' 
file exists, and is writeable, since that appears to be what mlmmj uses to 
keep track of the archive's last posting number (and thus, if it doesn't 
exist, it probably thinks that it should write out '0', and does so... and if 
it can't create the index file, well... lather, rinse, repeat). Did you check 
your logfile to see if it reported anything?

Wishlist items:

*) Detect if the index file fails to write out, and if so, store the message 
in a temporary area with a guaranteed-unique name (it might start with a hash 
of the entire message, and then append '.1', '.2', etc, if there are other 
copies...)

*) Detect a pre-existing file, and don't write to it if one exists (I think 
O_EXCL is generally available these days?) This one is pretty crucial, 
actually, if there is ever any intent of allowing 'mere mortals' to touch any 
part of the queue system, but delivery runs as mlmmj; otherwise it's prone to 
symlink attacks, etc. Very bad. If the file already exists, something has gone 
horribly wrong in the first place, and the message should probably be handed 
as above; assume this is for the humans to untangle, but throw lots of klaxons 
about it (mail the list admin, log it, etc.) so that they know.
-- 
Joel Aelwyn <joel@lightbearer.com>

--------------enigD32D933152AF4B8B049DB4FD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (MingW32)

iD8DBQFDITfAlZCPwGNtWe4RAl+0AJ965M0ITmccqUUj8MVSdZHUCc/qQACdGApg
b0iTEKIVA/lqhuoDJJzuYfc=
=qrX+
-----END PGP SIGNATURE-----

--------------enigD32D933152AF4B8B049DB4FD--
