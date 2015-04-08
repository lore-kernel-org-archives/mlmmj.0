From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 08 Apr 2015 06:16:19 +0000
Subject: Re: [mlmmj] Setup access rule to only allow single sender IP
Message-Id: <5524C7B3.6090004@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <20150407222757.3cea20fa@chg-trisquel>
In-Reply-To: <20150407222757.3cea20fa@chg-trisquel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 04/08/2015 01:48 AM, Christian Gleerup wrote:
> Hi Chris
> 
> The computer that the mail is written from can be different,  but
> they are send from a webmail client, as far as i can see, it does not
> embed the ip in the email header.

That's unusual.  Usually a webmail system would talk SMTP to the local
MTA, thereby leaving a "Received:" mail header that would contain the
connection IP address (even if it's localhost [127.0.0.1]).  Are you
saying that even this isn't added to the header?

> So i was wondering if it could be seen in some other way?

Well if you're sending mail from a webmail system then the /web server/
would be the only place that would know the connection IP address.  From
there if the webmail system contacts the MTA, the MTA will only get the
IP of the webmail system, not the originating IP connecting to webmail.

It might be possible to write an ACL /in the MTA rules/ to do what you
want here, but it would require the ACL to be able to parse the webmail
logs, i.e. the webserver logs for webmail connections.  There are
versions of Exim [such as exim4-daemon-heavy on Debian] which contain
embedded Perl where you could write such a rule and use Perl regexes
and so forth to match on an IP or a particular authenticated username...
but all of this is dependent on what MTA you're using.

   -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

