From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 12 Nov 2007 21:41:15 +0000
Subject: Re: [RFC] misc moderation patches
Message-Id: <1194903675.6200.55.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <20070705195719.GK5523@suse.de>
In-Reply-To: <20070705195719.GK5523@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, 2007-11-12 at 23:34 +0300, Alexander Kardailsky wrote:
>   Yes, you rejected small changes to if clauses. But later I sent the
>   whole function that don't needed these changes. It doesn't affect
>   old possibilities. It just adds new ones.

And it breaks in some cases.

>   Could you please give me an example with a problem? Thanks.

$ echo 'Delivered-To: test-list+' >/tmp/mail
$ ./mlmmj-process -L /home/mopo/mlmmj-test/ -m /tmp/mail
$ echo $?
1
$ tail -n 1 /var/log/mail.err 
Nov 12 22:38:34 mopo-laptop ./mlmmj-process[13111]: mlmmj-process.c:327:
malloc(-134578623) failed! Bailing out!: Cannot allocate memory

Morten

