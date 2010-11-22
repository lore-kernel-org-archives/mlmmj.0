From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 22 Nov 2010 09:39:37 +0000
Subject: [mlmmj] Conditionals in list texts
Message-Id: <4CEA3A59.7050007@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, everyone,

As I mentioned earlier, I am planning to implement a feature or few that affect 
list texts before producing a 1.2.18 release candidate. This probably includes the 
ability to reject held posts, simultaneous subscription and moderation (which I 
will email about shortly), and auto wrapping in list texts. These have all been 
raised on the list before.

Another feature I would like to implement, in order to simplify list texts, 
particularly so we can have fewer of them, is conditional sections. These would be 
much like the C preprocessor's #if #else #endif directives, and could be used to 
include or exclude parts of listtexts dependent upon various list parameters (e.g. 
whether subscription is enabled, which version of the list is being subscribed to, 
etc.). It would use some variant of the $whatever$ syntax, and I expect at first 
that it will be very simple, probably not supporting any boolean operations or 
nesting or anything.

It would reduce the number of listtexts, making a number of them more generic, but 
to aid transition, at first I would look for the more specific ones as a priority, 
and fall back to the new generic ones, so people's old texts continue to work.

Any comments on this before I dive in?

Ben.



