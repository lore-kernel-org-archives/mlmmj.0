From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 17 Jun 2004 19:30:42 +0000
Subject: mlmmj-0.7.3
Message-Id: <20040617193042.GL45162@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey together,

We're now free an in free beer :)

ChangeLog since 0.7.2:

0.7.3
 o Implement control/delheaders in where one can specify all the headers
   to delete in incoming mail to the list.
 o Add +owner functionality (control/owner). Several addresses possible.
 o Relicense the whole thing to be MIT instead of GPL

UPGRADE:
This applies to everyone using mlmmj > 0.7.2:
---------------------------------------------

 Don't forget to add the emailaddress of the list owner
 in listdir/control/owner

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
