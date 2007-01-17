From: Christian Laursen <xi@borderworlds.dk>
Date: Wed, 17 Jan 2007 15:31:41 +0000
Subject: Recipient substitution in mail body
Message-Id: <ygfzm8hpt42.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

We have a need for some lists to contain an unsubscribe link inside
the mails sent to the list. This link is required to include the
actual recipient address.

I have implemented a tunable called "substrecipient" that will enable
substitution of the string "$recipient$" inside the mail body with the
actual recipient address in URL encoded form.

This is the diff:
http://borderworlds.dk/~xi/substrecipient.diff

Of course VERP will not be possible with this functionality enabled.

It still needs a little polishing before I go ahead and commit it.

Any comments are welcome.

-- 
Christian Laursen
