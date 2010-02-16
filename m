From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Tue, 16 Feb 2010 06:22:35 +0000
Subject: Re: An answer to a question in code comment
Message-Id: <1266301355.9646.69.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, 2010-01-26 at 00:54 +1100, Ben Schmidt wrote:
>   	/* Why is this here, and not in listcontrol() ?  -- mortenp 20060409 */
> +	/* Presumably so that it can use mailfile before it is unlinked prior
> +		to entering listcontrol() below -- Ben Schmidt 2010-01-25 */

Yeah, that's probably it. It would be nice to restructure it, so we
don't have code like that in mlmmj-process.c, but this works.

Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/


