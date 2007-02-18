From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Sun, 18 Feb 2007 21:38:22 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <1197.130.83.185.211.1171834702.squirrel@130.83.185.211>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, February 18, 2007 13:20, Sven 'Darkman' Michels wrote:
> Mads Martin Joergensen wrote:
>> * Christoph Wilke <chris@filmkreis.tu-darmstadt.de> [Feb 16. 2007
>> 20:21]:
>>> In my understanding prepstdreply() creates a real file and
>>> return its descriptor. Mlmmjsend() only operates on this
>>> existing fd (queuefilename) and shouldn't care about
>>> donemailname and mailfile.
>>
>> It doesn't return a fd, but a char* with the filename for sending.
>> Just
>> returning the fd, would leave the caller without knowing what the
>> filename is, and in many cases the user of prepstdreply() don't have
>> to
>> open the file again--just pass the filename on to mlmmj-send.
>>
>
> so i was "right" with removing the two free's?

You were. But I don't have an idea why.
And if it is correct to have no myfree()s there.
Maybe someone can clarify this, please?

>
> Regards,
> Sven

Ciao
Chris
