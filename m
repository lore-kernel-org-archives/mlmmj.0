From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 07 Sep 2004 09:08:41 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907090841.GD80419@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Christian Laursen <xi@borderworlds.dk> [Sep 07. 2004 10:51]:
> > Is there any particular reason why the list configuration is
> > situated in the same directory structure as the list queue and
> > archive? According to the FHS[1], list configuration should be
> > somewhere under /etc while the queue and archive should be somewhere
> > under /var. This would have the added benefit that list
> > configuration could be stored on a read-only file system for added
> > security.
> 
> Personally I find it convenient to have everything related to a list
> located under the same directory.

Ditto. Also backups, moving lists etc. are simplified.

> I don't see a problem in adding optional support for having the
> control dir located in a seperate location but the current directory
> layout should continue to be the default to avoid breaking existing
> configurations.

We might add that if it's really needed, but as morten said, it's
entirely possible to symlink to a readonly place in /etc. Will make
the webinterfaces useless though.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
