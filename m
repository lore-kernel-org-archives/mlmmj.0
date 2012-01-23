From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 23 Jan 2012 02:06:57 +0000
Subject: Re: [mlmmj] [patch] man page fixes
Message-Id: <4F1CC0C1.2070402@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BD224.40908@goirand.fr>
In-Reply-To: <4F1BD224.40908@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

>> All man pages should be using UTF-8 in Debian, and I believe that you
>> should have your mac to use UTF-8 if possible. If not, do we care? Is
>> MLMMJ used in the Apple platform?
>>
>> Also, what type of encoding do you use? Why is your encoding more valid
>> than UTF-8? What if the user is let's say Chinese, Russian, or who knows?
>>
>> It really doesn't make sense to use any type of specific encoding,
>> everyone should be using UTF-8, IMO.
>
> I agree, it makes sense for everyone to use UTF-8 these days. However,
> I'd prefer not to expect or assume that. I didn't mention my system
> because I think it is particularly important, but simply to point out
> that there is at least one system out there that this change will break.
> There may be others. I would like to find a way to make this change that
> won't break any system. Does anyone know how to do this, or another
> project that has solved this problem whose work we can copy or imitate?

I think I've solved this.

It seems Debian is non-standard in requiring UTF-8 man pages, as Groff
does not support UTF-8 input:
http://www.gnu.org/software/groff/manual/html_node/Input-Encodings.html

However, Groff supports character escapes which can be used compatibly:
http://manpages.ubuntu.com/manpages/gutsy/man7/groff_char.7.html
http://manpages.debian.net/cgi-bin/man.cgi?query=3Dgroff_char&apropos=3D0&s=
ektion=3D0&manpath=DEbian+6.0+squeeze&format=3Dhtml&locale=3Den

So I'll replace =F8 with \[/o] and everything should be good, though a
little ugly.

Cheers,

Ben.




