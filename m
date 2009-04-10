From: Sebastian Harl <sh@tokkee.org>
Date: Fri, 10 Apr 2009 10:16:36 +0000
Subject: Re: looking for mlmmj.org..
Message-Id: <20090410101635.GC3811@kolibri.tokkee.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ABTtc+pdwF7KHXCz"
List-Id: <mlmmj.mlmmj.org>
References: <DF400A85-5EB2-40BC-A8B6-F6BE54D3E971@mmj.dk>
In-Reply-To: <DF400A85-5EB2-40BC-A8B6-F6BE54D3E971@mmj.dk>
To: mlmmj@mlmmj.org


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 10, 2009 at 11:21:55AM +0200, Mads Martin Joergensen wrote:
> Good question below, anyone on the list knows?
>
> On 08/04/2009, at 16.53, B. Cook wrote:
>> I was going to the site to read about somethings.. and it seems the =20
>> site is down/gone?..
>>
>> curl -v -I http://mlmmj.org
>> * gethostbyname_r(2) failed for mlmmj.org
>> * Couldn't resolve host 'mlmmj.org'
>> * Closing connection #0
>> curl: (6) Couldn't resolve host 'mlmmj.org'
>>
>> host -t ns mlmmj.org
>> Host mlmmj.org not found: 3(NXDOMAIN)

  % whois mlmmj.org | egrep '^Status'
  Status:CLIENT HOLD
  Status:CLIENT TRANSFER PROHIBITED
  Status:CLIENT UPDATE PROHIBITED
  Status:AUTORENEWPERIOD

Looks like the fees have not yet been paid after the last expiry, or
something similar. Thus, the .org nameservers respond with status
NXDOMAIN.

Cheers,
Sebastian

--=20
Sebastian "tokkee" Harl +++ GnuPG-ID: 0x8501C7FC +++ http://tokkee.org/

Those who would give up Essential Liberty to purchase a little Temporary
Safety, deserve neither Liberty nor Safety.         -- Benjamin Franklin


--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknfHIMACgkQEFEKc4UBx/zmPwCggtD21ls632Bk0CgvWNRBVsWR
veoAoJEHqnBNtKS44cATwWrX7cr4eSA+
=U3GP
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
