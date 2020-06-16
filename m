From: Per Jessen <per@opensuse.org>
Date: Tue, 16 Jun 2020 07:06:41 +0000
Subject: Re: [mlmmj] access::Deny seems to have stopped working ?
Message-Id: <rc9r21$98l$1@saturn.local.net>
List-Id: <mlmmj.mlmmj.org>
References: <rc5bj1$gl8$1@saturn.local.net>
In-Reply-To: <rc5bj1$gl8$1@saturn.local.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Per Jessen wrote:

> For years we have had a standard set of access rules, the previous
> list manager at openSUSE set them up.  Somehow those rules seems to
> have stopped working - example:
> 
> deny ^Content-Type:.*image/png
> 
> simply does not deny a mail with a png attached.  I was just wondering
> if anybody else had observed this?

This morning I added some debug output to mlmmj-process - the reason
the "deny" above isn't working is simply that MIME headers in the email
body are not being tested :-) 

I guess our many 'deny' rules (to refuse various attachments) quite
simply _never_ worked. 


-- 
Per Jessen, Zürich (17.4°C)
Member, openSUSE Heroes


