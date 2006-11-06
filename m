From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 06 Nov 2006 20:08:15 +0000
Subject: Re: SIGSEGV in resolving hostname
Message-Id: <a17ac8c936cc25b86930043e02d5db22@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Benoit,

Benoit DOLEZ <bdolez@ant-computing.com> wrote:
> When there is not reverse for the hostname, the
> gethostbyname return NULL. There is no check of
> the return value in the function hostnamestr()
> (strgen:144). Because of the SIGSEGV generated,
> the normal might not working.

Thanks for your patch. I will merge it after the release of mlmmj-1.2.12.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

