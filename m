From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 24 Jul 2007 22:43:50 +0000
Subject: Re: mlmmj bug with qmail+vpopmail
Message-Id: <59ceeb159f0365f4715c6e434b4bb5a4@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1603698924.20070721141017@gmail.com>
In-Reply-To: <1603698924.20070721141017@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Alexander,

Alexander Kardailsky <kardailsky@gmail.com> wrote:
>>   configured .qmail-sw-test and .qmail-sw-test-default files.
[snip]
>     I think I fixed that problem. I've added one more check in
>     mlmmj-process.c :
> 
> -  } else if(dtemails.emailcount >= 1) {
> +  } else if(dtemails.emailcount >= 1 && strcmp(dtemails.emaillist[0],
> getlistaddr(listdir)) != 0) {
[snip]
>    I think there is no needed recipextra in case mailing list
>    name and To: or Delivered-To: addresses are equals.

It is true that the parsing is not needed, but I can not see how
your patch fixes anything.

Your delivery agent should set one of the DEFAULT, EXTENSION
or LOCAL_PART_SUFFIX environment variables. If it does not, mlmmj
parses the headers in an attempt to find the envelope to address
anyway. This is a fall back. Don't rely on it. There is - as far as I can
see - no way it can parse the address if the address itself contains
the delimiter.

test-foo-bar <-- is it test-foo with extension bar or test with extension
foo-bar? Only the mail server can tell.

Without your patch:
test -> test / NULL
test-foo -> test / foo
test-foo-bar -> test / foo-bar

With your patch:
test -> test / NULL
test-foo -> test-foo / NULL
test-foo-bar -> test / foo-bar

See the problem?

You have two options here:
- use a delivery agent which reveals the envelope information
- use an address without the delimiter embedded

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

