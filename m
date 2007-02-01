From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Thu, 01 Feb 2007 22:06:08 +0000
Subject: Re: Additional Information for FC6/Sendmail problem
Message-Id: <c4750ce7a125488af740e5dee8981cd2@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Cameron,

"Cameron B. Prince" <cplists@princeservices.com> wrote:
> /bin/sh: /usr/bin/mlmmj-maintd -F -L /var/spool/mlmmj/tesla/:
> No such file or directory

What is the exact line in your crontab? It looks like you quoted the whole line.

> Jan 23 00:09:04 p2 /usr/bin/mlmmj-send[11378]: mlmmj-send.c:243: Error in
> MAIL FROM. Reply = [553 5.3.0
> <test+bounces-confsub-770e4345edd654b-cameron=mydomain.com@domain.com>...
> User Unknown^M ]: No such file or directory

Ignore the "No such file or directory" part. It appears that your sendmail (which handles domain.com, I presume) does not know the user "test@domain.com" and therefore rejects the mail. Is test@domain.com the alias for the list?

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

