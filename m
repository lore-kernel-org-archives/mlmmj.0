From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Fri, 11 May 2012 13:56:35 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <7ac3680afe173910ea62e5943af322eb@imap.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 2012-05-11 15:55, theo borm wrote:

>> It sounds like their SPF implementation is broken.

> microsoft?

Well, you mentioned SPF in your original mail, but MS indeed uses 
Sender ID :-)

> organization has an v=spf1 policy in place. Mail is outsourced to
> microsoft, which uses sender ID.
>
> It's the receiving server which has to implement spf/sender-ID, so
> delivery is erratic to say the least.

Well, not the receiving end, but the one doing the DNS records. So try 
to convince the DNS owners for those domains to change their 
"spf2.0/mfrom,pra" to just "spf2.0/mfrom"

>
> I (and others) have told them a few times to no avail.
>
> regards, Theo

Of course MS won't listen :-) But if the DNS owners are reasonable ...

Franky

