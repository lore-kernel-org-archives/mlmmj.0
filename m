From: "Oliver Gading" <og-ml@gading.de>
Date: Wed, 26 Dec 2007 21:49:21 +0000
Subject: RE: delimiter problem
Message-Id: <20071226214952.851CC10AC11B@canopus.gading.de>
List-Id: <mlmmj.mlmmj.org>
References: <20071221161243.8DC4F10AC1A4@canopus.gading.de>
In-Reply-To: <20071221161243.8DC4F10AC1A4@canopus.gading.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hello Morten 

> -----Original Message-----
> From: Morten K. Poulsen [mailto:morten@afdelingp.dk] 
> Sent: Monday, December 24, 2007 11:30 PM
> To: mlmmj@mmj.dk
> Subject: Re: delimiter problem
> 
> Oliver Gading wrote:
> > i have some lists named "list-mylist", with a dash ("-").
> > In previous postings I read, that it's not possible to use the 
> > "-"-delimiter in that cases. But the "+"-delimiter would be 
> possible.
> 
> Well, it depends on your mail server software. If it exports 
> the "recipient extra" data as an environment variable, it 
> will work just fine. Examples of such fine mail server 
> software is qmail, Postfix and Exim.

I wrote a small shell script which executes "env" and writes its output to a
log file. In postfix aliases file I replaced mlmmj-receive with my shell
script. Following environment variables are exported by postfix:

USER=list-mylist
LOCAL=list-mylist_subscribe
EXTENSION=subscribe
DOMAIN=<MAILHOSTNAME>.<MAILHOSTDOMAIN(.TLD)>
LOGNAME=list-mylist

When changing postfix's recipient_delimiter to "-" and also the mlmmj lists
delimiter to "-" then following line appears in the mail.log file:

 ---------------------------------------------------------
 <DATE> <HOST> /usr/local/bin/mlmmj-process[13838]: listcontrol.c:740:
 Unknown command "mylist". Ignoring mail: Success
 ---------------------------------------------------------

The mail is not being delivered to the subscribers.

But when changing back the delimiter to i.e. "_" (or "+") then all things
work properly.

> 
> > In Germany we have a very well known freemail hoster (web.de), and 
> > their webmail gui does not accept the "+"-character within 
> email addresses.
> 
> That is bad. Have you told them about the issue?

No. But this is the only free-webmailer I was testing. May be there are
other webmail companies around who are not supporting a "+"-sign within
email addresses.

> 
> > Are there any plans to make it possible to use 
> list-mylist@domain.tld 
> > named lists with the "-"-delimiter?
> 
> Not if your mail server does not export the "recipient extra" 
> data. It is impossible to tell if "list-faq@example.com" is 
> for "list" with "faq" 
> as extra data, or if it is for "list-faq" with no extra data.

See my notes above.

Oliver

