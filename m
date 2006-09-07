From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Thu, 07 Sep 2006 23:53:10 +0000
Subject: Re: mlmmj-1.2.12-RC1 released
Message-Id: <4500B0E6.4050101@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
In-Reply-To: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Morten K. Poulsen wrote:
>> Most of the patch is simplyfing the "voodoo" and making it less ugly,
>> which I felt should be done because it got even more ugly with the mime
>> stuff in it. This should be done even without the mime stuff.
> 
> I still do not like the idea of having MIME parsing in the list manager, but I will have another look at the patch after the release of mlmmj-1.2.12.

Well, i just want to point out some, at least for me, important point:
mlmmj offers the functionality of adding a footer to a mail (which is
imho one of the best features for the end user, because you can add
the unsubscribe stuff to every mail and normally everyone should
see it - i know that this doesn't work for all ppl, but hell.. ;).
If mlmmj offers such a feature, it works like a MUA. As a MUA it should
be able to follow the normal mail standards, and in some cases this
may the usage of mime. For that case mlmmj should handle the footer
stuff by itself.
At the moment, mlmmj would break some mails by simply add a footer to
the end, and i think this is not what we want, do we?

So, this is not a blame to your/mmj or anyones work, its just my point
of view for this case ;)

Regards,
Darkman
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFFALDmQoCguWUBzBwRAqh2AJ9xIIq4q3sUBWNxaxNZS04ZlEvn6ACfV2/6
dRYrQgUPqY3nilFYHKGTGGo=bwCf
-----END PGP SIGNATURE-----
