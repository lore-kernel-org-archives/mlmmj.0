From: Moritz Wilhelmy <ml+mmj@wzff.de>
Date: Tue, 08 Mar 2011 14:34:03 +0000
Subject: [mlmmj] Expand macros in control/customheaders?
Message-Id: <20110308143403.GB6752@barfooze.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

The text-directory has macros which are replaced by list-specific text, for
instance $listunsubaddr$ will be replaced by the List-unsubscribe-address.
Adding support for this to control/customheaders would be nice, because it
would elimintate the need to hardcode the
List-{Unsubscribe,Post,Subscribe,Help,Owner,Archive} required by RFC 2369[1].

Of course the future mlmmj-make-ml could just run sed on these, and generate
them per-list, but expanding this kind of macros seems like a good idea to me
to do in customheaders instead.


Best regards, 

Moritz

[1] http://www.faqs.org/rfcs/rfc2369.html

