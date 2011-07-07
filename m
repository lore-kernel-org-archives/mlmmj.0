From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 07 Jul 2011 12:45:52 +0000
Subject: Re: [mlmmj] help needed: mails are not sent from remote clients
Message-Id: <4E15AA80.5030206@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <324F4CE41849CF4DB056C3C8DC696548DFF76F1240@ERRA.netrtlsrv.com>
In-Reply-To: <324F4CE41849CF4DB056C3C8DC696548DFF76F1240@ERRA.netrtlsrv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

> If I send a mail from a different host to the mailing list it is not
> forwarded to the recipient, although it gets stored in the archive
> directory. That again is what maillog says:
...
> Jul 7 09:00:42 glenfiddich.netrtl.com postfix/qmgr[2734]: 0D171E80D3:
> from=3D<saw-filing3+bounces-16-axel.weber=CBc.de@cbc.de>, size=829, nrcpt=
=3D1 (queue
> active)
...
> Jul 7 09:00:42 glenfiddich.netrtl.com postfix/smtp[7502]: 0D171E80D3:
> to=3D<axel.weber@cbc.de>, relay=3Dmailhostsrv.netrtl.com[10.98.248.151]:2=
5,
> delay=3D0.32, delays=3D0.11/0.01/0.01/0.2, dsn=3D2.6.0, status=3Dsent (25=
0 2.6.0
> <20110707065257.DC87A1C804B@bowmore.netrtl.com> Queued mail for delivery)

This seems to indicate the message was indeed delivered successfully
(accepted by the remote server). Maybe it has been classified as spam or
junk or something by the recipient server, after accepting it, or by a
mail client?

Ben.




