From: Baptiste Daroussin <bapt@nours.eu>
Date: Wed, 25 Oct 2023 22:18:59 +0000
Subject: Re: [mlmmj] make check fail for 1.4.0rc2
Message-Id: <1BA53401-5CFF-4F08-BCD4-A6C6EA493A24@nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <812a5dcc-09ac-4254-a868-f8939817bd93@andreasschulze.de>
In-Reply-To: <812a5dcc-09ac-4254-a868-f8939817bd93@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Le 25 octobre 2023 20:50:19 GMT+02:00, "A. Schulze" <sca@andreasschulze.de> a écrit :
>
>
>Am 02.07.23 um 17:25 schrieb A. Schulze:> I spend some time on mlmmj today and now I manage to build and PASS 'make check'!
>> Since my last try 1.4.0b2 is available. So I used that version.
>> 
>> The key point was to *not* run 'make check' as root but as user nobody.
>
>Hello,
>
>while 'make check' succeeded with 1.4.0b2, it now fail again for 1.4.0rc2 here:
>
>tests/mlmmj-receive:subscription_moderation  ->  failed: atf-check failed; see the output of the test for details  [0.455s]
>
>Andreas
>
>
Fixed, thank you! Somehow this is not triggered when the software is built with libasan and/or libubsan which I used by default in all my tests which is why it did not failed on me.

Anyway fixed, thanks a lot for reporting!

Bapt

