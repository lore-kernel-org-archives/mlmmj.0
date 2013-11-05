From: Paul Fariello <paul@fariello.eu>
Date: Tue, 05 Nov 2013 13:35:45 +0000
Subject: [mlmmj] 8BITMIME
Message-Id: <20131105133545.GE25691@chimay.paulfariello.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi all,

first I'd like to thank you for the great work you have done on mlmmj. It's
really joyful to use it !

Unfortunately I have an issue with some of my mail that contains
utf-8=C2=A0chararcters.

My MTA (OpenSMTPd) is masking data with 0x7f when mail are not coming with =
the
8BITMIME flag. And it seems that mlmmj is not using the 8BITMIME EHLO comma=
nd
when sending mail to the list. So it ends up with messy characters like "C'"
instead of "=C3=A7".

I'm not aware of all specificity of 8BITMIME, may be my mail are missing so=
me
header. Here is an example of the mail that fails :


> Delivered-To: mlmmj-test@lists.paulfariello.fr
> Received: from chimay.paulfariello.fr (chimay.paulfariello.fr [109.190.14=
2.210]);
> 	by chimay.paulfariello.fr (OpenSMTPD) with ESMTPSA id 2e35f84e;
> 	TLS version=3DTLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits%6 veri=
fy=3DNO;
> 	for <mlmmj-test@lists.paulfariello.fr>;
> 	Tue, 5 Nov 2013 10:30:32 +0100 (CET)
> Date: Tue, 5 Nov 2013 10:30:31 +0100
> From: Paul Fariello <paul@fariello.eu>
> To: mlmmj-test@lists.paulfariello.fr
> Subject: Re: [Test] test mlmmj-send
> Message-ID: <20131105093031.GM11270@chimay.paulfariello.fr>
> References: <20131105091721.GB11270@chimay.paulfariello.fr>
> List-Id: <test.lists.paulfariello.fr>
> List-Post: <mailto:mlmmj-test@lists.paulfariello.fr>
> List-Help: <mailto:mlmmj-test+help@lists.paulfariello.fr>
> List-Subscribe: <mailto:mlmmj-test+subscribe@lists.paulfariello.fr>
> List-Unsubscribe: <mailto:mlmmj-test+unsubscribe@lists.paulfariello.fr>
> List-Owner: <mailto:mlmmj-test+owner@lists.paulfariello.fr>
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3Dutf-8
> Content-Disposition: inline
> Content-Transfer-Encoding: 8bit
> In-Reply-To: <20131105091721.GB11270@chimay.paulfariello.fr>
> User-Agent: Mutt/1.5.21 (2010-09-15)
>=20
> =C3=A7a va ?

Any idea of what I should do ? Patch mlmnj to set "EHLO" is an option ?

Regards,

--=20
Paul Fariello

