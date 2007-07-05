From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 05 Jul 2007 21:39:18 +0000
Subject: Re: Support for X-No-Archive planned?
Message-Id: <20070705213918.GB1144@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070705144515.GC21671@ptaff.ca>
In-Reply-To: <20070705144515.GC21671@ptaff.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Thomas Goirand <thomas@goirand.fr> [Jul 05. 2007 22:26]:
> > Anyway, a simple approach to do it synchronously could be to use the
> > "noarchive" control flag, i.e. setting it to "2" would honour the
> > X-No-Archive header. But it would be probably better (more generic and
> > flexible) to create a new flag "archivewith", which would define an
> > external program to do the archiving (or not, depending on whatever
> > somebody wants, and also _where_ one wants, like an RDBMS or such, e.g.).
> 
> It would be VERY nice to be able to launch a web archive program to
> update the web archive in real time whenever a message arrives (mhonarc
> in my case), so it doesn't have to wait for the next cron job to be
> executed (and even removing the need of any cron job).

I've long planned to have a 'postcommand' control file that then would
get executed with the archive path appended so you could have something
similar to:

 /usr/bin/hypermail -c /my/conffile -1 -m

in the file which then would be executed after done delivery like

 /usr/bin/hypermail -c /my/conffile -1 -m /var/spool/mlmmj/list/archive/23

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
