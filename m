From: Achilleas Pipinellis <axilleas@axilleas.me>
Date: Wed, 20 May 2015 08:38:43 +0000
Subject: Re: [mlmmj] Duplicate e-mail entries in subscribers.d
Message-Id: <555C4813.7080108@axilleas.me>
List-Id: <mlmmj.mlmmj.org>
References: <555B0FC3.6050907@axilleas.me>
In-Reply-To: <555B0FC3.6050907@axilleas.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On 05/20/2015 01:57 AM, Ben Schmidt wrote:
> Which version are you using? I think you may be encountering a
> 1.2.18.0 bug that was fixed in 1.2.18.1:
> 
> 1.2.18.1 o Stop mlmmj-maintd deleting list posts while they are
> being sent o Fix +list from crashing Mlmmj o Fix bug that made
> double subscription possible
> 
> Note that the first item there was a bug that could cause mail to
> be lost, so if you're running 1.2.18.0 you are strongly encouraged
> to upgrade (you may like to wait for 1.2.19.0 to be released in a
> week or two).
> 
> Ben.
> 

I see, thanks! Indeed I'm running 1.2.18.0-2 on Debian Wheezy. Jessie
has 1.2.18.1-1 already, so I will either upgrade the whole system or
use apt pinning I guess.


- -- 
GPG : 0x3A7DDABC985EDC6E
Blog: http://axilleas.me
-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJVXEgDAAoJEBTqGDGsMtXMdzEQAMZwT2ynQeAGMBKaoAaOrjm0
5SwBMex//am+kXswk/uAfpmp0Gql9MU5T3haouzf5skqjFFADm/xq85tI97YuJcz
gYJw6mIS4znJQxQeJuIxCyOKjlLs6EajTVUx/e6QtVAed7xwL+L01prIRB+SQEqV
9NYrTfyPDt9/6E9MSZGUJHngSHPkWgBSJEDj7yC9FwFYVGPGYvyU1SqoQvEgBkpG
Oiqxj/TS1LOB9+0olt4PU9DFGy/xaStBXyFx6KizuJAkvUqtorECyhMUVvJ3bTz8
C2k2jWXxDu8XL4IVoHH2Dm3qQf0mJzDLrS+xndw1tqxNPgNSl/5N5LelqQosEDsk
bIawiCry8n8L9LB0fIA6oWzeln/HyX0fhCF608ccyk56jcrLITNo0WAp1JdsywNk
NGU9c/t2jir+ZIm2pFycPvtsZa5k+dqIIXxexancx7IFpfXB7MDtYc3wbRMnd2ei
voZAvZxi0IJZK2aqTnwkynd624f3vWNgvvXszYPwssQ6/OrcdYMXI6uj0KsL/n1X
mj+qXE0fJZ+SUnPHFu0d7L4A8gP910rqCix/LpfTIQvWVLclAZC4jrqs9b88sOkm
WPnYq7RGjvaynzDh3eFmBEJuq3uSN6eWVZ19bRyD+DRe7S86SWpkODzGUebCDHd5
gh1Ok8uRdRaEZWVR4VFe
=SM4Z
-----END PGP SIGNATURE-----

