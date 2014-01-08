From: Andreas Schulze <sca@andreasschulze.de>
Date: Wed, 08 Jan 2014 21:29:28 +0000
Subject: [mlmmj] TUNEABLES relayhost and smtpport
Message-Id: <20140108222928.Horde.EGrNHHlwq_UyjxXFw7ahsg3@horde.andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

could it be that both TUNEABLES are only used to forward valid messages.
What about rejects for example if a nonmember send to a list where  
control/subonlypost exist?
To mee it looks like this type of messages is not injected via  
relayhost/smtpport but
/usr/sbin/sendmail. Do I somthing wrong?

Thanks,
Andreas



