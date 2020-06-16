From: Roderick <hruodr@gmail.com>
Date: Tue, 16 Jun 2020 09:41:00 +0000
Subject: Re: [mlmmj] access::Deny seems to have stopped working ?
Message-Id: <alpine.BSF.2.22.419.2006160937120.1164@fbsd.local>
List-Id: <mlmmj.mlmmj.org>
References: <rc5bj1$gl8$1@saturn.local.net>
In-Reply-To: <rc5bj1$gl8$1@saturn.local.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



On Tue, 16 Jun 2020, Per Jessen wrote:

> As far as I can tell from the source code and my debugging, yes - headers are 
> only collected until the empty line between header and body.

And that corresponds to what I read in README.access. That is what I
wanted to say: no bug. The OP expects a feature neither implemented
nor documented: to filter according to contents in the body. For
trateing headers in attachments with RE one needs perhaps something
like a variable in it with the boundary.

Rodrigo

