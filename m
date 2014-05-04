From: Emil Hemdal <emil.hemdal.em@gmail.com>
Date: Sun, 04 May 2014 12:41:38 +0000
Subject: [mlmmj] Using mlmmj with Postfix using non-virtual aliases ERROR: unknown user
Message-Id: <53663582.4080307@gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

I'm having issues utilizing mlmmj with Postfix using non-virtual aliases.

I followed all the steps mentioned in the readme page for Postfix 
http://mlmmj.org/docs/readme-postfix/ while using the non-virtual 
aliases aliases part of the readme.

I use mlmmj on Debian 7 64bit.

mail.log is complaining when subscribing:
May  4 13:37:19 mydomain postfix/qmgr[7227]: EED2181041: 
from=<asdf@gmail.com>, size17, nrcpt=1 (queue active)
May  4 13:37:19 mydomain postfix/smtpd[7244]: disconnect from 
mail-la0-f43.google.com[209.85.215.43]
May  4 13:37:19 mydomain postfix/local[7254]: EED2181041: 
to=<list_info+subscribe@localhost.mlmmj>, 
orig_to=<list_info+subscribe@mydomain.tld>, relay=local, delay=0.14, 
delays=0.08/0.02/0/0.04, dsn=5.1.1, status=bounced (unknown user: 
"list_info+subscribe")
May  4 13:37:19 mydomain postfix/cleanup[7253]: 0F87081062: 
message-id=<20140504113719.0F87081062@mydomain.tld>
May  4 13:37:19 mydomain postfix/bounce[7256]: EED2181041: sender 
non-delivery notification: 0F87081062
May  4 13:37:19 mydomain postfix/qmgr[7227]: 0F87081062: from=<>, 
size847, nrcpt=1 (queue active)
May  4 13:37:19 mydomain postfix/qmgr[7227]: EED2181041: removed

Or when I try to send a message to the list directly:
May  4 14:22:40 mensamailtest postfix/local[7317]: D993481062: 
to=<list_info@localhost.mlmmj>, orig_to=<list_info@mydomain.tld>, 
relay=local, delay=0.14, delays=0.08/0.03/0/0.03, dsn=5.1.1, 
status=bounced (unknown user: "list_info")

postconf -n:
alias_database = hash:/etc/aliases, hash:/var/spool/mlmmj/aliases
alias_maps = hash:/etc/aliases, mysql:/etc/postfix/mysql-aliases.cf, 
mysql:/etc/postfix/mysql-group-aliases.cf, hash:/var/spool/mlmmj/aliases
append_dot_mydomain = no
biff = no
broken_sasl_auth_clients = yes
config_directory = /etc/postfix
inet_interfaces = all
mailbox_command mailbox_size_limit = 0
mlmmj_destination_recipient_limit = 1
mydestination = mydomain.tld, lists.mydomain.tld, localhost
myhostname = mydomain.tld
mynetworks = 127.0.0.0/8
myorigin = mydomain.tld
propagate_unmatched_extensions = alias
readme_directory = no
recipient_delimiter = +
relay_domains = mydomain.tld
smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache
smtpd_banner = $myhostname ESMTP $mail_name (Debian/GNU)
smtpd_helo_restrictions = reject_invalid_helo_hostname, 
reject_non_fqdn_helo_hostname, reject_unknown_helo_hostname
smtpd_recipient_restrictions = permit_mynetworks, 
permit_sasl_authenticated, reject_unauth_destination
smtpd_sasl_auth_enable = yes
smtpd_sasl_path = private/auth
smtpd_sasl_type = dovecot
smtpd_tls_cert_file = /etc/ssl/certs/ssl-cert-snakeoil.pem
smtpd_tls_key_file = /etc/ssl/private/ssl-cert-snakeoil.key
smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
smtpd_use_tls = yes
transport_maps = hash:/var/spool/mlmmj/transport

My transport file contains:
mydomain.tld--list_info@localhost.mlmmj mlmmj:mydomain.tld/list_info

My aliases file contains:
list_info:              list_info@localhost.mlmmj

What can I do to resolve this issue I'm experiencing?

/Emil Hemdal

