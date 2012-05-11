From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 11 May 2012 14:56:39 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <4FAD28A7.1030209@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 12/05/12 12:04 AM, theo borm wrote:
> On 05/11/2012 03:20 PM, Ben Schmidt wrote:
>>
>> I think it's pretty unlikely I would accept a change to Mlmmj to work
>> around a buggy SPF implementation.
>
> I would be the last to suggest a patch to work around a Sender-Id
> misconfiguration. ;-)
>
> However, a patch allowing slightly more advanced header manipulations
> (say regexp match/replace, between delheader and customheader), would
> /that/ be welcomed?

Hi, Theo,

Yes, I'd quite probably accept such a change, provided it is kept
simple, and particularly if some specifics are floated past the mailing
list prior to preparing a patch, so people have a chance to raise any
issues.

There are also some pending changes to header stuff in the bug tracker,
so it would be good to at least keep those in mind, or even implement
them along with the new code (probably in separate patches, but
nonetheless, the work is related and might be good to be implemented
together).

Cheers,

Ben.




