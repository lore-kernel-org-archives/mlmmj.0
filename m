From: Martin Koch Andersen <martin@925.dk>
Date: Thu, 28 Oct 2010 21:17:53 +0000
Subject: [mlmmj] Permission trouble
Message-Id: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

I have a little permission trouble setting up mlmmj alongside perl-admin.

I use postfix, which puts files as nobody. I have apache which runs as www.
I followed the instructions of the README file of both mlmmj and perl-admin.
www and nobody users have been added to group mlmmj.

I did:

chown -R nobody:mlmmj listdir/
chmod -R g+rw listdir/

I do _not_ use postfix transports. But instead regular virtual maps and aliases.

Problem is:
If I add a user using perl-admin I can not un-subscribe using mlmmj (sending list+unsubscribe@ mail).

I get the standard "you're not subscribed" mail in return. There are no permission errors in any logs.

If I add a user using list+subscribe@ mail, unsubscribe works just fine using list+unsubscribe@ mail or perl-admin.

subscribers.d>
total 6
drwxrwxr-x  15 nobody  mlmmj  512 Oct 28 22:32 ..
-rw-rw----   1 www     mlmmj   14 Oct 28 22:47 m
drwxrwxr-x   2 nobody  mlmmj  512 Oct 28 22:47 .

So if group of a file in subscribers.d/ is www unsubscribe by sending a mail to list+unsubscribe@ does not work.

list directory is owned by nobody:mlmmj. And as I read man "mlmmj-unsub", mlmmj-unsub should use that user, and hence unsubscribe should work.

PS: Typo (I think) in "man mlmmj-unsub": mlmmj-sub (instead of mlmmj-unsub) in SYNOPSIS.

-- 
Martin Koch Andersen
http://925.dk

