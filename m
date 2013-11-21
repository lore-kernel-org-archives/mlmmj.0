From: "Christian Gleerup" <christian.gleerup@swn.nu>
Date: Thu, 21 Nov 2013 20:59:27 +0000
Subject: [mlmmj] Problems with microsoft
Message-Id: <90126ceb66d472c9ae7d603e72640bfb@swn.nu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


Dear List.
 
I use mlmmj to send newsletters, and I have the following problem, but now more serious since Microsoft have blocked the server.
 
Problem 1.
Our mail recipients sometimes receives a bunch of mails with the following message "some messaged could not be delivered. If you see this things are back to normal."
They get many of these, so they complain.
I understand that they get one mail telling them that everything Works, but why 10-40?

 
Is it a configuration problem between mlmmj and postfix?
I have the following settings for postfix and mlmmj that I think is relevant for the problem. But i don't really understand how they interact, could there be some configuration error so mlmmj fills postfix with a queue due to lack of respone.


* /etc/postfix/main.cf
bounce_queue_lifetime = 2d
minimal_backoff_time = 1800s


* in  'tunables' bouncelife
2592000
(30 days)


Problem 2
Microsoft think I am doing 'namespace mining', I know I don't. but maybe it is somehow connected to the problem above ?


Best Regards and I hope you can help me.
/Christian




