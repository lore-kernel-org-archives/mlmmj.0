From: Roderick <hruodr@gmail.com>
Date: Tue, 16 Jun 2020 09:09:45 +0000
Subject: Re: [mlmmj] access::Deny seems to have stopped working ?
Message-Id: <alpine.BSF.2.22.419.2006160905390.1145@fbsd.local>
List-Id: <mlmmj.mlmmj.org>
References: <rc5bj1$gl8$1@saturn.local.net>
In-Reply-To: <rc5bj1$gl8$1@saturn.local.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Tue, 16 Jun 2020, Per Jessen wrote:

> This morning I added some debug output to mlmmj-process - the reason
> the "deny" above isn't working is simply that MIME headers in the email
> body are not being tested :-)
>
> I guess our many 'deny' rules (to refuse various attachments) quite
> simply _never_ worked.

Is that really the case? Is there the functionality to test the body
of a mail, here MIME headers of an attachment? I read in
README.access only:

"""
Each header in the mail is tested against each rule, rule by rule.
That is, all headers are first tested against the first rule, then
all headers are tested against the second rule, and so on.
""""

Rodrigo

