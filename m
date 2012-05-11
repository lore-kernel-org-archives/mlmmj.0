From: theo borm <theo_mlmmj@borm.org>
Date: Fri, 11 May 2012 14:33:13 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <4FAD2329.6070702@borm.org>
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 05/11/2012 03:56 PM, Franky Van Liedekerke wrote:
> On 2012-05-11 15:55, theo borm wrote:
>
>>> It sounds like their SPF implementation is broken.
>
>> microsoft?
>
> Well, you mentioned SPF in your original mail, but MS indeed uses 
> Sender ID :-)

sorry for the confusion.

>
>> organization has an v=spf1 policy in place. Mail is outsourced to
>> microsoft, which uses sender ID.
>>
>> It's the receiving server which has to implement spf/sender-ID, so
>> delivery is erratic to say the least.
>
> Well, not the receiving end, but the one doing the DNS records. So try 
> to convince the DNS owners for those domains to change their 
> "spf2.0/mfrom,pra" to just "spf2.0/mfrom"

It's microsoft who recommends using v=spf1 record as-if it is a 
spf2.0/mfrom,pra record. It is the receiving end (microsioft) using a 
sender ID implementation that is configured to interpret it this way. It 
is the DNS owner who *might* be able to circumvent this stupidity by 
using a spf2.0/mfrom record instead. But it may even be reasonable for 
the DNS owner to refuse this on the fundamental grounds that they 
shouldn't be fixing other peoples' problem.

>
>>
>> I (and others) have told them a few times to no avail.
>>
>> regards, Theo
>
> Of course MS won't listen :-) But if the DNS owners are reasonable ...

I have warned the DNS owners ~ 2 years ago. Their response was that 
"they would discuss this with the "software vendor" (Wietse Venema), but 
that I should not expect a resolution". Until recently they operated 
their own mail servers, which applied the spf record correctly. Recently 
they have outsourced their mail to microsoft (externally their only MX 
is mail.messaging.microsoft.com), and that is when the trouble started.

Of course there has been trouble before, but these were "fringe users" 
on providers that used sender id, and the problem was simply solved by 
instructing them to use gmail or whatever. Now I have to tell the 
majority of list users to go to gmail because their IT department is what?.

well. It's a nuisance.

cheers, Theo





