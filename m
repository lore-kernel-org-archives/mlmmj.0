From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 05 Aug 2014 01:36:11 +0000
Subject: Re: [mlmmj] issue with umlauts in message body
Message-Id: <53E0350B.9040608@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <53DBEBE8.7000903@4-mail.net>
In-Reply-To: <53DBEBE8.7000903@4-mail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

I have been collaborating with Paul Fariello on this issue:

http://mlmmj.org/bugs/bug.php?idI

You may like to apply one of his patches or assist in getting the patch to a 
standard where it can be included in Mlmmj if you have development skills.

Ben.



On 2/08/14 5:35 AM, philipp@4-mail.net wrote:
> hey there.
> i decided to setup an openbsd 5.5 instance running opensmtpd and the most recent,
> packaged version of mlmmj thats available in
> openbsd's package system (i.e. version 1.2.18.0).
> i was pretty surprised how easy it was to setup a mailing list with mlmmj, so
> kudos to everyone who made this possible.
> after some testing i discovered that when i send emails to my list (let's call it
> <list>) containing umlauts, all list members seem to receive
> some kind of mangled version of the original mail. looking at the message in
> <list>/archive/<number>, i get:
> --[...]--
> Content-Type: text/plain; charset=UTF-8; format=flowed
> Content-Transfer-Encoding: 8bit
>
> äöü
> --
> with the umlauts correctly displayed by the terminal. (hexdump: c3 a4 c3 b6 c3 bc)
>
> if i however look at the message as it was received by the list members on their
> respective clients, i get:
> --[...]--
>
> Content-Type: text/plain; charset=UTF-8; format=flowed
> Content-Transfer-Encoding: 8bit
> X-Kolab-Scheduling-Message: FALSE
>
> C$C6C<
> --
>
> i'm not quite sure what causes those umlauts to not get send properly.
> is this an issue with my system's setup? is opensmtpd to blame or rather mlmmj-send?
>
> kind regards,
> philipp
>
>
>
>
>

