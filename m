From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 15 Oct 2014 21:53:07 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <543EECC3.4000108@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> Oct 15 18:45:22 cloud smrsh: uid 8: attempt to use "mlmmj-receive -L /var/spool/mlmmj/listname" (stat failed)

> Unfortunately, I'm now getting the following bounce-error message:
>
>     ----- The following addresses had permanent fatal errors -----
> "|mlmmj-receive -L /var/spool/mlmmj/listname"
>      (reason: 1)
>      (expanded from:<listname@mydomain.com>)

> Have to invoke either as root or as the user owning listdir
> 554 5.3.0 unknown mailer error 1

> The symlinks and the actual mlmmj-xxxx files are all chmod as 755, but
> I'm not sure how or where to effect a permissions change to get
> sendmail to "invoke" mlmmj-receive with the proper permissions.

> As you can see, this is progress from where I was before... any ideas
> on how I should address the permissions error coming from
> mlmmj-receive?

This may do it (but obviously understand it; don't execute it blindly!).
8 is the UID/user indicated in the sendmail log.

sudo chown 8 /var/spool/mlmmj/listname

Make sure Mlmmj through smrsh can also get to that dir (do you need more
symlinks, e.g. because you're chrooted?).

Ben.




