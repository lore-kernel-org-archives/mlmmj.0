From: "Joaquin ALMAGRO" <jan18@numericable.fr>
Date: Sat, 02 Sep 2006 22:02:33 +0000
Subject: Another user of mlmmj
Message-Id: <CGEOKDHOKECBNBHBENCHIECKCFAA.jan18@numericable.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, all

[mlmmj] henceforth used at the FFH French Hockey Federation, Paris (http://www.ffhockey.org)

System:
Fedora Core 4 + Postfix 2.2 + Amavisd-new + Spamassassin + Razor + DCC + Pyzor + Clamd

Transport model installation.
# master.cf
mlmmj   unix  -   n   n   -   -  pipe
  flags=DORhu user=mlmmj argv=/usr/bin/mlmmj-recieve -F -L /var/spool/mlmmj/$nexthop/

Also forced to do a 
# chown -R amavisd /var/spool/mlmmj

It works fine.

jan

  .^.
  /V\
/(   )\
 ^^-^^
 

