From: Patrick Bennett <patrick@pebcomputing.com>
Date: Thu, 22 Dec 2005 05:15:24 +0000
Subject: send as both doesn't
Message-Id: <43AA366C.3000605@pebcomputing.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I've just experienced a problem with delivery of emails sent from a 
thunderbird for win32 client (v1.0.6) to my mlmmj list when "send as 
both plain text and html" was selected- the messages were not 
delivered.  My mailserver logs show that postfix received then, but they 
were never "+bounce"'d to the list members.  I can't find any trace of 
the post in the various queues- they seem to have been sent to /dev/null 
for all i can tell.

I am using Soren's sarge package of 1.2.9-1.

    -Patrick Bennett
