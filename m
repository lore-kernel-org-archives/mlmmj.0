From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Thu, 01 Feb 2007 22:18:43 +0000
Subject: Re: Patch to ignore empty lines in files under /control/
Message-Id: <064b445d941c5ab98dffeefd8f12380c@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <ygfk5z23oyq.fsf@dominion.borderworlds.dk>
In-Reply-To: <ygfk5z23oyq.fsf@dominion.borderworlds.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Christian Laursen <xi@borderworlds.dk> wrote:
> Sven 'Darkman' Michels <sven@darkman.de> writes:
>> Christian Laursen wrote:
>>> Unless there are any protests I will probably commit this
>>> change sometime tomorrow.
>>
>> What about the footer file? ;)
> 
> As far as I can tell the footer file isn't read by ctrlvalues()
> so it should remain unaffected.

True. The footer is added with a call to dumpfd2fd().

I think the patch is fine. You might want to add a comment like /* ignore empty lines */ or something :)

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

