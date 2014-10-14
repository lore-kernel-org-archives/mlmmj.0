From: G Stansfield <gstansfield@isat.co.za>
Date: Tue, 14 Oct 2014 12:26:39 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <543D167F.6060603@isat.co.za>
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 08-Oct-14 7:00 PM, webmaster@vlsc.org wrote:
> I looked through the documentation, and installed mlmmj per the readme
> and install documents on a virtual CentOS server.
>
> I have created a test email list - sail2@vlsc.org - and added 2
> subscribers using mlmmj-sub. All appears to be setup properly, but when
> I send an email to the list using one of the subscribed addresses
> (webmaster@vlsc.org), my mail log file shows the following:
>
> Oct    7 23:14:21 cloud sendmail[1390]: s97NEL7Z001390: from=3D<webmaster=
@vlsc.org>, size=1250, class=3D0, nrcpts=3D1, msgid=3D<54347310.8030905@vls=
c.org>, proto=3DESMTP, daemon=3DMSA, relay=3Dc-24-22-61-28.hsd1.or.comcast.=
net [24.22.61.28]
>
> Oct    7 23:14:22 cloud sendmail[1390]: s97NEL7Z001390: Milter insert (1)=
: header: DKIM-Signature:    v=3D1; a=3Drsa-sha256; c=3Dsimple/simple; d=3D=
vlsc.org; s=DEfault;\n\tt=1412723662; bh=3DSrfRFSC5LbQjGOAy8L6/MImtgtMNuon/=
/Nkbtb0XVZI=3D;\n\th=DAte:From:To:Subject;\n\tb=3DoKK6sefKYUbo7sC8oIAK0bnVA=
92vas8lkpOYQsVd//ru+cu5Eyg13wGRlZ+vyAUH2\n\t ko/f+ma6dQdizl1mVIq35h62m1tS+T=
Hd8LMZtadOFT1kiyG2HHyasmiqK1UuVjCbxO\n\t 6RfbPTriyZKsXnZfDK4y4pcoAqRextw+Zd=
KOrDU8>
> Oct    7 23:14:22 cloud opendkim[771]: s97NEL7Z001390: DKIM-Signature fie=
ld added (s=DEfault, d=3Dvlsc.org)
>
> Oct    7 23:14:22 cloud sendmail[1392]: s97NEL7Z001390: to=3D/dev/null, c=
tladdr=3D<sail2@vlsc.org>  (8/0), delay=00:00:01, xdelay=00:00:00, mailer=
=3D*file*, pri1824, dsn=3D2.0.0, stat=3DSent
>
>
> The entry "to=3D/dev/null, ctladdr=3D<sail2@vlsc.org>" seems suspicious,
> like the email is being dumped to /dev/null instead of being delivered
> to the list.
>
> Can anyone help me by letting me know if I've missed some piece in my
> setup, or at least how to interpret this log entry correctly?
>
> I'm a refugee from majordomo who is trying to get our new server running
> with mlmmj so our organization can continue to run several small
> in-house email lists.
>
> Thanks for any help!
>
> Philip
Hi Philip!
Did you come right with this? If so, please tell me how!

I tried this some years ago in a home / test environment (using=20
OpenSUSE) before rolling out to a small production LAN - and failed=20
miserably! The only documentation I found was from mlmmj. Asked the=20
mlmmj list and still did not come right. Perhaps I was misunderstanding=20
something on the sendmail side of things.

I toyed with the idea of switching to postfix, but have some custom=20
rules in sendmail so did not want to take on a new learning curve for=20
what was essentially a functionality for which the users were not=20
clamouring at that time.

Regards,
Geoff

