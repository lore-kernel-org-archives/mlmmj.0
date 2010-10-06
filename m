From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 06 Oct 2010 07:55:38 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <4CAC2B7A.6090805@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 2/10/10 6:27 PM, Mads Martin J=F8rgensen wrote:
> On Sat, Oct 2, 2010 at 10:14 AM, Christian Gleerup
> <christian.gleerup@swn.nu>  wrote:
>> I just checked the file, and it indeed contained a whitespace character
>> (\r)
>>
>> this must have been an error when I made the mass subscribe system,

In what way did this interface with Mlmmj? Do you know where the
carriage return came from in the first place? Would it have appeared in
a commandline argument to mlmmj-sub? Or...?

>> I will look out for this, but it would be nice if the system was a
>> bit more robust, and automatically removed trailing whitespaces :)
>
> I believe it does remove trailing whitespaces, but that's not a
> whitespace, that's a carriage return.

I think that's a whitespace. Non-linear, but still whitespace.

> We agree that it should be able to handle it, and be more robust,
> since \r is not a valid emailaddress character.

Yep. We all agree it would be nice to guard against this!

Ben.





