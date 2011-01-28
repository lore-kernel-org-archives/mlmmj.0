From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Fri, 28 Jan 2011 08:16:13 +0000
Subject: Re: [mlmmj] [PATCH 09 of 10] Ensure that mlmmjsend, mlmmjbounce,
Message-Id: <AANLkTikSvU1shDcziC=CNqQmDTgLe40SPiypfbBgJEq=@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <35246cb7b5f2f74c07f8.1296169167@duncow>
In-Reply-To: <35246cb7b5f2f74c07f8.1296169167@duncow>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Thu, Jan 27, 2011 at 11:59 PM, Richard Mortimer
<richm@oldelvet.org.uk> wrote:
> # HG changeset patch
> # User Richard Mortimer <richm@oldelvet.org.uk>
> # Date 1295983347 0
> # Node ID 35246cb7b5f2f74c07f863fef859b08836d29bb6
> # Parent =A04be2135bfd08219a8a84adb4ecd38ca6fe46a14e
> Ensure that mlmmjsend, mlmmjbounce, mlmmjunsub are freed on abnormal exit
>
> diff -r 4be2135bfd08 -r 35246cb7b5f2 src/mlmmj-maintd.c
> --- a/src/mlmmj-maintd.c =A0 =A0 =A0 =A0Tue Jan 25 18:59:39 2011 +0000
> +++ b/src/mlmmj-maintd.c =A0 =A0 =A0 =A0Tue Jan 25 19:22:27 2011 +0000
> @@ -1116,6 +1116,9 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if(chdir(dirlists) < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0log_error(LOG_ARGS, "Could=
 not chdir(%s).",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0dirlists);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 myfree(mlmmjbounce);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 myfree(mlmmjsend);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 myfree(mlmmjunsub);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exit(EXIT_FAILURE);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}

I totally agree that it should be done, but the the reason for my
sloppiness in some places like this is that when a program exits, the
operating system will clean up the mess for me :)

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
=A0and totally illogical, with just a little bit more effort?"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 -- A. P.=
 J.


