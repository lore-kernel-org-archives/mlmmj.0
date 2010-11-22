From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 22 Nov 2010 09:50:37 +0000
Subject: [mlmmj] Subscribe and moderate
Message-Id: <4CEA3CED.1010706@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi again, folks!

A while ago, someone requested a feature to allow people to simultaneously 
subscribe to a list (particularly to the nomail version) and moderate a post. The 
idea is that when non-subscriber posts to a subonlypost list, they receive a 
rejection notice. If they're not a spammer, they may then like to subscribe. It 
would be convenient if they could simply reply to the rejection notice to be 
subscribed, and moderate the original post that was denied.

I'm thinking of implementing this with no new tunables. The feature would always 
be avaiable when appropriate: when a post is rejected specifically because of 
subonlypost (rather than because of an access rule or other reason), the list is 
not closed, and modnonsubposts is not in use. Instead of deleting the rejected 
post, it would be held for moderation. No moderation email would be sent, though, 
only the rejection email to the poster. The list text, when appropriate (using the 
new conditional sections feature), would include notification that the poster 
could subscribe and moderate in a single step by replying, or sending to another 
magic address.

Does anyone have any comments or objections?

Ben.



