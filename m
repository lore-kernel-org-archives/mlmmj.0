From: "Torrens (lists)" <Lists@torrens.org.uk>
Date: Sat, 17 May 2008 15:32:44 +0000
Subject: Bugs
Message-Id: <4fa0f34d76Lists@torrens.org.uk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Sorry, I do not know which version of mlmmj is in use (should there be a
header line added with this info?).

I think I have found two bugs

1: mlmmj is over-sensitive to files not ending in a newline character. I
had a footer file that was like this - as a result about 65 zero bytes get
appended to the end of every outgoing email.

The copy in the archive is however correct.



2: Just had an email with three Content-type lines. mlmmj acted on the
third one - even though only the first was truly in the headers. Two and
three were separated from the headers by a blank line.

The third one was
Content-Type: text/plain; charset=iso-8859-1
so the message got passed as plain text, even though it contained a 2MB
jpeg and an html attachment.



