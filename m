From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 08 Jan 2005 11:22:59 +0000
Subject: Re: mlmmj <-> ezmlm
Message-Id: <20050108112259.GX712@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <41DD4C12.9070509@mikegrice.com>
In-Reply-To: <41DD4C12.9070509@mikegrice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mike Grice <mike@mikegrice.com> [Jan 06. 2005 15:30]:
> Hi there,
> 
> I've got a (potentially) tricky problem.  We are moving our mail
> system over to Exim from qmail, and one of the major blocks in our way
> is that we have literally hundreds of mailing-lists set up using
> ezmlm.  I found out about this project during my search for a
> replacement.
> 
> What I want to know, and I'm praying that the answer is yes, is the
> following.
> 
> Is there an easy (read: automated) way to convert an ezmlm
> mailing-list and preserve its information to an mlmmj list?  If this
> is the case, I will be able to migrate our current lists over to mlmmj
> and all will be good.

There is none yet, but I don't think it will be that hard.

The subscribers will be handled by a bash loop something like this, you
should of course substitute withyour install paths etc.:

for ADDR in `/usr/local/bin/ezmlm-list /var/spool/ezmlm/NAME` ; do
        /usr/local/bin/mlmmj-sub -L /var/spool/mlmmj/NAME -a $ADDR
done

It's getting too long since I touched ezmlm lists to remember the
settings flags, but I dunno if it wouldn't be better to sit down reading
TUNABLES and deciding freshly for each new list.

If you manage to create a nice script for this, I'll of course add it to
the contrib/ directory of mlmmj ;-)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
