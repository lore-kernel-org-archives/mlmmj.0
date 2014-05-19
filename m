From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Mon, 19 May 2014 10:57:18 +0000
Subject: Re: [mlmmj] customheaders correct usage?
Message-Id: <20140519105718.GB21183@szaflik.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <5377DFA4.3020307@gmail.com>
In-Reply-To: <5377DFA4.3020307@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, May 18, 2014 at 12:16:04AM +0200, Emil Hemdal wrote:
> When I use the customheaders settings file with this content:
>
> Reply-To: list@domain.tld
>
> my recipents get the Reply-To as '"list"@domain.tldMIME-Version: 1.0'
>
> Should I add a blank line or a semicolon to fix this or is there
> something else I'm doing wrong?

My guess is that you don't have a trailing newline in the file,
hence the header gets glued with the next one. Not all editors
show this condition and it sometimes gets unnoticed.


-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

