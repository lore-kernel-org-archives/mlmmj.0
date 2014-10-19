From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 19 Oct 2014 20:26:17 +0000
Subject: Re: [mlmmj] bulk-adding emails to a mlmmj email list
Message-Id: <54441E69.9020604@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <5441875E.3050403@vlsc.org>
In-Reply-To: <5441875E.3050403@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

> You can just put it in files in the subscribers.d/ directory, yes. You
> shouldn=E2=80=99t need the same sorting as mlmmj does. Any file will be r=
ead
> as a subscriber file. If you do want mlmmj-sub to do it, just put all
> addresses in a file and run through it with a simple bash script
> 1-liner:
>
> $ for ADDR in `cat file-with-addr.txt`; do /path/to/mlmmj-sub -L dir -l $=
ADDR

Slight tweak:

mlmmj-sub -L dir -f -q -s -a $ADDR

I would recommend making a script that calls mlmmj-sub rather than
manipulating the files manually. It probably won't break delivery, but
it probably would break unsubscription/bounce-processing/etc. if they're
not in the right file.

Also check out the contrib directory in the distribution for existing
web interfaces; I believe one or two of them allow you to bulk-subscribe
users. Not sure this is quite what you want, but it's another option.

Ben.




