From: "Oliver Gading" <og-ml@gading.de>
Date: Thu, 20 Dec 2007 20:40:57 +0000
Subject: AW: php-admin based on perl-admin
Message-Id: <20071220204050.1311810AC05B@canopus.gading.de>
List-Id: <mlmmj.mlmmj.org>
References: <019e01c84317$5eac2d30$4801a8c0@w2251702>
In-Reply-To: <019e01c84317$5eac2d30$4801a8c0@w2251702>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Christian

Thank you for your hints regarding my permission problem.
 
>> For optimizing security I would need some help:
>> In my server environment I needed to set "SuexecUserGroup nobody nogroup"
>> (on Debian Etch postfix delivers as user nobody). I did not work it 
>> out how to share the mlmmj list directory with a different group. Even 
>> when I setgid the list directory (and the directories below) to the
shared group.
>> Everytime (while subscribing/unsubscribing etc.) mlmmj tries to use 
>> files which it is not the owner of, mlmmj writes a permission problem 
>> to the mail log.

>If the subscribers directories (subscribers.d, digesters.d and
>nomailsubs.d) are group writable mlmmj-sub and mlmmj-unsub will
>change its gid to the group of the relevant directory when subscribing or
unsubscribing.
>
>So no setgid is neccesary. Just chmod g+w and chgrp to the shared group.

Ok. I then added a system "mlmmj" with the members "virt,nobody".
mlmmj delivers with nobody.nogroup
Apache acts with "SuexecUserGroup virt virt"
 1. added one subscriber "gtest@VIRTDOMAIN.TLD" via php-admin.
    -> SUCCESS
 2. added one subscriber "atest@VIRTDOMAIN.TLD" via email.
    -> SUCCESS
 3. added one subscriber "otest1@VIRTDOMAIN.TLD" via php-admin.
    -> SUCCESS
 4. added one subscriber "otest2@VIRTDOMAIN.TLD" via email.
    -> FAILED (Permission denied and new file .o.lock, see below)
 5. listed subscribers via php-admin, but "atest@VIRTDOMAIN.TLD"
    is not shown in list (because of file "a" was being
    set to "nogroup" by mlmmj delivery)



/etc/passwd
nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
virt:x:2054:2054:virt:/var/www/virtual/VIRTDOMAIN.TLD:/bin/false

/etc/group:
nogroup:x:65534:
virt:x:2054:
mlmmj:x:111:virt,nobody

/var/log/mail.log
Dec 20 20:52:28 MYHOST postfix/local[2551]: 549DD10AC1E6:
to=<list-test+subscri
be@MYHOST.MYDOMAIN.TLD>, orig_to=<list-test+subscribe@VIRTDOMAIN.TLD>,
relay=local,
 delay=0.32, delays=0.22/0.05/0/0.05, dsn=2.0.0, status=sent (delivered to
comma
nd: /usr/local/bin/mlmmj-recieve -L
/var/spool/mlmmj/VIRTDOMAIN.TLD/list-test)
Dec 20 20:52:28 MYHOST postfix/qmgr[2239]: 549DD10AC1E6: removed
Dec 20 20:52:28 MYHOST postfix/smtpd[2507]: lost connection after DATA from
unknown[IP]
Dec 20 20:52:28 MYHOST postfix/smtpd[2507]: disconnect from unknown[IP]
Dec 20 20:52:28 MYHOST /usr/local/bin/mlmmj-sub[2553]: mlmmj-sub.c:657:
Could n
ot open '/var/spool/mlmmj/VIRTDOMAIN.TLD/list-test/subscribers.d/o':
Permission denied


# ls -al /var/spool/mlmmj/VIRTDOMAIN.TLD/list-test/subscribers.d
insgesamt 16
drwxrwxr-x  2 nobody mlmmj   4096 2007-12-20 20:47 .
drwxr-xr-x 15 nobody nogroup 4096 2007-12-20 07:08 ..
-rw-rw----  1 nobody nogroup   15 2007-12-20 20:41 a
-rw-rw----  1 virt   mlmmj     14 2007-12-20 20:40 g
-rw-rw----  1 virt   mlmmj     18 2007-12-20 20:46 o
-rw-------  1 nobody nogroup    0 2007-12-20 20:47 .o.lock



Yesterday, with "chmod g+sw subscribers.d" I was successful at least with
the php-admin part.
But mlmmj delivery had got the same permission problem as shown above.
And even more worse with php-admin was a "subscription
moderation"-configured list, because
of other related sub-directories (and may be also because of mlmmj-send is
not setgid-aware).


Oliver

