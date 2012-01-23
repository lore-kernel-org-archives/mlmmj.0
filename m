From: Thomas Goirand <thomas@goirand.fr>
Date: Mon, 23 Jan 2012 07:11:26 +0000
Subject: Re: [mlmmj] [patch] man page fixes
Message-Id: <4F1D081E.7070608@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BD224.40908@goirand.fr>
In-Reply-To: <4F1BD224.40908@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 01/23/2012 08:37 AM, Ben Schmidt wrote:
> Just a little
> tricky for me to apply old patches.

For these man pages, my intention was to point at the issues, and make
sure they don't re-occur, because really, this has been recurrent with
MLMMJ.

> It seems Debian is non-standard in requiring UTF-8 man pages, as Groff
> does not support UTF-8 input:
> http://www.gnu.org/software/groff/manual/html_node/Input-Encodings.html

From the same page:
"By its very nature, -Tutf8 supports all input encodings"

So it's absolutely standard (and recommended).

> So I'll replace =F8 with \[/o] and everything should be good, though a
> little ugly.

I'm happy if you've found a solution, however, I still think UTF-8 is
the only choice.

Thomas

P.S: Please do *not* Cc: me, I'm registered to the list.

