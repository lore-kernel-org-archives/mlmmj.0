From: "Jakob Hirsch" <jh@plonk.de>
Date: Tue, 11 Oct 2005 09:30:05 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II:
Message-Id: <59530.193.99.214.134.1129023005.squirrel@ymmv.de>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>> But ok, I yield to the overwhelming majority. :)
>> I'll add a switch so people can disable MIME handling. Or should the
>> default be "off"?
> I think the default should be off, so we're keeping compatibility, and
> old installations will never all of a sudden change behaviour.

sounds sensible.

> DIR/control/mimeencapsulate seems like the TUNABLE for it :-)

something like footer_use_mime sounded logical for me, as it's only used
if there's a footer, but I don't really care about that.


About the writen()s you mentioned: abort if they fail?

