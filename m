From: Moritz Wilhelmy <ml+mmj@wzff.de>
Date: Fri, 09 Sep 2011 20:31:18 +0000
Subject: [mlmmj] Moderated subscription and list-owner approval
Message-Id: <20110909203118.GV22957@barfooze.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

If subscription is moderated, and users are being subscribed via
mlmmj-sub, a subscription is sent to the owner/moderators. Given that
root can do anything to the files subscribers.d, it is not reasonable to
also require a confirmation mail in this case. Would you mind changing
mlmmj to not send a confirmation-request mail to the list
owner/moderators in case someone is subscribed to list where
control/submod is set, but rather silently subscribe the particular
users, the way it does it when the flag is not set?

Best regards,

Moritz

