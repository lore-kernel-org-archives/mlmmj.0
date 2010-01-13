From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Wed, 13 Jan 2010 16:13:40 +0000
Subject: Re: 'Not metoo' feature
Message-Id: <60567dcc1001130813v2be25b2et3d38943c7c0ac896@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="000e0cd1ff3ec15db1047d0e0d7d"
List-Id: <mlmmj.mlmmj.org>
References: <4B4DDEAC.5030103@yahoo.com.au>
In-Reply-To: <4B4DDEAC.5030103@yahoo.com.au>
To: mlmmj@mlmmj.org

--000e0cd1ff3ec15db1047d0e0d7d
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 13, 2010 at 3:54 PM, Ben Schmidt
<mail_ben_schmidt@yahoo.com.au>wrote:

> Hi!
>
> I think I've decided now that I will be switching to mlmmj for my mailing
> lists. Not all that big or exciting, but they keep my part of the world a
> little smoother than without them, and the easier the software makes it for
> me to manage them, the better.
>
> As I think through the things in Mailman that I used to use before deciding
> I'd like to switch, a feature I'd be interested in having is a 'not metoo'
> feature. This means when the manager sends out an email it omits the sender
> from the distribution list.
>
> How easy would this be to add? I'd be happy to have a shot at doing it
> myself, though I'd love some pointers as to which part of the source code to
> look at. And of course, I wouldn't complain if someone else would like to do
> it, but obviously I don't expect that!
>
>
Well, I've looked a bit at the code before, and I think it's quite easy to
accomplish: create a new option for activation/deactivation of this (would
result in the touch of a file) and if present, compare the senders email
with the ones in the list while looping and sending, and ommit sending when
it is equal. Would be worth a shot trying to code, since I've run out of
episodes of "One Piece" to look at :-)
Let me see what I can come up with this evening.

Btw, the latest version is at http://mlmmj.mmj.dk/files/, there's a bit of
mixing up going on here: the website is http://mlmmj.org, the mailing list
archive there points to http://mlmmj.org/archive/index.html, but the archive
up to date is at http://mlmmj.org/archive/mlmmj/date.html

Franky

--000e0cd1ff3ec15db1047d0e0d7d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Jan 13, 2010 at 3:54 PM, Ben Schmidt <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:mail_ben_schmidt@yahoo.com.au">mail_be=
n_schmidt@yahoo.com.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt =
0pt 0.8ex; padding-left: 1ex;">
Hi!<br>
<br>
I think I&#39;ve decided now that I will be switching to mlmmj for my maili=
ng lists. Not all that big or exciting, but they keep my part of the world =
a little smoother than without them, and the easier the software makes it f=
or me to manage them, the better.<br>

<br>
As I think through the things in Mailman that I used to use before deciding=
 I&#39;d like to switch, a feature I&#39;d be interested in having is a &#3=
9;not metoo&#39; feature. This means when the manager sends out an email it=
 omits the sender from the distribution list.<br>

<br>
How easy would this be to add? I&#39;d be happy to have a shot at doing it =
myself, though I&#39;d love some pointers as to which part of the source co=
de to look at. And of course, I wouldn&#39;t complain if someone else would=
 like to do it, but obviously I don&#39;t expect that!<br>

<br></blockquote><div><br>Well, I&#39;ve looked a bit at the code before, a=
nd I think it&#39;s quite easy to accomplish: create a new option for activ=
ation/deactivation of this (would result in the touch of a file) and if pre=
sent, compare the senders email with the ones in the list while looping and=
 sending, and ommit sending when it is equal. Would be worth a shot trying =
to code, since I&#39;ve run out of episodes of &quot;One Piece&quot; to loo=
k at :-)<br>
Let me see what I can come up with this evening.<br><br>Btw, the latest ver=
sion is at <a href=3D"http://mlmmj.mmj.dk/files/">http://mlmmj.mmj.dk/files=
/</a>, there&#39;s a bit of mixing up going on here: the website is <a href=
=3D"http://mlmmj.org">http://mlmmj.org</a>, the mailing list archive there =
points to <a href=3D"http://mlmmj.org/archive/index.html">http://mlmmj.org/=
archive/index.html</a>, but the archive up to date is at <a href=3D"http://=
mlmmj.org/archive/mlmmj/date.html">http://mlmmj.org/archive/mlmmj/date.html=
</a><br>
<br>Franky=A0</div></div>

--000e0cd1ff3ec15db1047d0e0d7d--

