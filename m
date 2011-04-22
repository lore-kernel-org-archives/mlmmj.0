From: Benoit Chesneau <benoitc@metavers.net>
Date: Fri, 22 Apr 2011 08:56:27 +0000
Subject: Re: [mlmmj] issue in configuration
Message-Id: <388D5450-BAFB-4D4B-8349-CAEBAA7648D5@metavers.net>
List-Id: <mlmmj.mlmmj.org>
References: <25A2786F-D0AD-42D1-A5B3-534F60D1FEA6@metavers.net>
In-Reply-To: <25A2786F-D0AD-42D1-A5B3-534F60D1FEA6@metavers.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

sound like it was working but I didn't get any error telling I wasn't suscribed to the list. Is there a way to configure that ?

- benoit
On Apr 22, 2011, at 10:03 AM, Benoit Chesneau wrote:

> Hi all,
> 
> I'm trying to configure mlmmj with postfix+dovecot, and virtual hosting handled in mysql and I get this error in log:
> 
> Apr 22 09:59:06 node0 postfix/qmgr[7734]: A180D15E640D: from=<benoitc@metavers.net>, sizeR9, nrcpt=1 (queue active)
> Apr 22 09:59:06 node0 /usr/local/bin/mlmmj-process[7894]: mlmmj-process.c:702: Found To: rcouch@refuge.io: No such file or directory
> Apr 22 09:59:06 node0 postfix/pipe[7893]: A180D15E640D: to=<rcouch@node0.couchdbhub.com>, orig_to=<rcouch@refuge.io>, relay=mlmmj, delay=0.27, delays=0.17/0/0/0.1, dsn=2.0.0, status=sent (delivered via mlmmj service)
> Apr 22 09:59:06 node0 postfix/qmgr[7734]: A180D15E640D: removed
> 
> What could be the problem?
> 
> - benoit
> 
> snippet of main.cf:
> 
> virtual_mailbox_domains         = proxy:mysql:$config_directory/mysql_virtual_domains_maps.cf
> virtual_mailbox_base            = /var/vmail
> virtual_mailbox_maps            = proxy:mysql:$config_directory/mysql_virtual_mailbox_maps.cf
> virtual_alias_maps              = regexp:/var/spool/mlmmj/virtual.regexp,
>                                  proxy:mysql:$config_directory/mysql_virtual_alias_maps.cf
> 
> virtual_minimum_uid             = 101
> virtual_uid_maps                = static:101
> virtual_gid_maps                = static:101
> 
> transport_maps                  = regexp:/var/spool/mlmmj/transport
> 
> virtual_transport               = dovecot
> 
> mlmmj_destination_recipient_limit = 1
> 
> 
> master.cf:
> 
> mlmmj     unix  -       n       n       -       -       pipe
>   flags=DORhu user=mlmmj argv=/usr/local/bin/mlmmj-recieve -F -L /var/spool/mlmmj/$nexthop/
> 
> /var/spool/mlmmj/transport:
> 
> /^(rcouch).*$/          mlmmj:rcouch
> 
> 
> /var/spool/mlmmj/virtual.regexp :
> /^(rcouch.*)@refuge.io$/        ${1}
> 
> 
> 
> 



