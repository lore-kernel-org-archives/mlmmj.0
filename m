From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Fri, 07 Aug 2020 19:09:42 +0000
Subject: Re: [mlmmj] Suggestion: a tunable that allows for moderation of individual email addresses, instead 
Message-Id: <20200807190941.GA5099@kibel.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <a8b0d9d3-4416-9a50-dda1-a1f541b4f16f@vlsc.org>
In-Reply-To: <a8b0d9d3-4416-9a50-dda1-a1f541b4f16f@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Aug 07, 2020 at 11:21:32AM -0700, webmaster wrote:
> Is there a way to moderate individual email addresses instead of the
> entire list?

It is possible via the 'access' tunable, e.g.:

moderate ^From:.*troll@spam.org
# more lines like this
allow

It is not perfect, but should work in general. Do not forget 'allow' at
the end as the default action is deny.


-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

