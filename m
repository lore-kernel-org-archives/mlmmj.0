From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 11 Apr 2009 08:28:40 +0000
Subject: Re: listcontrol.c
Message-Id: <63CC2045-74B3-4115-9B32-CABCBE5D6097@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20090411101122.fd24714d.kolar@fzu.cz>
In-Reply-To: <20090411101122.fd24714d.kolar@fzu.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


On 11/04/2009, at 10.11, Pavel Kolář wrote:

> The line 719 in listcontrol.c (version 1.2.16) contains strcmp.
> Is it really the author intention (security?)? Otherwise, I would
> suggest to use strcasecmp instead. (i.e. to allow the mixed case
> in the owner addresss for the message to listname+list@...)


It's a safe strcmp, yes.

fromemails->emaillist[0] cannot not exist if we get this far, and
owners->strs was just populated right before the for-loop:

owners = ctrlvalues(listdir, "owner");

So it's ok to use strcasecmp instead, and I've just done so and com-
mitted to CVS. Thanks for spotting!

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.


