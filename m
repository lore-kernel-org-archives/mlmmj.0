From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 03 Feb 2011 01:40:58 +0000
Subject: Re: [mlmmj] disabling delivery notifications
Message-Id: <4D4A07AA.9080906@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=BzihGTn08x2oJo1NUX3UHMzJ5wLUYT7yi2XVF@mail.gmail.com>
In-Reply-To: <AANLkTi=BzihGTn08x2oJo1NUX3UHMzJ5wLUYT7yi2XVF@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

You'll need to add them to delheaders.

I do hope to at some stage distribute Mlmmj with more sensible defaults,
but this will probably come by way of a default delheaders file rather
than being completely 'built in', so the user retains control and as
little of this kind of logic as possible is in the Mlmmj binaries.

Ben.



On 2/02/11 2:18 AM, Florian Effenberger wrote:
> Hello,
>
> can mlmmj already disable delivery notifications out of the box, or
> would I have to add this to delheaders?
>
> If the latter one, may I suggest that removing delivery notification
> headers gets built in as default? :-) IMHO, the following headers
> should be relevant (shamelessly stolen from Mailman):
>
> * return-receipt-to
> * disposition-notification-to
> * x-confirm-reading-to
> * x-pmrqc
>
> Thanks,
> Florian




