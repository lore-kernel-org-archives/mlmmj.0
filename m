From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 14 Dec 2004 12:14:00 +0000
Subject: Re: echoposts
Message-Id: <20041214121400.GC6917@note231644.webdmz.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <41BEC008.7060406@uz.gov.ua>
In-Reply-To: <41BEC008.7060406@uz.gov.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, Dec 14, 2004 at 01:16:56PM +0200, Maxym Synytsky wrote:
>> So in case foo@bar.example.com is subscribed to the list, you want to strip
>> the Cc:?
>
> Well, no. Stripping Cc: won't help, because the message to
> foo@bar.example.com is already sent. I'd like mlmmj to send such post to
> somelist@somewhere.com minus foo@bar.example.com, in case foo@bar.example.com
> exists in somelist@somewhere.com .

It might not be a problem, but if I wanted everyone to know that I didn't like
something mmj did (just an example ;) I could make he didn't get the post. I
could send the mail to the list with

To: mlmmj@mmj.dk
Cc: mmj@mmj.dk
Subject: mmj's patch sucks

but only deliver it to the list (envelope-to). The list has no way of knowing
that mmj never got the mail.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
