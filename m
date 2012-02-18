From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sat, 18 Feb 2012 20:25:29 +0000
Subject: Re: [mlmmj] ezmlm to mlmmj migration - messages
Message-Id: <4F400939.2090509@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20120218124538.GF3704@tor.at>
In-Reply-To: <20120218124538.GF3704@tor.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> 2) Is the message storage just the plain message in mlmmj as it appears
>     to be in ezmlm?

Yep. <listdir>/archive/1, <listdir>/archive/2, etc..

> 3) Is there a way to re-index messages just copied from ezmlm-archive to
>     mlmmj? (depends on the answers to 2)

Not a provided way, AFAIK. It shouldn't be hard to make even a bash
shell script do it, though (list files ordered by date and iterate them,
incrementing a counter while renaming each file).

The index of the next incoming message is determined by <listdir>/index,
which stores the last-used index I believe. Be sure to update that when
you add messages to the archive.

> 4) Worst case scenario: request messages from ezmlm with the address
>     (MAIL FROM:) of the mlmmj mailing list. Does that sound feasible?

You would probably also need to turn off Mlmmj's checking of the To/CC
header (add a tocc tunable). Then it probably works.

Ben.




