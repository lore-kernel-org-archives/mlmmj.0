From: Christian Laursen <xi@borderworlds.dk>
Date: Thu, 20 Dec 2007 15:44:34 +0000
Subject: Re: php-admin based on perl-admin
Message-Id: <ygf8x3pweu5.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <019e01c84317$5eac2d30$4801a8c0@w2251702>
In-Reply-To: <019e01c84317$5eac2d30$4801a8c0@w2251702>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

"Oliver Gading" <og-ml@gading.de> writes:

> I have converted the perl-admin source to php.
> It's based on the version from Franky Van Liederkerke which I found in
> following posting:
> http://mlmmj.mmj.dk/archives/mlmmj/2007-08/1122.html
>
> Unfortunately I am to busy to write a README.
> It works for me without problems.
>
> For optimizing security I would need some help:
> In my server environment I needed to set "SuexecUserGroup nobody nogroup"
> (on Debian Etch postfix delivers as user nobody). I did not work it out how
> to share the mlmmj list directory with a different group. Even when I setgid
> the list directory (and the directories below) to the shared group.
> Everytime (while subscribing/unsubscribing etc.) mlmmj tries to use files
> which it is not the owner of, mlmmj writes a permission problem to the mail
> log.

If the subscribers directories (subscribers.d, digesters.d and
nomailsubs.d) are group writable mlmmj-sub and mlmmj-unsub will change
its gid to the group of the relevant directory when subscribing or
unsubscribing.

So no setgid is neccesary. Just chmod g+w and chgrp to the shared
group.

-- 
Christian Laursen
