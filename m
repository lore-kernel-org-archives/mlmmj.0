From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 17 Aug 2016 09:36:17 +0000
Subject: Re: [mlmmj] Exposing the message IDX number better & large archives
Message-Id: <a318c72c-0c0e-a477-f5dc-691fbb8bc9ff@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20160816T211352-899998092Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20160816T211352-899998092Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Yeah. I've had difficulty finding the index in the past, too, e.g. to retrieve 
old/missed messages. A substitution seems the perfect way to deal with this, and 
the list admin can put it in a header if they want (and eventually we'll probably 
get around to shipping it in the best practice headers).

Could you put it on the bug tracker for me? It shouldn't be too much work, but it 
will be forgotten for sure if it's not somewhere organised.

Smiles,

Ben



On 17/08/2016 7:24 am, Robin H. Johnson wrote:
> mlmmj archives mails by an index number, which is a file sequentially
> created in the archive directory.
>
> The only places the IDX number gets exposed presently are:
> - return-path / MAIL FROM of mail
> - bounce probe listing
>
> In some cases, Return-Path can be mangled by later mail servers (and
> remailers), so the IDX gets lost.
>
> Can we add a substitution or dynamic header code to inject the number
> into a real header for regular list mail?
>

