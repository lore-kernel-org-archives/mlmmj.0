From: Drake Wyrm <wyrm@haell.com>
Date: Sun, 03 Sep 2006 19:52:24 +0000
Subject: Re: Accents and diacritics in mail headers
Message-Id: <20060903195224.GA30094@phaenix.haell.com>
List-Id: <mlmmj.mlmmj.org>
References: <CGEOKDHOKECBNBHBENCHIEDDCFAA.jan@ffhockey.org>
In-Reply-To: <CGEOKDHOKECBNBHBENCHIEDDCFAA.jan@ffhockey.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Joaquin ALMAGRO <jan@ffhockey.org> wrote:
> It is difficult to persuade French people to avoid accents or
> diacritics in the mail's headers. But RFC 2822 rule is clear.    
> 
> [snip-begin {W3C World Wide Web Consortium}] ----------- "RFC 2822
> specifies rules for forming Internet messages. It does not allow the
> use of characters with codes above 127 to be used directly
> (non-encoded) in mail headers (it also prohibits NUL and bare CR)"
> ----------- [snip-end]
> 
> International "text" translations must AVOID the use of "national"
> characters in headers (Christophe ?). Risk : banned mail with BAD
> HEADER error code.
> 
> Perhaps a built-in procedure to remove all diacritics in header texts
> (Morten)?

Honestly, that would be better performed in the MTA, ideally when the
message is first received. That way a proper reject could be generated,
rather than trying to munge the headers into compliance.

-- 
I used to think romantic love was a neurosis shared by two, a supreme
foolishness. I no longer thought that. There's nothing foolish in
loving anyone. Thinking you'll be loved in return is what's foolish.
  -- Rita Mae Brown
