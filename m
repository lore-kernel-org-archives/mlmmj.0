From: martines <wimbaster@gmail.com>
Date: Thu, 17 Sep 2009 07:30:24 +0000
Subject: mlmmj and Postfix virtual
Message-Id: <927bf3190909170030v353aa33dx1c8ae5081fa38297@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello, I have a problem setting mlmmj un Postfix virtual domain
(Debian Lenny). The best I have got is "unknown user"...
I followed the http://mlmmj.org/archive/mlmmj/att-0511/README.postfix manual.

Here are the details:

/var/spool/mlmmj/transport:
/^(mltest).*$/          mlmmj:$1

/var/spool/mlmmj/virtual.regexp:
/^(mltest.*)@domain.com$/   $1

/etc/postfix/main.cf:
# mlmmj
transport_maps = regexp:/var/spool/mlmmj/transport
mlmmj_destination_recipient_limit = 1
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
myorigin = /etc/mailname
mydestination = localhost
virtual_mailbox_domains = domain.com
virtual_uid_maps = static:105
virtual_gid_maps = static:106
virtual_alias_maps = hash:/etc/postfix/virtual,
regexp:/var/spool/mlmmj/virtual.regexp

/etc/postfix/master.cf:
mlmmj   unix  -       n       n       -       -       pipe
  flags=DORhu user=mlmmj argv=/usr/bin/mlmmj-recieve -F -L
/var/spool/mlmmj/$nexthop/

/etc/passwd:
mlmmj:x:1004:1005::/var/spool/mlmmj:/bin/sh

--
# id postfix
uid5(postfix) gid6(postfix) groups6(postfix)



When sending a test message, i receive:

                   The mail system

<mltest@domain.com>: unknown user: "mltest@domain.com"


Have to chown the /var/spool/mlmmj/ to mlmmj, postfix, nobody, root,
nothing helped. Any iedea?

Thank's in advance,
Martines

