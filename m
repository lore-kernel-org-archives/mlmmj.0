From: lupin3rd <lupin3rd@gmx.it>
Date: Tue, 05 Apr 2005 10:59:07 +0000
Subject: can i run mlmmj commands how nobody user??
Message-Id: <1112698748.11330.5.camel@zion>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

i have a problem...
i working to add mlmmj support to the GPL panel DTC (www.gplhost.com)...

the first little problem is that i can't create ml with a single command
(mlmmj-make-ml) but i solve this running:
(echo $var1; echo $var2; echo N;) | /usr/bin/mlmmj-make-ml -L $var3 -s
$var4

Now i have a big problem... all the php scripts running how nobody user
(from php script a can stop start apache, posfix, etc)... but if i run
mlmmj-make-ml it don't create fine the mailing lists.
It only works if i run from shell how root user.
This is a big problem... if mlmmj want have a php panel for create ml.

Anyone can help me?

Thanks

