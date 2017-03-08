From: Profpatsch <mail@profpatsch.de>
Date: Wed, 08 Mar 2017 14:15:01 +0000
Subject: [mlmmj] Getting notified if a subscription mail bounces
Message-Id: <20170308141501.GG15929@katara.openlab.lan>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

I have a simple mlmmj+postfix setup here.
Now if I want to subscribe an @aol.de user, the mail bounces:

(host mailin-01.mx.aol.com[64.12.88.131] said: 521 5.2.1 :  AOL will not ac=
cept delivery of this message. (in reply to end of DATA command))

But that only appears in the system log.
Is it possible to forward such bounce messages to the owner?

--=20
Proudly written in Mutt with Vim on NixOS.
Q: Why is this email five sentences or less?
A: http://five.sentenc.es
May take up to five days to read your message. If it=E2=80=99s urgent, call=
 me.

