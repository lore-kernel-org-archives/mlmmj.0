From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 23 Jan 2012 00:37:25 +0000
Subject: Re: [mlmmj] [patch] man page fixes
Message-Id: <4F1CABC5.2040101@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BD224.40908@goirand.fr>
In-Reply-To: <4F1BD224.40908@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 23/01/12 6:13 AM, Thomas Goirand wrote:
> On 01/22/2012 09:56 PM, Ben Schmidt wrote:
>> Hi, Thomas,
>>
>> Thanks for this. I have a few issues/questions.
>>
>> 1. This doesn't apply cleanly to current sources in version control.
>> Would you be able to provide a patch that does?
>
> Sorry, my patch is from MLMMJ 1.2.17, as I didn't upgrade the Debian
> package yet (I'm waiting that you release something).

It's a wise move to wait until a release, of course. Just a little
tricky for me to apply old patches.

>> I can probably resolve the clashes OK, but I know little about groff,
>> so I'm not sure if other man-page changes/additions might also
>> require fixing, so it'd be better if someone who knows more what
>> they're doing could look at it.
>
> The issue is when you have something with dash "like-this". Groff will
> then try to wrap it, and you mind end up with something displayed like-
> this (eg: with a return to the next line, when you really don't want
> one). Adding a \ in front of the - makes it so that groff wont do the
> word break.

Thanks a lot for that detailed clarification. I'll do a semi-automated
find-replace on the current man pages and escape all the dashes.

>> 2. My system (Mac OS X) doesn't like the UTF-8 encoding. The existing
>> Latin-1 encoding works for me (in fact, the =F8 is replaced by just an o
>> for me automagically somewhere).
>
> All man pages should be using UTF-8 in Debian, and I believe that you
> should have your mac to use UTF-8 if possible. If not, do we care? Is
> MLMMJ used in the Apple platform?
>
> Also, what type of encoding do you use? Why is your encoding more valid
> than UTF-8? What if the user is let's say Chinese, Russian, or who knows?
>
> It really doesn't make sense to use any type of specific encoding,
> everyone should be using UTF-8, IMO.

I agree, it makes sense for everyone to use UTF-8 these days. However,
I'd prefer not to expect or assume that. I didn't mention my system
because I think it is particularly important, but simply to point out
that there is at least one system out there that this change will break.
There may be others. I would like to find a way to make this change that
won't break any system. Does anyone know how to do this, or another
project that has solved this problem whose work we can copy or imitate?

Cheers,

Ben.




