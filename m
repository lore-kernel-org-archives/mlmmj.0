From: Neale Pickett <neale@woozle.org>
Date: Tue, 15 Nov 2005 15:43:46 +0000
Subject: -bounces-help loops
Message-Id: <200511150843.46931.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

So I have a couple of mail hosts stuck in a "-bounces-help loop".  They send 
mail to listname-bounces-help, which then replies with a message explaining 
options.  But that mail has a SMTP "mail from" of listname-bounces-help.  The 
remote mailer for whatever reason accepts the mail, then bounces it to the 
"mail from", and thus goes the loop.

A solution to this would be to have -bounces-help mail (mail in response to a 
message to -bounces-help) come from some other address that doesn't respond.  
Maybe -bounce-loop.  I'll work on a patch for this, but maybe there's a 
better way?

Neale
