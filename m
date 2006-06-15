From: Thomas Goirand <thomas@goirand.fr>
Date: Thu, 15 Jun 2006 14:06:56 +0000
Subject: Mail sent to mlmmj-recieve but MLMMJ don't send subscribe confirmation
Message-Id: <44916980.7060706@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hello,

I have a problem with a setup. It seems mlmmj receives the mail, but it
doesn't sends the confirmation email to postfix. Does one of you know
where and how I should fix it? Any place where I should look at?

What is strange is that it's an automated setup, so it should be the
same setup as I usually use. I really don't understand...

Here is the postfix log:

connect from node0103.gplhost.net[66.251.193.20]

postfix/smtpd[16073]: 46AC5FC015: client=3Dnode0103.gplhost.net[66.251.193.=
20]

postfix/cleanup[16079]: 46AC5FC015: message-id=3D<449167D7.203@domain1.fr>

postfix/qmgr[19244]: 46AC5FC015: from=3D<thomas@domain1.fr>, size=880,
nrcpt=3D1 (queue active)

postfix/smtpd[16073]: disconnect from node0103.gplhost.net[66.251.193.20]

postfix/smtpd[16083]: connect from localhost[127.0.0.1]

postfix/smtpd[16083]: 31066FC018: client=3Dlocalhost[127.0.0.1]

postfix/cleanup[16079]: 31066FC018: message-id=3D<449167D7.203@domain1.fr>

postfix/qmgr[19244]: 31066FC018: from=3D<thomas@domain1.fr>, size=1430,
nrcpt=3D1 (queue active)

postfix/smtpd[16083]: disconnect from localhost[127.0.0.1]

amavis[19261]: (19261-04) Passed, <thomas@domain1.fr> ->
<stoppnazistene.no_testzigo-subscribe@mx.xen330220.gplhost.com>,
Message-ID: <449167D7.203@domain1.fr>, Hits: -

postfix/smtp[16081]: 46AC5FC015:
to=3D<stoppnazistene.no_testzigo-subscribe@mx.xen330220.gplhost.com>,
orig_to=3D<testzigo-subscribe@stoppnazistene.no>,
relay=127.0.0.1[127.0.0.1], delay=3D2, status=3Dsent (250 2.6.0 Ok,
id=19261-04, from MTA: 250 Ok: queued as 31066FC018)

postfix/qmgr[19244]: 46AC5FC015: removed

postfix/local[16085]: 31066FC018:
to=3D<stoppnazistene.no_testzigo-subscribe@mx.xen330220.gplhost.com>,
relay=3Dlocal, delay=3D1, status=3Dsent (delivered to command:
/usr/bin/mlmmj-recieve -L
/var/www/sites/dtc/stoppnazistene.no/lists/stoppnazistene.no_testzigo/)

postfix/qmgr[19244]: 31066FC018: removed
