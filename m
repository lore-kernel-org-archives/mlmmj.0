From: Thomas Goirand <thomas@goirand.fr>
Date: Thu, 27 Jan 2011 17:14:52 +0000
Subject: Re: [mlmmj] ezmlm-like single command to subscribe an user?
Message-Id: <4D41A80C.7040003@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
In-Reply-To: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 01/27/2011 06:32 PM, Ben Schmidt wrote:
> On 22/01/11 8:08 AM, Mark Alan wrote:
>> Hello list,
>>
>> I am not being able to find info about the proper command to
>> subscribe an user like ezmlm does:
>> listname+subscribe-some.user=example.com@domain.tld
>>
>> Meaning: subscribe user some.user@example.com to list
>> listname@domain.tld
> 
> I'm fairly new to Mlmmj myself, so I'm not sure about this...but...I
> don't think Mlmmj does this. Can somebody else confirm it?
> 
> I wouldn't mind adding this functionality, though it would probably not
> make it into the next release but only the one after.
> 
> Ben.

I see this as a way to get spams... Let's say somebody that doesn't like
me sends 1000 messages to this address, then I might receive 1000
requests to register to the list.

I don't want this feature on my servers. Only the legitimate owner of
example.com@domain.tld should be able to register, and the others should
be filtered with something like DKIM or spf, or whatever you like that
can provide a kind of auth. So if you want to add such a dangerous
feature, make sure it's disabled by default.

Thomas

