From: Error <error@oddprotocol.org>
Date: Sun, 09 Jan 2022 19:17:05 +0000
Subject: [mlmmj] mlmmj-webarchiver
Message-Id: <op.1fqs6rldt008dh@desktop-kk4k46f>
List-Id: <mlmmj.mlmmj.org>
References: <200909301239.04347.mail@cynapses.org>
In-Reply-To: <200909301239.04347.mail@cynapses.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

hi

i was wondering if anyone could give me a bit guide line to install the  
web archive. i have tried

i have copied mlmmj-webarchiver dir to /etc/  and mlmmj-webarchiver.sh to  
/usr/local/bin/  and edited the conf file to this
https://paste.ircnow.org/0dizgxm7kle3cdenkhi3/.

i have tried to run the .sh file manually not with a corntab just to check  
but haven't got any luck yet.

the following sections im getting confused with
should i leave skel dir to /etc/mlmmj-webarchiver or move it some  
somewhere else?
# skeleton directory copied into new archive main dir
# type: path
SKEL="/etc/mlmmj-webarchiver/skel"

im totally now sure what to do with this two files
# php files copied into new lists dir
# type: file
NEW_LIST_INDEX="/etc/mlmmj-webarchiver/index.php.newlist"
NEW_LIST_SEARCH="/etc/mlmmj-webarchiver/search.php.newlist"


couldnt find enough installation guide line online.

also i have found another one as follow

https://github.com/eellak/mlmmj-archivist

it has a bit clear instruction but it show up the index page but no list.

thanks

