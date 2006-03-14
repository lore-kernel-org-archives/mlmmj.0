From: Josh Rivel <josh@freek.com>
Date: Tue, 14 Mar 2006 16:42:02 +0000
Subject: relaying denied with postfix-2.2.9 and mlmmj-1.2.11
Message-Id: <20060314164202.GC1858@freek.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="oyUTqETQ0mS9luUI"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.
So I'm running mlmmj-1.2.11 with postfix-2.2.9 on OpenBSD 3.9.
I setup a small list with 3 or 4 user as a test, and I'm getting 
relaying denied messages from postfix whenever I try and send email
to the list.

I am attaching the output of postconf -n, and a snippet from my
postfix logs.  The listname is "bubba@freek.com"

Mar 14 11:20:13 freek postfix/smtpd[15981]: connect from xproxy.gmail.com[66.249.82.197]
Mar 14 11:20:15 freek postfix/smtpd[15981]: 01C3E19315: client=xproxy.gmail.com[66.249.82.197]
Mar 14 11:20:15 freek postfix/cleanup[26209]: 01C3E19315: message-id=<fdaf4190603140820n7bcee179n46b99e477ce4e557@mail.gmail.com>
Mar 14 11:20:15 freek postfix/qmgr[14579]: 01C3E19315: from=<dorqus@gmail.com>, size=1214, nrcpt=1 (queue active)
Mar 14 11:20:15 freek postfix/smtpd[23097]: connect from localhost.freek.com[127.0.0.1]
Mar 14 11:20:15 freek postfix/smtpd[23097]: NOQUEUE: reject: RCPT from localhost.freek.com[127.0.0.1]: 554 <dorqus@gmail.com>: Relay access denied; from=<bubba+bounces-help@freek.com> to=<dorqus@gmail.com> proto=SMTP helo=<freek.com>
Mar 14 11:20:15 freek /usr/local/bin/mlmmj-send[26342]: mlmmj-send.c:241: Error in RCPT TO. Reply = [554 <dorqus@gmail.com>: Relay access denied\^M ]: Undefined error: 0
Mar 14 11:20:15 freek postfix/smtpd[23097]: disconnect from localhost.freek.com[127.0.0.1]
Mar 14 11:20:15 freek postfix/local[17338]: 01C3E19315: to=<bubba@freek.com>, relay=local, delay=1, status=sent (delivered to command: /usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/bubba)
Mar 14 11:20:15 freek postfix/qmgr[14579]: 01C3E19315: removed
Mar 14 11:20:45 freek postfix/smtpd[15981]: disconnect from xproxy.gmail.com[66.249.82.197]


Thanks...

Josh

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="postconf.txt"

alias_database = hash:/etc/mail/aliases
alias_maps = hash:/etc/mail/aliases
command_directory = /usr/local/sbin
config_directory = /etc/postfix
daemon_directory = /usr/local/libexec/postfix
debug_peer_level = 2
default_rbl_reply = $rbl_code Service unavailable; $rbl_class [$rbl_what] blocked using $rbl_domain${rbl_reason?; $rbl_reason}
home_mailbox = Maildir/
html_directory = /usr/local/share/doc/postfix/html
inet_interfaces = $myhostname, localhost
mail_owner = _postfix
mail_spool_directory = /var/mail
mailq_path = /usr/local/sbin/mailq
manpage_directory = /usr/local/man
maps_rbl_domains = dnsbl.sorbs.net
maps_rbl_reject_code = 451
mime_header_checks = regexp:/etc/postfix/mime_header_checks
mydestination = 127.0.0.1, localhost.$mydomain, localhost, $mydomain, www.$mydomain
mydomain = freek.com
myhostname = freek.com
mynetworks = 206.252.131.6/32 127.0.0.0/8
mynetworks_style = subnet
myorigin = $mydomain
newaliases_path = /usr/local/sbin/newaliases
queue_directory = /var/spool/postfix
readme_directory = /usr/local/share/doc/postfix/readme
recipient_delimiter = +
relay_domains = permit_mx_backup, $mydestination, rivels.org, 	aaronvictor.com,	amateurmoviereviews.com,	caina.net,	ccdsm.net,	changeforthemachines.com,	crankdot.com,	dobig.com,	foxdykes.com,	gryllus.com,	gtonk.net,	iosion.com,	machina-ex.com,	michaelstella.com,	port110.net,	port110.org,	somethingsomething.org,	tch0rt,	tch0rt.com,	tephras.com,	thegrayman.com,	thismetalsky.org,	vict0r.net,	vict0rip,	victorresearch.com,	whalerwatch.com,	young-eisendrath.com
sample_directory = /etc/postfix
sendmail_path = /usr/local/sbin/sendmail
setgid_group = _postdrop
smtpd_banner = ESMTP Unauthorized use of this server is prohibited.
smtpd_client_restrictions = permit_mynetworks,permit_mx_backup,check_relay_domains,reject_unauth_destination
smtpd_helo_required = yes
smtpd_helo_restrictions = reject_invalid_hostname
smtpd_recipient_restrictions = reject_rbl_client dul.dnsbl.sorbs.net, reject_rbl_client dnsbl.njabl.org, reject_rbl_client opm.blitzed.org, reject_rbl_client dnsbl.njabl.org, reject_rbl_client relays.ordb.org, reject_rbl_client list.dsbl.org, reject_rbl_client sbl.spamhaus.org, reject_rbl_client cbl.abuseat.org, reject_rbl_client dnsbl.njabl.org, reject_rbl_client blackhole.securitysage.com, permit_mx_backup, reject_unknown_sender_domain, reject_unauth_destination, permit_mynetworks, reject_unauth_pipelining, hash:/etc/postfix/access
smtpd_sender_restrictions = permit_mynetworks
unknown_local_recipient_reject_code = 550
virtual_alias_domains = rivels.org
virtual_alias_maps = hash:/etc/postfix/virtual

--oyUTqETQ0mS9luUI--
