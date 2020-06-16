From: Per Jessen <per@opensuse.org>
Date: Tue, 16 Jun 2020 09:49:54 +0000
Subject: Re: [mlmmj] access::Deny seems to have stopped working ?
Message-Id: <rca4k2$aqa$2@saturn.local.net>
List-Id: <mlmmj.mlmmj.org>
References: <rc5bj1$gl8$1@saturn.local.net>
In-Reply-To: <rc5bj1$gl8$1@saturn.local.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Roderick wrote:

> On Tue, 16 Jun 2020, Per Jessen wrote:
> 
>> As far as I can tell from the source code and my debugging, yes -
>> headers are only collected until the empty line between header and
>> body.
> 
> And that corresponds to what I read in README.access. That is what I
> wanted to say: no bug. 

Oh yes, I agree.  If anything, the bug is on our side, that we have
expected it to work for more than 13 years :-) 


-- 
Per Jessen, Zürich (19.1°C)
Member, openSUSE Heroes


