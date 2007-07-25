From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 25 Jul 2007 11:50:34 +0000
Subject: Re: mlmmj bug with qmail+vpopmail
Message-Id: <238b16280ea3456190bc34563d2c4e8f@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1603698924.20070721141017@gmail.com>
In-Reply-To: <1603698924.20070721141017@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Alexander,

Alexander Kardailsky <kardailsky@gmail.com> wrote:
>> See the problem?
> 
>   Not sure.
>   test-foo ->> test-foo / NULL
>   This is only if your mailing list have this address
>   test-foo@ If it has different one there would be test / foo

Yes. But all of this is only a problem if you are using the
delimiter *in* the address. Your list is IIRC called test-sw
and you are using a dash as delimiter.

With your patch test-sw@example.org will not be parsed.
However test-sw-faq@example.org will still be parsed.
And it will be parsed into test / sw-faq. Mlmmj will then
reject that mail, because there is no "sw-faq" command.
If you were using + as delimiter it would not be a problem:
test-sw+faq@example.org is unambiguous.

>   It doesn't matter what you have test-'foo-bar' or
>   test-foo-'bar' because there is comparison with mailing
> list address.

The patch fixes the case where there is no extension. But
as far as I can see it will fail with one. Maybe I am wrong,
but please explain how your patch will make mlmmj parse
test-sw-faq@example.org into test-sw / faq.

You could change recipient_extra() to look for the list's
address in the beginning of the given address, but consider
this case: A list has two names (yes, mlmmj supports this)
test@example.org and test-sw@example.org. How do you
parse test-sw-faq@example.org?

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

