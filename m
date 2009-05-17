From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Sun, 17 May 2009 19:09:39 +0000
Subject: Re: Bug in mlmmj-maintd: notice on non-existing digests
Message-Id: <1242587379.4426.10.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <34372.172.16.32.1.1242389668.squirrel@130.83.185.211>
In-Reply-To: <34372.172.16.32.1.1242389668.squirrel@130.83.185.211>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Chris,

On Sun, 2009-05-17 at 20:45 +0200, Christoph Wilke wrote:
> On Sat, May 16, 2009 18:16, Morten K. Poulsen wrote:
> > It should not log any notices, just because a given list has no
> > digest subscribers. Which notice does it show?
> 
> this one:
> 
> May 17 18:00:01 strange /usr/bin/mlmmj-maintd[17651]: send_digest.c:229:
> Notice: Could not open std mail digest: No such file or directory

That indicates that your listtexts are out of sync with your mlmmj
binaries.

Sure, mlmmj does not need to prepare a digest mail in case a list has
zero digest subscribers, but checking for that would complicate things a
bit (preparation is done in mlmmj-maintd, sending is done in
mlmmj-send).


There are a few ways you can make this notice disappear:


1) touch LISTDIR/control/nodigesttext

This will make mlmmj stop looking for a text to prepend to each digest
mail.


2) touch LISTDIR/text/digest

This will install an empty digest text.


3) cp /usr/local/share/mlmmj/text.skel/de/digest LISTDIR/text/

Like #2, but will install the real digest text, just in case you will
ever want to enable digest mails.


Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

