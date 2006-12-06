From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 06 Dec 2006 13:41:46 +0000
Subject: Re: SIGSEGV in resolving hostname
Message-Id: <80f19b02936e68e07a2f3b6fff21eca6@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Benoit,

Benoit DOLEZ <bdolez@ant-computing.com> wrote:
> When there is not reverse for the hostname, the gethostbyname return
> NULL. There is no check of the return value in the function
> hostnamestr() (strgen:144). Because of the SIGSEGV generated, the normal
> might not working.

Thanks for your patch.

I've moved the code into hostnamestr() and used the opportunity to remove the static buffer from the function.

The patch, with my changes, is available here:

http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.12-hostnamestr.diff

It will be included in the next release of mlmmj.


Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

