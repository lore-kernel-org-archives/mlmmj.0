From: G Stansfield <gstansfield@isat.co.za>
Date: Mon, 02 Dec 2013 06:52:36 +0000
Subject: Re: [mlmmj] Duplicate mail
Message-Id: <529C2E34.3030305@isat.co.za>
List-Id: <mlmmj.mlmmj.org>
References: <20131128135142.GI1408@chimay.paulfariello.fr>
In-Reply-To: <20131128135142.GI1408@chimay.paulfariello.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 28-Nov-13 8:19 PM, Richard Mortimer wrote:
> Hi,
>
> On 28/11/2013 13:51, Paul Fariello wrote:
>> Hi all,
>>
>> I may be wrong but mlmmj don't seems to ignore subscribers that
>> already are in "cc" or "to" headers.
>> This end up with user complaining about duplicate mail.
> This isn't a problem that can be solved in general. The visible "cc" and
> "to" headers are not necessarily what was used as the envelope addresses
> to deliver to. There may also be "bcc" or (non-mlmmj) aliases used in
> the visible headers.
>
> By the time that the mail gets to mlmmj any original destinations will
> already have been lost in intermediate mailservers so at best you are
> going to be able to paper over the cracks with a solution that will work
> in some (most maybe) cases but will fail in others and either the mail
> will get lost or delivered twice.
>
>>
>> Is there a way to avoid this behavior ? Either by tweaking
>> customheaders, by
>> using a configuration I may have missed, by patching ?
>>
> Sorry. I don't have a ready answer for that.
>
> The only way that I know is to filter on MessageID on the receiving
> server. The cyrus mail suite will do that but obviously that relies on
> the receiver's ISP which you will not be able to fix. Oh and it does in
> theory filter out any messages that errorneously have duplicate
> MessageID fields but that tends to be spam in my experience so no big loss!
>
> Regards
>
> Richard
>
>
>>
>> Regards,
>>
>
Hi all!
Just adding a bit about my experience with duplicate mails, Bcc and 
MessageID that is not mlmmj specific but is 'real world' pain in the ... 
! [My setup is using OpenSUSE to fetchmail / procmail and place mail for 
local users to collect on a LAN with Windows machines.]

Let fred@gmail.com send a mail To:Jack@myisp and Bcc:Jill@myisp where 
both Jack and Jill are aliases and the mails are delivered to the same 
POP3 box at @myisp for collection and local delivery.

gmail sends two mails, both with identical MessageID - so letting 
anything reject duplicate mails based on MessageID results in a 
non-delivery to one recipient.

The mail Bcc:Jill@myisp has the envelope Delivered-To:jill@myisp and I 
have to check that for delivery. Unfortunately, it also has a valid 
To:Jack@myisp line. So the way / sequence of checking the envelope for 
delivery *beyond To: and Cc:* matters to avoid duplicate mails. If this 
is not done correctly then one recipient receives multiple deliveries.

Just to complicate matters, not all mailer systems are set up to handle 
Bcc: the way gmail does ..... and I give up!

So I agree with Richard - hopefully get "a solution that will work in 
some (most maybe) cases".

Regards,
Geoff

