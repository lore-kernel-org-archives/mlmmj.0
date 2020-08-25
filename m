From: Martin Brampton <martin@black-sheep-research.com>
Date: Tue, 25 Aug 2020 11:11:55 +0000
Subject: [mlmmj] SPF Alignment
Message-Id: <56c10cea-f802-bc61-0c42-e1bec911986e@black-sheep-research.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Apologies if this has been raised before, but I couldn't find anything.

There seem to be issues over SPF alignment for using mlmmj. Using a mail 
server tends to involve the From address (on the sender's domain) and 
the ReturnPath (on the list server's domain) being different, for 
obvious reasons. But this makes SPF not aligned.

In theory, this would not matter for DMARC if DKIM is aligned. But not 
every sender will have DKIM set up correctly.

Worse, it seems that arrogant and unhelpful BT Internet is sending mail 
to spam if it is not SPF aligned, even though it is passing DMARC, SPF 
and DKIM tests. It appears that a lot of BT Internet users don't look at 
their spam. I can't tell that for sure, but it seems the only 
explanation for what is happening.

If I send to a mailing list that includes a.n.other@btinternet.com from 
a mail box on a different domain to the mailing list, the mail goes to 
spam. If I send from a mail box on the same domain as the mailing list, 
it doesn't go to spam. The only difference I can see is that the former 
is not SPF aligned.

Unfortunately, this makes mlmmj mailing lists unusable if any of the 
list members have addresses like a.n.other@btinternet.com. I don't know 
whether the same applies to any other mail providers.

Any thoughts on this?

