From: Andreas Schulze <sca@andreasschulze.de>
Date: Wed, 21 May 2014 22:06:19 +0000
Subject: Re: [mlmmj] Dealing with DMARC - any out-of-the-box solution in sight?
Message-Id: <20140522000619.Horde.ZSCqViuCQJRMn90bqQpIPA5@horde.andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
References: <CAOPHaVTAVpbLN9OUyzG7NMWu4szaHCKgLbjE56wvL6tJpFY-2A@mail.gmail.com>
In-Reply-To: <CAOPHaVTAVpbLN9OUyzG7NMWu4szaHCKgLbjE56wvL6tJpFY-2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Christian Lohmaier:

> I wonder whether mlmmj will have some dmarc-compatible default soon or
> how other mailinglist admins deal with the topic.
>
> Disallow all mail from dmarc-policy using senders?
no

> Forward only (no footers, no list-tag, no body filtering
yes

> Just replace from-address by "John Doe via <list-addresss>"?
no

> Replace From and add reply-to?
no

> Replace From by forwarder-address?
no

> What have other mailinglistadmins done?
I deal with spf, dkim & dmarc for years. I reduced my mailing-lists to  
handle it's main
purpose: deliver messages to a list of receivers and handle bounces.  
Not less but not more.

the current e-mail eco system enable everybody to choose a sender address.
That will not change. Receivers try to enforce authentication by spf  
or dkim combined to dmarc.
A message will pass the dmarc test if
   - received from SPF announced IP
OR
   - content matches DKIM signature

Listserver obviously will not match most SPF records. So the only  
option to pass the DMARC test is
to *NOT MODIFY THE CONTENT*

Yes, there are other options:
> Just replace from-address by "John Doe via <list-addresss>"?
That works too.
amavis-users  
(http://lists.amavis.org/cgi-bin/mailman/listinfo/amavis-users) is an  
example.

my private lists, postfix-users and most (all?) apache mailing-list  
are examples for *NOT MODIFY THE CONTENT*
They work very well.

If any listadmin like to operate a list NOW, it is possible with mlmmj  
(and mailman) by choosing
the *NOT MODIFY THE CONTENT* way. No code change is needed, no update  
required, no need to wait.
Simply reconfigure the list to *NOT MODIFY THE CONTENT* and tell the  
subscribers how to
filter messages by list-id header instead by Subject. Mission  
comleted, time for coffee.

# cut $LIST_HOME}/control/customheaders
List-Id: <testing.lists.example.org>
List-Post: <mailto:testing@lists.example.org>
List-Help: <mailto:testing+help@lists.example.org>
List-Subscribe: <mailto:testing+subscribe@lists.example.org>
List-Unsubscribe: <mailto:testing+unsubscribe@lists.example.org>
List-Owner: <mailto:testing+owner@lists.example.org>
Precedence: list

Ben, start with this list :-)

Andreas


