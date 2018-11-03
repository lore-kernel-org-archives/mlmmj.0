From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Sat, 03 Nov 2018 03:23:00 +0000
Subject: Re: [mlmmj] Patches wanted for hashing/nesting archive directory (1M+ mails in list)
Message-Id: <b3f212dd-2b03-f989-944e-64dac12bc20a@coredump.us>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PPcq9GWpBx8v7SRoWNNeSbw2U70wtS7OQ"
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20180807T030939-826380737Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20180807T030939-826380737Z@orbis-terrarum.net>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PPcq9GWpBx8v7SRoWNNeSbw2U70wtS7OQ
Content-Type: multipart/mixed; boundary="n09rw32l5S1d63eIfsiJyGKZ71oCv6wZI";
 protected-headers="v1"
From: Chris Knadle <Chris.Knadle@coredump.us>
To: "Robin H. Johnson" <robbat2@gentoo.org>, mlmmj@mlmmj.org
Message-ID: <b3f212dd-2b03-f989-944e-64dac12bc20a@coredump.us>
Subject: Re: [mlmmj] Patches wanted for hashing/nesting archive directory (1M+
 mails in list)
References: <robbat2-20180807T030939-826380737Z@orbis-terrarum.net>
 <89541aa0-f04e-af7d-77e3-2176d714a43e@coredump.us>
 <robbat2-20181023T212239-981036633Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20181023T212239-981036633Z@orbis-terrarum.net>

--n09rw32l5S1d63eIfsiJyGKZ71oCv6wZI
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Robin H. Johnson:
> (Sorry for the lag, busy month so far)
>=20
> On Mon, Oct 01, 2018 at 02:45:00AM +0000, Chris Knadle wrote:
>> Robin H. Johnson:
>>> One of the larger gentoo.org lists recently passed 1M mails, and whil=
e
>>> performance hasn't taken a noticeable hit, doing admin ops in such la=
rge
>>> directories is painful.
>> Mmm. Yeah that's a lot for one directory.
>>
>>> Has anybody started on patches to use a nested directory structure fo=
r
>>> archive? Ideally something that supports cleanly migrating from the o=
ld
>>> flat layout.
>> Not that I know of, but I think there's a reason.
>>
>> Mlmmj doesn't include a "web archiver", so I think the only reason to =
keep old
>> archives in the same directory is for getting previous messages from t=
he list
>> via email by sending mail to <listname>-get-N@<list-domain-name> where=
 N is the
>> number of the desired message.  It's very unlikely that a user would w=
ant to use
>> this to retrieve very many messages.
>
> Isn't the archive directory also used in the delayed/retry delivery
> cases? (I need to check the moderation cases as well).

I think no; I believe the /queue, /requeue, and /bounce directories for t=
he
particular mailing list are used for that.  (I haven't examined the code.=
)

> The get-N functionality does get usage in Gentoo, as we document it in
> counterpart to the 'you missed some mail because your address was
> bouncing'
>=20
> For web-archiving, we do it entirely outside of mlmmj (subscribe the
> archiver to the list, use get-N for missing mail, profit).

If I were in the position of dealing with the mail archives, what I would=
 want
to do is to leave about 3 months of archives within MLMMJ to allow get-N =
mail
retrieval, and the rest of the archives broken up into sub-directories by=
 month,
i.e "2018-08", and work out some method of having the web archives update=
d as
new mail comes in, and then figure out how to deal with the file move tra=
nsition
for the months that the raw mail archives moved into sub-directories.

MLMMJ only needs a file with the unique message number to retrieve the me=
ssage,
so I understand your suggestion for allowing nesting of archives within
subdirectories.  However I also realize that would come with a cost -- th=
ere'd
be some I/O performance impact for the search if an archive file was not
immediatly in /archive directly.
Still ... I like the idea.  It seems like a logical thing I'd want.

Another thought I had was that it's also possible to make soft-links with=
in
/archive to point to /archive/<subdirectory> mails.  This wouldn't help w=
ith the
number of files in /archive because that wouldn't change, but an administ=
rator
looking within /archive could see which messages were new (i.e. which one=
s were
actual files) rather than old (softlinks).

  -- Chris

--=20
Chris Knadle
Chris.Knadle@coredump.us


--n09rw32l5S1d63eIfsiJyGKZ71oCv6wZI--

--PPcq9GWpBx8v7SRoWNNeSbw2U70wtS7OQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEe1KzyGmRW/4DhtV6ieLKD9m6RHAFAlvdFLgACgkQieLKD9m6
RHC/yg//Y9nXRovB1/RCFc5mbEJQ40/cu/JrrFYSoZ5+LM8bRK+MubHSUnsQArJE
J8B6iAc0fA+nfEM95yp/6TMTlWPQsjQejBpFeqXtNs2HMjn50ip9ru27lPhMwTCn
jv6P1AoFcumPY1itIIjJNezQMeGG+y7NBhLK8vd0dI4fT0wsSSre/CvbIFVwz/XI
qESQpbisHtUHn8MOjiXynRl1d0gEnT9x1SVBnqTYc0FHRLf8mnKONg/CqDOeDJ8Y
2CVE96CsvMJSYGm3lZtgmBKN9PyuSkoPjCGsid//nH+z8QECj4QZ7GWRkIb8a4JU
YpRgrrZ0mT90IYJB8IH09FUWrvgbAOhmeiKvRxVPRlXOIa3mQCKmZg1PWcWKFyNJ
U5Ln0NiIyTu3WKIE72I4uKYNLLOpMhmeV3/Jp6pcIz1FHcl0gMmQQHU0bHlihdcv
i/h0DxwShEkW2cBNbDstKYbS9IqT47kNBS/QijsIhP+1zHwCWq76OI+QdyOm9Lm3
3o01at1zmW2Zb/8uEQHtfm5O+XOXCaCp5RsfYyUpgT5oZc4ikmBROT4z6FuiFBhX
FBsDxq71PTGciLdz1lZLRr3dIztkqdAOXRz3H8JaAai/jy9xnHEuTogQXiin84h2
xnMY5WCUa3v16tF7r2k21kqfyZDldloybpl0G0r3z+gz2eNIj6E=
=E7Xk
-----END PGP SIGNATURE-----

--PPcq9GWpBx8v7SRoWNNeSbw2U70wtS7OQ--

