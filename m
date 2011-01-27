From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Thu, 27 Jan 2011 17:22:27 +0000
Subject: Re: [mlmmj] ezmlm-like single command to subscribe an user?
Message-Id: <AANLkTi=_+4JEC-BZr=Sb7dU8ZcRNgmEsJ_kV2FBYJ5f_@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
In-Reply-To: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Thu, Jan 27, 2011 at 6:14 PM, Thomas Goirand <thomas@goirand.fr> wrote:
>>> I am not being able to find info about the proper command to
>>> subscribe an user like ezmlm does:
>>> listname+subscribe-some.user=3Dexample.com@domain.tld
>>>
>>> Meaning: subscribe user some.user@example.com to list
>>> listname@domain.tld
>>
>> I'm fairly new to Mlmmj myself, so I'm not sure about this...but...I
>> don't think Mlmmj does this. Can somebody else confirm it?
>>
>> I wouldn't mind adding this functionality, though it would probably not
>> make it into the next release but only the one after.
>
> I see this as a way to get spams... Let's say somebody that doesn't like
> me sends 1000 messages to this address, then I might receive 1000
> requests to register to the list.
>
> I don't want this feature on my servers. Only the legitimate owner of
> example.com@domain.tld should be able to register, and the others should
> be filtered with something like DKIM or spf, or whatever you like that
> can provide a kind of auth. So if you want to add such a dangerous
> feature, make sure it's disabled by default.

And systems wanting to automate this can just send a mail with the
envelope from being email in question. It's dead simple, actually. If
you don't know what I mean, let me know and I'll explain.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
=A0and totally illogical, with just a little bit more effort?"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 -- A. P.=
 J.


