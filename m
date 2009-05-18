From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Mon, 18 May 2009 10:46:51 +0000
Subject: Re: Bug in mlmmj-maintd: notice on non-existing digests
Message-Id: <51876.172.16.32.1.1242643611.squirrel@130.83.185.211>
List-Id: <mlmmj.mlmmj.org>
References: <34372.172.16.32.1.1242389668.squirrel@130.83.185.211>
In-Reply-To: <34372.172.16.32.1.1242389668.squirrel@130.83.185.211>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hej,

On Sun, May 17, 2009 21:09, Morten K. Poulsen wrote:
> Hi Chris,
>
> On Sun, 2009-05-17 at 20:45 +0200, Christoph Wilke wrote:
>> On Sat, May 16, 2009 18:16, Morten K. Poulsen wrote:
>> > It should not log any notices, just because a given list has no
>> > digest subscribers. Which notice does it show?
>>
>> this one:
>>
>> May 17 18:00:01 strange /usr/bin/mlmmj-maintd[17651]: send_digest.c:229:
>> Notice: Could not open std mail digest: No such file or directory
>
> That indicates that your listtexts are out of sync with your mlmmj
> binaries.

The ability to read helps... You are perfectly right.

[...]
>
> There are a few ways you can make this notice disappear:
>
>
> 1) touch LISTDIR/control/nodigesttext
>
> This will make mlmmj stop looking for a text to prepend to each digest
> mail.
>
>
> 2) touch LISTDIR/text/digest
>
> This will install an empty digest text.
>
>
> 3) cp /usr/local/share/mlmmj/text.skel/de/digest LISTDIR/text/
>
> Like #2, but will install the real digest text, just in case you will
> ever want to enable digest mails.

I did 1 and 3 and everything works fine now.
Thank you very much for your quick help!
And forgive me my hasty bug yelling...

Regards
Chris
