From: Andrew Kohlsmith <akohlsmith-mlmmj@benshaw.com>
Date: Sat, 16 Oct 2004 16:39:18 +0000
Subject: Re: mail accepted but not retransmitted?
Message-Id: <200410161239.18791.akohlsmith-mlmmj@benshaw.com>
List-Id: <mlmmj.mlmmj.org>
References: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
In-Reply-To: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Saturday 16 October 2004 08:46, Mads Martin Joergensen wrote:
> What's the To: header, Delivered-To: header and contents of
> listdir/control/listaddress?

Ok I corrected what I thought was the problem but the message still gets 
queued but never sent out.

# cat control/listaddress
mlmmj-test@gromit.mixdown.ca

# cat queue/70ad17649119f61
X-Original-To: mlmmj-test@gromit.mixdown.ca
Delivered-To: mlmmj-test@gromit.mixdown.ca
Received: from me.com (localhost [127.0.0.1])
        by gromit.mixdown.ca (Postfix) with SMTP id C0882400079
        for <mlmmj-test@gromit.mixdown.ca>; Sat, 16 Oct 2004 12:25:38 -0400 
(EDT)
From: Akohlsmith@benshaw.com
To: mlmmj-test@gromit.mixdown.ca
Subject: Test 1
Message-Id: <20041016162538.C0882400079@gromit.mixdown.ca>
Date: Sat, 16 Oct 2004 12:25:38 -0400 (EDT)

test 1

I do have a subscriber, too...  :-)

# cat subscribers.d/a
akohlsmith@benshaw.com

-A.
