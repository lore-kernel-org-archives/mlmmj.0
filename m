From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 08 Feb 2005 18:33:38 +0000
Subject: Re: mlmmj-1.2.3 released. Features added and bugs squashed.
Message-Id: <20050208183338.GI67839@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050208095412.GE56543@mmj.dk>
In-Reply-To: <20050208095412.GE56543@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [Feb 08. 2005 13:17]:
> This is completely untested, I only made sure it compiles. So try it out
> and let me know if it works, then I'll commit it to CVS.

It works, except for a missing closing parenthesis.

> +	for(i = 0; i < alternates->count; i++)
> +		myfree(alternates->strs[i];

This should be.

myfree(alternates->strs[i]);

I've committed it to CVS.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
