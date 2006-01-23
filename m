From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 23 Jan 2006 18:07:01 +0000
Subject: 1.2.11 is out
Message-Id: <20060123180701.GJ33296@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey again,

Yeah, I'm sorry to bother with another release, but the fix for the
find_email_adr() bug was incomplete, and I want the dust to settle after
this change, before going into another long period of no mlmmj releases.

1.2.11
 o Previous fix to find_email_adr() was incomplete, so in some
   cases mails would get rejected due to the To: or Cc: rule. Thanks
   again lcars for finding this
 o Sanity check to make sure there's a '@' in listaddress

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
