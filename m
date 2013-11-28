From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 28 Nov 2013 18:19:34 +0000
Subject: Re: [mlmmj] Duplicate mail
Message-Id: <52978936.70802@oldelvet.org.uk>
List-Id: <mlmmj.mlmmj.org>
References: <20131128135142.GI1408@chimay.paulfariello.fr>
In-Reply-To: <20131128135142.GI1408@chimay.paulfariello.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

On 28/11/2013 13:51, Paul Fariello wrote:
> Hi all,
>
> I may be wrong but mlmmj don't seems to ignore subscribers that already are in "cc" or "to" headers.
> This end up with user complaining about duplicate mail.
This isn't a problem that can be solved in general. The visible "cc" and 
"to" headers are not necessarily what was used as the envelope addresses 
to deliver to. There may also be "bcc" or (non-mlmmj) aliases used in 
the visible headers.

By the time that the mail gets to mlmmj any original destinations will 
already have been lost in intermediate mailservers so at best you are 
going to be able to paper over the cracks with a solution that will work 
in some (most maybe) cases but will fail in others and either the mail 
will get lost or delivered twice.

>
> Is there a way to avoid this behavior ? Either by tweaking customheaders, by
> using a configuration I may have missed, by patching ?
>
Sorry. I don't have a ready answer for that.

The only way that I know is to filter on MessageID on the receiving 
server. The cyrus mail suite will do that but obviously that relies on 
the receiver's ISP which you will not be able to fix. Oh and it does in 
theory filter out any messages that errorneously have duplicate 
MessageID fields but that tends to be spam in my experience so no big loss!

Regards

Richard


>
> Regards,
>

