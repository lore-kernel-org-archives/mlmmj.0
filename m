From: "B. Cook" <bcook@poklib.org>
Date: Mon, 06 Nov 2006 15:26:29 +0000
Subject: Newbie w/ exim questions..
Message-Id: <454F5425.3060900@poklib.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello all,

I've recently come across mlmmj and found some time to set it up and I'm 
just having a little bit of difficultly getting a few simple tests to 
work.  I'm on FreeBSD for what it's worth.  Running mlmmj from ports 
(mlmmj-1.2.11), and exim 4.63

I'm sure it comes from my own confusion, but here goes:

I read the README.exim4 and just do not understand how to do this:

- We assume that you have a user and group called mlmmj to use with mlmmj
- The exim user needs read access rights to mlmmj's spool directory and its
   subdirectories

I have made my user/group mlmmj and set the home to be /var/spool/mlmmj 
and set the shell to be /nonexistent.
mlmmj:*:1018:1019::0:0:User &:/var/spool/mlmmj:/nonexistent

I have created the alias to be:

mlmmj-test:  "|/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"

and this comes back correctly:
[/usr/local/etc/exim]# 144 > exim -bt mlmmj-test+help@lists.poklib.org
mlmmj-test+help@lists.poklib.org
   router = mlmmj_router, transport = mlmmj_transport

and when I send a message to mlmmj-test+help@lists.poklib.org I get this 
back:

2006-11-06 10:16:43 1Gh6DL-0009Pp-Qo unable to set gid19 or uid18 
(euid&): local delivery to mlmmj-test 
<mlmmj-test+help@lists.poklib.org> transport=mlmmj_transport
2006-11-06 10:16:43 1Gh6DL-0009Pp-Qo failed to read delivery status for 
mlmmj-test+help@lists.poklib.org from delivery subprocess
2006-11-06 10:16:43 1Gh6DL-0009Pp-Qo pipe transport process returned 
non-zero status 0x0100: exit code 1
2006-11-06 10:16:43 1Gh6DL-0009Pp-Qo = mlmmj-test@lists.poklib.org 
<mlmmj-test+help@lists.poklib.org> R=mlmmj_router T=mlmmj_transport 
defer (-1)
2006-11-06 10:16:43 1Gh6DL-0009Pp-Qo Frozen

I understand that mailnull (euid 26) can't write there b/c it supposed 
to be happening as user mlmmj.. but I can't seem to figure out what I 
need to do to make that happen.

When I change the transport to be run by the mailnull:mail uid/gid I get 
back this:

   mlmmj-test+help@lists.poklib.org
     local delivery failed

What am I missing?
