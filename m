From: "Christian Gleerup" <cromozon@swn.nu>
Date: Mon, 23 Nov 2015 18:20:38 +0000
Subject: [mlmmj] Configuration problems using mlmmj+postfix
Message-Id: <2814c8bd343523366b23a6289b918a5f@swn.nu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hi List,

I have migrated to a new server, and have done a reconfiguration of mlmmj, the old installation was kind of the same, but not following best practice. 
I have configured following the documentation here: http://mlmmj.org/docs/readme-postfix/

But I have some problems getting mlmmj to send mails out, and I don't know where to look, so I hope you can help me.

I have the following clues
In /var/log/mail.err
Nov 23 16:00:01 Lists /usr/local/bin/mlmmj-send[21648]: init_sockfd.c:56: Could not connect to 127.0.0.1: Connection refused

I have set up the transport in postfix as recommended, and the transport files are owned by the root, with read access to multiple users
root@lists:/var/spool/mlmmj# ls -la
total 44
drwxr-xr-x  3 mlmmj mlmmj  4096 Nov  9 21:12 .
drwxr-xr-x  7 root  root   4096 Nov  9 20:22 ..
drwxr-xr-x 13 mlmmj mlmmj  4096 Nov 23 16:00 nyhedsbrev
-rw-r--r--  1 root  root     90 Nov  9 21:11 transport
-rw-r--r--  1 root  root  12288 Nov  9 21:12 transport.db
-rw-r--r--  1 root  root     82 Nov  9 21:09 virtual
-rw-r--r--  1 root  root  12288 Nov  9 21:12 virtual.db

In /var/spool/mlmmj/transport
# for a flat structure
lists.[my-tld]--nyhedsbrev@localhost.mlmmj   mlmmj:nyhedsbrev

In /var/spool/mlmmj/virtual
nyhedsbrev@lists.[my.tld]    lists.[my.tld]--nyhedsbrev@localhost.mlmmj

I am able to subscribe, unsubscribe and wiev the subscribers from the web interface, I do this in the following way
sudo -u mlmmj /usr/local/bin/mlmmj-sub ...
sudo -u mlmmj /usr/local/bin/mlmmj-unsub ...
sudo -u mlmmj /usr/local/bin/mlmmj-list ...
this works fine, ofcourse the relavent stuff is configured for sudoers.

If needed I will post main.cf and master.cf from postfix.

Kind regards
Christian Gleerup





