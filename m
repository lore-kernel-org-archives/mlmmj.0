From: POLONKAI Gergely <polesz@w00d5t0ck.info>
Date: Tue, 24 Apr 2007 08:38:11 +0000
Subject: Re: Command died with status 1: "/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"
Message-Id: <462DC1F3.6090800@w00d5t0ck.info>
List-Id: <mlmmj.mlmmj.org>
References: <200704241232.36899.bkv@ratm.ru>
In-Reply-To: <200704241232.36899.bkv@ratm.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

The error itself, and so the possible workout is in the message: You
have to run mlmmj-recieve as root, or as the user who owns
/var/spool/mlmmj/mlmmj-test. I don't really know postfix, and so I don't
know how to set it up to run a command with another user id, so I would
say to get the user who runs postfix (maybe postfix user?), and do chown
-R postfixuser /var/spool/mlmmj/mlmmj-test

Брызгалов Константин Викторович írta:
> Hello!
> I use Gentoo 2006.1, mlmmj version 1.2.14, postfix 2.4.0
> Mlmmj tuned by instruction on http://mlmmj.mmj.dk/
>
> When i sent mail to mlmmj-test@mydomain , I get error:
>
> This is the mail system at host mx.mydomain
>
> I'm sorry to have to inform you that your message could not
> be delivered to one or more recipients. It's attached below.
>
> For further assistance, please send mail to postmaster.
>
> If you do so, please include this problem report. You can
> delete your own text from the attached returned message.
>
>                    The mail system
>
> <mlmmj-test@mydomain>: Command died with status 1: "/usr/bin/mlmmj-recieve
>     -L /var/spool/mlmmj/mlmmj-test/". Command output: Have to invoke either as
>     root or as the user owning listdir
>
> What reason of this message? How fix this error?
>
> Sorry for my english!
>
>   
