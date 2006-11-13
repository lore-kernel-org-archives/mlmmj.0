From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Mon, 13 Nov 2006 15:00:50 +0000
Subject: Re: mlmmj-process dies with "free(): invalid next size"
Message-Id: <1842.130.83.98.203.1163430050.squirrel@130.83.185.210>
List-Id: <mlmmj.mlmmj.org>
References: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
In-Reply-To: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, November 12, 2006 22:32, Morten K. Poulsen wrote:
>
> Hi Christoph
>
> "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de> wrote:
>> # ~/mlmmj/mlmmj-1.2.12-RC4/src/mlmmj-process -L
>> /var/spool/mlmmj/test \
>> -m /var/spool/mlmmj/test/incoming/647f4170739768df
>> *** glibc detected *** free(): invalid next size (fast): 0x08054a40
>> ***
>> Aborted
>
> Ouch. That smells like a double-free.
>
>> I tested it with the attached mailfile -- error
>> the same file, but without the equal signs -- no error
>
> I am unable to reproduce the error with the attached mailfile. The bug
> might depend on a specific setting. Could you send me (a link to) a
> tarball of the listdir/control/ directory?

I think you are right, strace showed me, it crashes during
the insertion of the prefix.
I forgot to mention this, sorry.

I placed the control directory online here:
https://130.83.185.211/mlmmj/test_control.tar.bz2

>
>> the same file, but only an equal sign as subject -- error.
>
> There was a bug in cleanquotedp() that would cause it to read past the
> end of its buffer, if there was an equal sign within the last two
> bytes of the subject.
>
> I have fixed that issue now:
>
> http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.12_RC4-cleanquotedp.diff
>
> However, I belive that this is a seperate bug. Was the glibc error
> message for this case the same as the error message for the first
> case?

I will test this later. Not much time at the moment...

>
>> Further testing/checking showed, the bug was introduced in
>> RC3, because RC2 runs just fine.
>
> Strange. I don't see how the change in gethdrline() could have
> anything to do with this, but I might be wrong.
>
> Could you run this again (with the patch) with Valgrind?

I did, and it works now for me.

>
> Morten

Ciao
Chris
