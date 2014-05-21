From: Christian Lohmaier <lohmaier@googlemail.com>
Date: Wed, 21 May 2014 11:19:58 +0000
Subject: [mlmmj] Dealing with DMARC - any out-of-the-box solution in sight?
Message-Id: <CAOPHaVTAVpbLN9OUyzG7NMWu4szaHCKgLbjE56wvL6tJpFY-2A@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi *,

DMARC is in use by yahoo and others for a while, and gmail and others
already respect the settings, causing many bounces....

I wonder whether mlmmj will have some dmarc-compatible default soon or
how other mailinglist admins deal with the topic.

Disallow all mail from dmarc-policy using senders?
Forward only (no footers, no list-tag, no body filtering... - and no
real solution with some SPF)?
Just replace from-address by "John Doe via <list-addresss>"?
Replace From and add reply-to?
Replace From by forwarder-address?

What have other mailinglistadmins done?
And what is the suggestion by mlmmj-devs?

ciao
Christian

