From: Henne Vogelsang <hvogel@opensuse.org>
Date: Tue, 24 Apr 2007 09:40:51 +0000
Subject: Verbosity (Was: maxmailsize text missing)
Message-Id: <20070424094051.GA12856@suse.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

On Tuesday, April 24, 2007 at 11:11:22, Christoph Wilke wrote:
> On Tue, April 24, 2007 10:35, Henne Vogelsang wrote:
> >
> > the text for the maxmailsize deny mail is missing in text.skel.
> > Please add it for the next release.
> 
> Have a look at the attached patch.
> It includes the english text and a little modification
> in the correponding Makefile.in, so the existing maxmailsize
> file(s) will be installed in the text.skel directory.

Looks good. While we are at it... some general thing. At the moment i
deal alone with all subscriber problems etc. for all opensuse lists
(primarily to gain experience what the problems are and because im too
lazy to setup a webinterface for owners) and one thing that does come up
all the time is that deny/error mails are not exactly verbose. For
instance this text could include the maxmailsize number and the size of
the sent mail. For access rules or its the same. Logging is (mostly) fine
but we could make this much more admin/owner friendly if deny/error
mails would include as much usefull information as possible so users can
act on it.

Henne 

-- 
Henne Vogelsang, Teamlead Core Services
http://www.opensuse.org
