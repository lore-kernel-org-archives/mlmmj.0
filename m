From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 24 May 2005 13:34:42 +0000
Subject: Re: Automatic mailing list creation, something like Google Groups
Message-Id: <20050524133442.GB7071@mopo.webdmz.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <6.2.1.2.2.20050521154015.02b52830@postino.programmazione.it>
In-Reply-To: <6.2.1.2.2.20050521154015.02b52830@postino.programmazione.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, May 23, 2005 at 10:19:19AM +0200, Filippo Fadda wrote:
> At 13:07 22/05/2005, you wrote:
> >* Filippo Fadda <fifadd@tin.it> [May 21. 2005 15:56]:
> >> I need that any "valid" mail sent to peaceandlove mailing list launch a
> >> PHP script that insert into the related group database the mail itself,
> >> like Google Groups works.
> >
> >This might need a wrapper script around mlmmj-process.

It could probably also be done with an alias like

peaceandlove: "|/usr/bin/php /path/to/script.php","|/usr/bin/mlmmj-recieve -L
/var/spool/mlmmj/peaceandlove"

But the php script MUST output the mail.


Else you could take the wrapper approach and make a list.sh like

tmp=`mktemp /tmp/list.sh-XXXXXX`
cat >"$tmp"
/usr/bin/php /path/to/script.php <"$tmp"
/usr/bin/mlmmj-recieve -L "/var/spool/mlmmj/$1" <"$tmp"

and have the alias be something like

peaceandlove: "|/usr/local/bin/list.sh peaceandlove"

I do that for newsletters which need to fetch recipient lists from a database.

> >Take mlmmj-make-ml.sh and modify it to fit your needs.
> 
> So do you think that the NFS link between web server and mail server is the
> only possible solution?
> Is there some other method? Is it possibile for example configure a .qmail to
> serve this purpose?

Or have a secret alias (with a password in some header) and make that alias a
shell script which creates the list. Then the web server can send a mail to
this alias, when a user creates a new group.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
