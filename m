From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Wed, 06 Oct 2010 11:40:12 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <AANLkTimFLA-Ouap8q+3OZLyoJZrNfHpNznc-hWdq0180@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="001636831ee28b138e0491f13d99"
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
To: mlmmj@mlmmj.org

--001636831ee28b138e0491f13d99
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 6, 2010 at 1:07 PM, Christian Laursen <xi@borderworlds.dk>wrote=
:

> On 10/06/10 12:50, Mads Martin J=F8rgensen wrote:
>
>> On Wed, Oct 6, 2010 at 9:55 AM, Ben Schmidt
>> <mail_ben_schmidt@yahoo.com.au>  wrote:
>>
>>> I believe it does remove trailing whitespaces, but that's not a
>>>> whitespace, that's a carriage return.
>>>>
>>>
>>> I think that's a whitespace. Non-linear, but still whitespace.
>>>
>>
> POSIX as well as perl seem to classify it as whitespace:
> http://en.wikipedia.org/wiki/Regular_expression#POSIX_character_classes
>
>
> yeah, but "whitespace" is an interpreted thing, I mean it is programmed
into perl to behave like that. C doesn't work that way, unless you can find
a similar standard function to search/replace as the one in perl? So: I
would say: just remove all illegal characters from the email, but you might
want to allow all UTF-8 characters ...

Franky

--001636831ee28b138e0491f13d99
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 6, 2010 at 1:07 PM, Christian Laursen <span dir=3D"ltr">&lt;<a =
href=3D"mailto:xi@borderworlds.dk">xi@borderworlds.dk</a>&gt;</span> wrote:=
<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;">
<div class=3D"im">On 10/06/10 12:50, Mads Martin J=F8rgensen wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
On Wed, Oct 6, 2010 at 9:55 AM, Ben Schmidt<br>
&lt;<a href=3D"mailto:mail_ben_schmidt@yahoo.com.au" target=3D"_blank">mail=
_ben_schmidt@yahoo.com.au</a>&gt; =A0wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><blockquote class=
=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;">

I believe it does remove trailing whitespaces, but that&#39;s not a<br>
whitespace, that&#39;s a carriage return.<br>
</blockquote>
<br>
I think that&#39;s a whitespace. Non-linear, but still whitespace.<br>
</blockquote></blockquote>
<br></div>
POSIX as well as perl seem to classify it as whitespace:<br>
<a href=3D"http://en.wikipedia.org/wiki/Regular_expression#POSIX_character_=
classes" target=3D"_blank">http://en.wikipedia.org/wiki/Regular_expression#=
POSIX_character_classes</a><br>
<br>
<br></blockquote><div>yeah, but &quot;whitespace&quot; is an interpreted th=
ing, I mean it is programmed into perl to behave like that. C doesn&#39;t w=
ork that way, unless you can find a similar standard function to search/rep=
lace as the one in perl? So: I would say: just remove all illegal character=
s from the email, but you might want to allow all UTF-8 characters ...<br>
<br>Franky<br></div></div>

--001636831ee28b138e0491f13d99--

