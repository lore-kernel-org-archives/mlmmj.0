From: Anders Johansson <andjoh@rydsbo.net>
Date: Thu, 19 Aug 2004 18:52:18 +0000
Subject: Re: Checking envelope From for recipient delimiter
Message-Id: <200408192052.19162.andjoh@rydsbo.net>
List-Id: <mlmmj.mlmmj.org>
References: <20040819121309.GK70901@panther.mmj.dk>
In-Reply-To: <20040819121309.GK70901@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thursday 19 August 2004 20:45, Mads Martin Joergensen wrote:
> Sane systems use the RCPT TO: as the user specified in To: right?

Terminology moment: by RCPT TO: we mean the envelope recipient. By To: we mean 
the header inside the data segment. Just to be clear

No, the To: is (or should be) irrelevant. For example, if you set up an alias 
and send a mail to that alias, To: will be the alias, RCPT TO: will be the 
real address. e.g.

my_cross_posting:      mlmmj@mmj.dk, suse-linux-e@suse.com, kde-user@kde.org

Sending a mail to my_cross_posting will produce a mail with "my_cross_posting" 
in To:, but the respective list addresses in each RCPT TO:

Please don't use DATA information for anything important, it's just plain text
