From: Christian Gleerup <christian.gleerup@swn.nu>
Date: Sun, 26 Sep 2010 18:06:12 +0000
Subject: [mlmmj] Cannot remove mail adress
Message-Id: <1285524372.2905.16.camel@cg-desktop>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi mlmmj's,

I have a server that uses mlmmj, but now I have the problem, that some
email address cannot be deleted.

for instance, I have this problem with my own, but the applikation user
has repported that she had th eproblem several times, so people simply
can't unsubscribe!

see the following,

/$ sudo mlmmj-list -L /var/spool/mlmmj/nyhedsbrev/ | grep cromozon
cromozon@swn.nu
/$ sudo /usr/bin/mlmmj-unsub -L /var/spool/mlmmj/nyhedsbrev/ -a
cromozon@swn.nu -s
Changing to uid 65534, owner of /var/spool/mlmmj/nyhedsbrev/.
/$ sudo mlmmj-list -L /var/spool/mlmmj/nyhedsbrev/ | grep cromozon
cromozon@swn.nu

As you can see, the mail adress is not deleted after the unsub command,
but in most cases, it works, what can be wrong?

/Christian


