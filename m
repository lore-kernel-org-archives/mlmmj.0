From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Thu, 18 May 2023 20:36:23 +0000
Subject: [mlmmj] Properly disabling "bounce probes"
Message-Id: <20230518-bonfire-unreached-ad9b67@meerkat>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello:

We are moving vger.kernel.org to be mlmmj-managed, but we've hit the problem
of bounce probe messages confusing or annoying people.

Every now and again, we accept a spam message (despite spamassassin checks and
everything), which is not accepted by subscribers when we try to deliver it
and therefore generates a bounce. This results in the "bounce probe" message
going out, which tends to hit a large enough number of people to cause
grumbling (e.g. everyone with a gmail account).

I saw the suggestion to make the bounce-probe text unreadable to the mlmmj
process, but it seems like a hack, and I'm not sure if turning of bounce-probe
messages means that nobody is ever unsubscribed due to bounces.

Is there a solution that would completely eliminate bounce-probe messages, but
still properly unsubscribe emails that are bouncing?

Thank you,
Konstantin

