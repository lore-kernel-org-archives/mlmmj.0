From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 19 Aug 2004 12:13:09 +0000
Subject: Checking envelope From for recipient delimiter
Message-Id: <20040819121309.GK70901@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey together,

One of the mlmmj users had an incident with a completely horrible bounce
from Lotus Notes.

They bounced to listname+bounces-... in envelope From but had a
different address in To:. Since they've configured the list to not
require the listaddress in the To: or Cc: header, the bounce ended up on
the list.

So I wondered if any of the people on this list (I know there's quite
some wizard sysadmins subscribed :) could see any problem in sending the
mail to listcontrol in case envelope From contains a recipient
delimiter, and in such case completely ignore what's in To: and only
work on the envelope From from there on?

In the case envelope From doesn't contain a recipient delimiter, but the
To: does, I'll also send it on to listcontrol.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
