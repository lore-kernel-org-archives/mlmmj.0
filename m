From: lupin3rd <lupin3rd@gmx.it>
Date: Wed, 30 Mar 2005 17:53:31 +0000
Subject: 2 or more ml with same name
Message-Id: <1112205211.20345.17.camel@zion>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

i test mlmmj and works very fine, i can create some mailing lists in one
domain....

now i want create 2 or more mailing list with same name but in different
domains:

ml@domain1.tld
ml@domain2.tld

is it possible?


i try in this way

in postfix aliases file i have insert:

ml: "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/ml/"
ml1: "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/ml1/"

and in postfix virtual:
ml@domain1.tld: ml
ml@domain2.tld: ml1

But i have problem.... the first mailing list works... if i send an
email to the second mailing list i have this:

Hi, this is the mlmmj program managing the mailinglist

ml1@drupal.it

I'm sorry to inform you that Your mail could not be delivered to the
list.

In order to post to this list, the list address have to be contained
in either the To: or Cc: header.

If you are an admin of an mlmmj driven list, you should know that this
behaviour can be changed by touching the list control file 'tocc'.

Thanks.

