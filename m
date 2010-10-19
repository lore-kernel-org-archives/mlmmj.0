From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 19 Oct 2010 13:38:54 +0000
Subject: Re: [mlmmj] unsubscription woes
Message-Id: <4CBD9F6E.5010109@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTinXkNC9QmLn1PoN8LiHBHSHhqDdpnQx=8wnANiq@mail.gmail.com>
In-Reply-To: <AANLkTinXkNC9QmLn1PoN8LiHBHSHhqDdpnQx=8wnANiq@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 19/10/10 8:27 PM, Florian Effenberger wrote:
> Hi,
>
> I receive several complaints from people who seem to be unable to
> unsubscribe from our mailing lists. Some of them tell me, they got the
> mail they needed to confirm, but nothing happened. I tend to think
> that it's their fault, but I cannot confirm at the moment. So far, I
> couldn't find a pattern. Some people used GMail, which worked just
> like a charm for me, others used GMX and had issues...
>
> Is there any chance of nailing down that problem, any detailed log?
>
> Thanks,
> Florian

Mads has given you where to look for logs. One of my priorities after
getting out a 1.2.18 release is to revisit all the logging code, too, as
there are a number of things which aren't logged, or aren't logged
correctly at present.

Regarding the problem, though, check the permissions of the files in the
$listdir/subscribers.d directory. They are categorised by email address
first letter (so that may be the pattern!), and if not writable by the
user mlmmj runs as when invoked by the MTA you will see that behaviour
(confirmation email sent and accepted, but the address not actually
removed).

Ben.





