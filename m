From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 16 Jan 2005 18:36:45 +0000
Subject: Re: Empty mail
Message-Id: <20050116183645.GT33603@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

Sorry about the last empty one. I'm doing the final tests for 1.2.0-RC1
(with VERP support) and did

 $ echo | mail mlmmj@mmj.dk

Instead of

 $ echo | mail mlmmj-test@mmj.dk

The VERP support performance looks good, and will bring mlmmj+postfix up
to the same speed as qmail+ezmlm.

Would anyone happen to know how to use VERP with qmail over SMTP instead
of qmail-inject?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
