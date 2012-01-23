From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 23 Jan 2012 16:39:23 +0000
Subject: Re: [mlmmj] [patch] man page fixes
Message-Id: <4F1D8D3B.9090707@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BD224.40908@goirand.fr>
In-Reply-To: <4F1BD224.40908@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi, Thomas,

>> It seems Debian is non-standard in requiring UTF-8 man pages, as Groff
>> does not support UTF-8 input:
>> http://www.gnu.org/software/groff/manual/html_node/Input-Encodings.html
>
> From the same page:
> "By its very nature, -Tutf8 supports all input encodings"
>
> So it's absolutely standard (and recommended).

My interpretation of this is, "When the output/terminal encoding is
UTF-8, naturally all supported input encodings can be accommodated,
since Unicode is a superset of them all." (The paragraph then explains
how other output encodings have restrictions on which input encodings
they can accommodate.)

That doesn't by any means mean that UTF-8 is a supported input encoding.
On the contrary, since it's not on the list of supported input
encodings, and there is no documentation regarding how to instruct groff
that its input is UTF-8, I believe it isn't. If Debian supports it, they
must have patched groff, or just be happily sweeping the issue under the
carpet (if groff thinks everything is Latin-1 I presume it will just
handle text transparently, so it might not matter if it is actually fed
and outputs UTF-8 rather than Latin-1--until complicated wrapping or
collation gets involved).

>> So I'll replace =F8 with \[/o] and everything should be good, though a
>> little ugly.
>
> I'm happy if you've found a solution, however, I still think UTF-8 is
> the only choice.

I would prefer UTF-8, too, but I can't find any solid evidence that it
is officially supported upstream.

> P.S: Please do *not* Cc: me, I'm registered to the list.

Yeah, sorry about that. I keep trying to remember but only get it right
occasionally.

Ben.




