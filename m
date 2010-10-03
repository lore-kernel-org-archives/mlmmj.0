From: Florian Effenberger <floeff@gmail.com>
Date: Sun, 03 Oct 2010 22:09:30 +0000
Subject: [mlmmj] mlmmj-maintd recursively
Message-Id: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

is there an option to run mlmmj-maintd recursively? My Ubuntu cron
script invokes

/usr/bin/mlmmj-maintd -F -d /var/spool/mlmmj

However, I have my list organized in

/var/spool/mlmmj/site1.org
/var/spool/mlmmj/site2.org

and the like, and it seems that the above command at least doesn't
send out digests. I just invoked it manually with

/usr/bin/mlmmj-maintd -F -d /var/spool/mlmmj/site1.org
/usr/bin/mlmmj-maintd -F -d /var/spool/mlmmjsite2.org

and this seems to work.

Thanks,
Florian

