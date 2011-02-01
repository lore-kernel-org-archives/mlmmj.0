From: Florian Effenberger <floeff@gmail.com>
Date: Tue, 01 Feb 2011 15:18:32 +0000
Subject: [mlmmj] disabling delivery notifications
Message-Id: <AANLkTi=BzihGTn08x2oJo1NUX3UHMzJ5wLUYT7yi2XVF@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

can mlmmj already disable delivery notifications out of the box, or
would I have to add this to delheaders?

If the latter one, may I suggest that removing delivery notification
headers gets built in as default? :-) IMHO, the following headers
should be relevant (shamelessly stolen from Mailman):

* return-receipt-to
* disposition-notification-to
* x-confirm-reading-to
* x-pmrqc

Thanks,
Florian

