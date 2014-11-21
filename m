From: Joe Eaves <joe@right2.org>
Date: Fri, 21 Nov 2014 17:42:54 +0000
Subject: [mlmmj] Help setting up my first mailing list
Message-Id: <9EC4CE90-6B36-4C12-B02D-1E9328EBBD77@right2.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_BD850D1C-C958-4691-A609-3EDFB7435F20"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--Apple-Mail=_BD850D1C-C958-4691-A609-3EDFB7435F20
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi guys,

I'm having some trouble setting up a mailing list with mlmmj, I'm =
running 1.2.18.1 from the EPEL repo on CentOS 7. I have set my smtp =
server to pipe emails destined for the mailing list as so:

|/bin/mlmmj-receive -L /opt/mlmmj/mylist/

Everything seems to be going well, the email is received, but then I get =
errors when it tries to send a reply. The log looks as follows:

/bin/mlmmj-process[6791]: mlmmj-process.c:828: Found To: =
right2-general@right2.org: Success
/bin/mlmmj-send[6791]: mlmmj-send.c:925: Could not prepare headers: No =
such file or directory

The only info I can find in the list directory is a file in the queue =
directory which seems to be the version of my email that the list is =
supposed to receive. It has the following headers:

Envelope-To: <right2-general@right2.org>
Authentication-Results: email.right2.org; ; ^M
Received: from email.right2.org (garum.right2.org [178.62.6.212])^M
        by email.right2.org (Haraka/2.5.0) with ESMTP id =
F4EF895C-E9E9-443D-8D34-81EB88DF501C.1^M
        envelope-from <joe@right2.org>;^M
        Fri, 21 Nov 2014 17:39:47 +0000^M
Received: (Haraka outbound); Fri, 21 Nov 2014 17:39:46 +0000^M
Received: from [192.168.33.137] (212.44.18.254.ip.redstone-isp.net =
[212.44.18.254])^M
        by email.right2.org (Haraka/2.5.0) with ESMTPSA id =
770D3771-B9E8-48BA-B1EF-CD8161FC9183.1^M
        envelope-from <joe@right2.org> (authenticated bits=3D0)^M
        (version=3DTLSv1/SSLv3 cipher=3DAES128-SHA verify=3DFAIL);^M
        Fri, 21 Nov 2014 17:39:46 +0000^M
From: Joe Eaves <joe@right2.org>^M
Content-Type: text/plain; charset=3Dus-ascii^M
Content-Transfer-Encoding: 7bit^M
Subject: [Right2] -general- Hi^M
Message-Id: <79939293-967A-4149-A48F-DAAF9FEA6D09@right2.org>^M
Date: Fri, 21 Nov 2014 17:39:45 +0000^M
To: "right2-general@right2.org" <right2-general@right2.org>^M
X-Mailinglist: right2-general
Reply-To: right2-general@right2.org
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))^M
X-Mailer: Apple Mail (2.1510)^M

Any ideas? The ^M worries me but I don't know if it's a major issue? =
Maybe I'm missing a header?

Cheers,

Joe

--
:wq!


--Apple-Mail=_BD850D1C-C958-4691-A609-3EDFB7435F20
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJUb3meAAoJEPHx7tTUAhHxyQAQAKeFrDCTBxs7pOxt2mWpsu04
AJWLEX9y90zEYJBFr5fNUiQcoGH6aPEwpTLsHWxzshR7/EoNrt/fjl8FY4CHWAmd
SEsWWNjyjufIFY1diJFWcRL59NGRnrHbemvd3mE18qnT79G77ppTBuJKDdNG6IL8
wfmwAdxRrWnJoBZFhj7Yj0l5llHUNR8kHD/ZBzGjU40grWID94egcXBt+IvZcSBk
RNyr00B/zm81nFjyyBls9PshdgmnXu1PDOYDe6cSUk6nS517UcBIT/VBntNIF1OK
xtJKQTiAVvB3LIbrbb0is6tk6WwdbdXPmOzwOpkUJkBRFV0JA0O6TYl6g3OaqXr4
HxjdBkKSmTOmyo7miexvjFXlSVlTc6lrA7VZdSvV/3nswbgHjuy62Oi2zJ/Q8/jw
wHe7dBY1itSb8j0OGkgRsIUJC/o3kelTtkek0GGoZBJjWyfCgQoubs2kv82I51hp
ahW2wEoVNTCMaKe8BiBmMyuIJwtaa706xzdDK9i5r75shjl+U2n5DCsvmf40iB4X
NkaBk7KfI1jRZD0K2etay3TzMMFgvIRAFYqhaajoBJivICJtoUxaBx7vS1UEcSxm
eTobK9yoSzNTpobAyEacWb0otKsR87aWStKZdmQQ6oW2hEhqxWNuEwqHLd5ePpkl
xDe6Nj/EJOhFwfmpZkQI
=/S50
-----END PGP SIGNATURE-----

--Apple-Mail=_BD850D1C-C958-4691-A609-3EDFB7435F20--

