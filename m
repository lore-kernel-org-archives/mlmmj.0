From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 09 Oct 2007 09:52:34 +0000
Subject: Re: change hostname, messages in queue
Message-Id: <60051E6F-5079-493D-A15A-62B3019F9DA6@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20071008215435.GN7082@localhost>
In-Reply-To: <20071008215435.GN7082@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


On 09/10/2007, at 11.48, Lukáš Hlůže wrote:

> Yes, I am running mlmmj-maintd via cron. I try munual run, but doesn't
> help.
>
> Howto resend mails in queue dir manually? Any advice?

It's because it cannot deliver to the relayhost, probably. If you  
tail the log from the mailserver while running mlmmj-maintd manually  
you should see the reason. mlmmj should also log what happens.

We have to see your log files to help you.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.





