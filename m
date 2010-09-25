From: Florian Effenberger <floeff@gmail.com>
Date: Sat, 25 Sep 2010 12:31:05 +0000
Subject: [mlmmj] transport maps and virtual domains
Message-Id: <AANLkTinTwTDb9=Ok_vTxO6fatc3zAan1gy3CeTQNCskC@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

at the moment, I use a little workaround to have several virtual list
domains with similar list names in Postfix. It's like that:

mlmmj-make-ml -s /var/spool/mlmmj/site1.org -L announce
mlmmj-make-ml -s /var/spool/mlmmj/site2.org -L announce

Alias: ml-site1-announce:        "|/usr/bin/mlmmj-recieve -L
/var/spool/mlmmj/site1/announce/"
Alias: ml-site2-announce:        "|/usr/bin/mlmmj-recieve -L
/var/spool/mlmmj/site2/announce/"

Virtual Alias Domain: announe@site1 ml-site1-announce
Virtual Alias Domain: announe@site2 ml-site2-announce

It works like a charm. Now I wanted to switch over to Postfix
transport maps as described in http://mlmmj.org/docs/readme-postfix/,
however, I can't find a way to achieve something similar as what I do,
having same list names on multiple domains.

Is there an easy solution?

Thanks,
Florian

