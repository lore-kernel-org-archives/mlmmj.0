From: Jakob Hirsch <jh@plonk.de>
Date: Tue, 19 Jul 2005 07:59:32 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality
Message-Id: <42DCB2E4.2020405@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>>and text, with or without attachment). Everybody feel free to send
>>something else to test@list.ymmv.de.
> People, please send all kinds of potential mails breaking this to this
> list. I would really like to have this tested.

Found 1 non-working case already: Pine uses an all upper-case
Content-Type line, strstr("boundary") fails. There is a strchrstr() on
my system, but it seems to be a GNUism (even without having a man-page),
so I have to invent my own.

>>Possible problems I see:
>>
>>- as I did no full parsing of the Content-Type header, the recognition
>>of the boundary is not 100% reliable, but it's very unlikely that
>>;boundary=" is something else.
> How hard would it be to parse it completely?

Depends on what can possibly appear in the Content-Type line. Until now,
all I ever saw there was 'multipart/something; boundary="...."' at most.
I have to investigate.

>>- I only handle multipart/mixed and multipart/alternative, everything
>>else is assumed to be plain text, which is probably not true but it's
>>also the former behaviour. Maybe it's better to re-encapsulate
>>everything that is not already multipart/mixed. What do you think?
> But if it's assumed to be text/plain, then the behaviour is as before,
> no more, no less?

Yes. In most cases you'll get the old behaviour if something goes wrong.
Worst case is no footer at all, but then the user won't have seen it anyway.

>>- Finding the close delimiter of multipart/mixed messages will not work
>>if there is (too much) text after the closing delimiter. This should
>>normally not happen, as this text will not be displayed by mail clients
>>(which was the why this came up at all). I think this is a minor issue.
> What does "too much text" mean in this case?

The code goes back 2*strlen(boundary)-1, so the garbage has to be less
than strlen(boundary), which is about 10..30 chars. I could read a
bigger buffer or even consecutively read back overlapping blocks. Hmm,
not too hard to do, so maybe I should stick to reliability.

>>- "voodo" is spelled "voodoo", btw. :)
> Yeah--mlmmj have a history of misspelled words. Look at mlmmj-recieve

Stumbled across that already :)

