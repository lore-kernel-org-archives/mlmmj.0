From: Uffe Jakobsen <uffe@uffe.org>
Date: Tue, 24 Jun 2014 13:41:11 +0000
Subject: Re: [mlmmj] mlmmj and DKIM
Message-Id: <53A97FF7.8080209@uffe.org>
List-Id: <mlmmj.mlmmj.org>
References: <53A949B5.8070300@uffe.org>
In-Reply-To: <53A949B5.8070300@uffe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



On 2014-06-24 13:19, Chris Knadle wrote:
> On Tuesday, June 24, 2014 12:08:41 Uffe Jakobsen wrote:
>> On 2014-06-24 12:00, Yuri D'Elia wrote:
>>> On 06/24/2014 11:49 AM, Uffe Jakobsen wrote:
>>>> Their posts to the lists gets rejected by receiving parts (sites) that
>>>> check for DKIM validity - hotmail.com being one site that seem to reject
>>>> the most.
>>>>
>>>> One approach would be to setup proper SRS - I guess - but the number of
>>>> lists and users that I have are quite low - and hence i was looking for
>>>> an "easier" solution...
>>>>
>>>> Any suggestions - How do you approach such problems ?
>>>
>>> Yes, either just forward the message (do not change the content/reply-to
>>> or anything else) or strip DKIM-Signature from incoming messages (using
>>> delheaders).
>>>
>>> The latter will not work if DMARC is being used, but I didn't have
>>> problems so far. YMMV.
>>
>> Well, I've tried both your suggestions
>>
>> The sending domain in question is @post11.tele.dk - and in that
>> combination the most problems is seen with recipients @hotmail.com
>>
>> 1) Plain forwarded messages from DKIM domains are rejected by hotmail. I
>> guess that they look at MAIL FROM and RCPT TO as well....
>>
>> 2) Stripping DKIM headers does not seem til help either - hotmail.com
>> still rejects.
>
>
> It looks like tele.dk is another domain that is now using DMARC with
> "p=reject" like AOL and Yahoo:( are.  Here's the test as to why I think that's
> what's going on:
>
>     $ dig _dmarc.tele.dk txt +short
>     "v=DMARC1\; p=reject\; sp=none\; pct0\;"
>

Ok, I need to read up on DMARC...

Would such DMARC record as stated above have an effect on a subdomain as 
@post11.tele.dk ?

/Uffe



