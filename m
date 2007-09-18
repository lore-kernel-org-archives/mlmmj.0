From: Neale Pickett <neale@woozle.org>
Date: Tue, 18 Sep 2007 17:24:19 +0000
Subject: Re: Having individual receiver in To: field
Message-Id: <w53fy1bq43g.fsf@fozzie.woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
In-Reply-To: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thomas Goirand <thomas@goirand.fr> writes:

> This makes me think that I would have like a way that only certain
> person (like the list owners or the moderators) could send to the
> moderated list without the hassle of having to approve the messages.

I set up a club newsletter like so:

    fozzie /var/spool/mlmmj/lann.members/control$ cat access 
    allow ^From: .*@la-nn.org
    deny
    fozzie /var/spool/mlmmj/lann.members/control$ 

I don't know if it actually prevents others from mailing the list :)

Neale
