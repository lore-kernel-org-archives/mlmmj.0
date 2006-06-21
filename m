From: Thomas Goirand <thomas@goirand.fr>
Date: Wed, 21 Jun 2006 15:06:16 +0000
Subject: Re: Mail sent to mlmmj-recieve but MLMMJ don't send subscribeconfirmation
Message-Id: <44996068.6080202@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <44916980.7060706@goirand.fr>
In-Reply-To: <44916980.7060706@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

S=F8ren Boll Overgaard wrote:
> On Wed, Jun 21, 2006 at 05:59:31PM +0800, Thomas Goirand wrote:
>> I've just tried using the source package from unstable debian, plus the
>> patch you gave me, and MLMMJ doesn't produce anything in the syslog. I
>> really don't know where to look at, any idea???
>=20
> Please note that the debian package includes a number of patches which ma=
y or
> may not cause other patches to be rejected. I haven't actually checked if=
 this
> is the case here, I just I would provide a heads-up.
>=20
> Maybe you would be better off with the pristine source package for testing
> patches?

I just had a look, the patches in Debian are really minor, the only
thing they patch are:

1/ a display message (the one saying that binaries should be called with
full path)
2/ mlmmj-make-ml.sh
3/ mlmmj php app (which I don't use)

None of them seems to hurt, and the patch that gave Morten was applied
with no error (it was not rejected).

Thomas
