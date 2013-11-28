From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 28 Nov 2013 21:03:43 +0000
Subject: Re: [mlmmj] Duplicate mail
Message-Id: <5297AFAF.40509@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20131128135142.GI1408@chimay.paulfariello.fr>
In-Reply-To: <20131128135142.GI1408@chimay.paulfariello.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 29/11/13 5:19 AM, Richard Mortimer wrote:
> On 28/11/2013 13:51, Paul Fariello wrote:
>> I may be wrong but mlmmj don't seems to ignore subscribers that
>> already are in "cc" or "to" headers. This end up with user
>> complaining about duplicate mail.
...
>> Is there a way to avoid this behavior ? Either by tweaking
>> customheaders, by using a configuration I may have missed, by
>> patching ?
>>
> Sorry. I don't have a ready answer for that.
>
> The only way that I know is to filter on MessageID on the receiving
> server. The cyrus mail suite will do that but obviously that relies on
> the receiver's ISP which you will not be able to fix. Oh and it does
> in theory filter out any messages that errorneously have duplicate
> MessageID fields but that tends to be spam in my experience so no big
> loss!

I agree it is best to deal with this at the receiving end if possible.

That said, I suppose this is similar to the "notmetoo" functionality,
and perhaps "notmetoo" could be extended to cover these cases, too, i.e.
ignore "to" and "cc" addresses as well as the "from" one when
distributing posts. It shouldn't be too hard (I wrote the notmetoo
functionality, so am fairly familiar with it.)

Open an enhancement request on the bug tracker and/or write a patch for
it if you like.

Smiles,

Ben.



