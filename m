From: Sebastian Lipp <bacuh@riseup.net>
Date: Mon, 04 Mar 2013 14:27:12 +0000
Subject: [mlmmj] feature: resending capability
Message-Id: <20130304142712.GA19707@eee.fritz.box>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey there

I'm running several mailing lists with mlmmj and absolutely satisfied
with this great piece of software. But there is one capability that
would make me love mlmmj even more.

Theres a project where several people are involved. At the moment I'm
the only one receiving it's mail. I'd like to have all mails forwarded
to the project's mailing list to rise transparency and distribute the
burden of dealing with mail to everyone involved. The problem with just
forwarding and then cc-ing replies to outside people is that their
replies won't be directed to the list but to the sender of the original
reply.

I can think of a solution. If mlmmj parsed the mail's body and added
$external_recipient to the list of recipients if the first non-empty
body line was

	X-RESEND-TO: $external_recipient

I'd be satisfied. Unfortunately my understanding of C is far from beeing
good enough to make such a change to mlmmj's code, though I can imagine
that this would just add a few lines of code while introducing a great
new use case by empowering mlmmj to act as a gateway to contact a whole
group transparently.

Is my assumption about the effort needed to introduce this feature right
and is anybody willing to invest some minutes on this?

As an alternative: Is there any way to hook a filter (script) between
the MTA and mlmmj that makes a copy of the mail and adds a Reply-To:
header or can you imagine any other solution for this that does not
involve setting up another mailing list software? Perhaps by telling my
MTA (postfix) to add the respective header line to any mail with a
certain string in the To: field.

-- 
basti

