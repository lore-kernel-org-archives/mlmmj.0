From: Thomas Goirand <thomas@goirand.fr>
Date: Sat, 07 Feb 2009 13:10:02 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <498D882A.6040703@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:
> * Thomas Goirand <thomas@goirand.fr> [Feb 07. 2009 10:17]:
>> Just one thing: what is in execlp() that is not in the system exec()
>> function?
> 
> Have a look at exec(3):
> 
> DESCRIPTION
>    The  exec()  family  of functions replaces the current process
>    image with a new process image.  The functions described in this
>    manual page are front-ends for execve(2).  (See the manual page
>    for execve(2) for further details about the replacement of the
>    current process image.)
> 
> There actually exist no exec() call. You might be thinking of system()?

Forget it, I thought execlp() was internal to MLMMJ, but I have found my
answer, it's documented.

Anyway, my question remains... Is the procedure like this:

- rename moderated with:
mv hash hash.sending

- call the following:
mlmmjsend -L listdir -m hash.sending

Also, pops to my mind: why should I rename the moderated message? Is it
mandatory? Should the moderation web interface delete the moderated
message with unlink after the call to mlmmjsend?

Thomas
