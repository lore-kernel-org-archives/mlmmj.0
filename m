From: theo borm <theo_mlmmj@borm.org>
Date: Fri, 11 May 2012 13:57:32 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <4FAD1DF6.4030607@borm.org>
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 05/11/2012 03:00 PM, Franky Van Liedekerke wrote:
> On 2012-05-11 14:57, theo borm wrote:
>> Hi Franky,
>>
>> Thanks for the answer.
>>
>> There are two types of "from"'s: the envelope sender as specified in
>> the SMTP communication with the "mail from" command, and the one
>> embedded in the mail data itself using the "From" header. Either can
>> be checked with SPF and the microsoft variant (Sender ID), and both
>> have a different way of interpreting these info.
>> Normall the envelope sender is used by mlmmj to implement "VERP",
>> which allows it to efficiently detect which email addresses bounce and
>> take appropriate action. It is also normally not shown to end-users,
>> so it is not much use here. Besides, I don't want to break VERP
>> processing.
>>
>> regards, Theo
>
> yes, I forgot about the VERP ...
> Let me brush off my SPF knowledge again, I thought there was an 
> exception for mailing lists and the Return-Path header or so ...
>
> Franky

Hi Franky,

Apologies for accidentally taking this off-list....

As it stands, broken or misconfigured sender-id / spf 
implementations/interpretations are being used. I doubt if reliance on 
headers that can just as easily be faked to define exceptions would be 
more reliable.

regards, Theo





