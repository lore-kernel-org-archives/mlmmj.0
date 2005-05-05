From: Jakob Hirsch <jh@plonk.de>
Date: Thu, 05 May 2005 20:36:24 +0000
Subject: mail to list+subscribe if already subscribed
Message-Id: <427A83C8.7010304@plonk.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

mlmmj seems to ignore subscribe-mails from already subscribed addresses. 
Shouldn't it notify the user in this case?

Another thing I'd appreciate: Use a custom header instead of To/CC for 
getting the recipient address. This may not sound useful, but I had 
list-management mails sent to the list, because they had no To/CC 
header, but the envelope recipient was right. I'd tell my MTA to put the 
envelope-rcpt into the header (as it happens already with the 
envelope-sender in Return-Path) and would be on the safe side then.

What do you think?
I'd try to put that into the code (not many changes, I'd say) and send 
patches.
