From: "Christian Gleerup" <cromozon@swn.nu>
Date: Tue, 22 Dec 2015 10:07:33 +0000
Subject: [mlmmj] I have gotten a strange error: Diagnostic-Code: x-unix; internal software error
Message-Id: <ab6692e92a6ffd7973d02987479fa21f@swn.nu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

In the mlmmj.operation.log, I can see 'a mail from ..." was allowed by rule=
 #0 ...
but 20 minutes later the send-only-mail-adress received an error message.

I did myself get the mail on my subscribed address...

but I am a bit worried, anyone have an idea what this message is caused by =
and what to adjust?


here is the message i received...
----- Original Message -----
=C2=A0From:
"MAILER-DAEMON@domain (Mail Delivery" <System)>
To:
send-only-mail-adress@domain
Sent:
Thu, 17 Dec 2015 10:20:23 +0100 (CET)
Subject:
Undelivered Mail Returned to Sender
This is the mail system at host lists.domain.

I'm sorry to have to inform you that your message could not
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to postmaster.

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

The mail system

< domain--listname@localhost.mlmmj> (expanded from
<listname@domain>): Command time limit exceeded:
"/usr/local/bin/mlmmj-receive"

Reporting-MTA: dns; domain
X-Postfix-Queue-ID: 30008DF4AC
X-Postfix-Sender: rfc822; send-only-mail-adress@domain
Arrival-Date: Thu, 17 Dec 2015 10:03:43 +0100 (CET)

Final-Recipient: rfc822; domain--listname@localhost.mlmmj
Original-Recipient: rfc822;lstname@domain
Action: failed
Status: 5.3.0
Diagnostic-Code: x-unix; internal software error




