From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 08 Apr 2015 01:34:18 +0000
Subject: Re: [mlmmj] Setup access rule to only allow single sender IP
Message-Id: <5524859A.6080505@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <20150407222757.3cea20fa@chg-trisquel>
In-Reply-To: <20150407222757.3cea20fa@chg-trisquel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 04/07/2015 04:27 PM, Christian Gleerup wrote:
> Hello list.
> 
> I have a newsletter where only one is allowed to send out emails,
> currently I have a rule in the access file that only allows emails
> where the from header corresponds to the correct sender email.
> 
> but I can see there are some attempts to abuse the list, so I would
> like to add a limit on the IP adress?
> 
> Is that possible? (I am not sure the IP itself is part of the email
> address)

I imagine you could do something like:

  allow ^Received: from mail.itoverblik.dk ([81.7.162.170])

assuming that the MTA you're using includes the sending IP address in
these headers (most do).

   -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

