From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 11 Sep 2006 19:04:32 +0000
Subject: Re: mlmmj-1.2.12-RC1 released
Message-Id: <84625d6148ca2a318e7d4829657218be@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
In-Reply-To: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Stefan,

Stefan Reinauer <stepan@openbios.org> wrote:
> Please add the following two patches as well:
> 
>   * mlmmj-1.2.12-RC1-fix-german.diff

I have some problems with this patch. The German a-umlaut is the two bytes "c3 a4" (which is UTF-8) in the patch, but u-umlaut is encoded as the three bytes "ef bf bd" (which is not UTF-8).

Could you re-send the patch as UTF-8 or ISO-8859-1?

Morten

PS. When I finish i18n, all listtexts will be in quoted printable UTF-8. It should make life a tiny bit easier.

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

