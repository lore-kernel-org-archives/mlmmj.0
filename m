From: Andrew Kohlsmith <akohlsmith-mlmmj@benshaw.com>
Date: Mon, 18 Oct 2004 02:31:25 +0000
Subject: Re: mail accepted but not retransmitted?
Message-Id: <200410172231.25401.akohlsmith-mlmmj@benshaw.com>
List-Id: <mlmmj.mlmmj.org>
References: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
In-Reply-To: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On October 17, 2004 01:55 pm, Mads Martin Joergensen wrote:
> What are the permissions on the listdirectory?

# ls -ld /var/spool/mlmmj/mlmmj-test
drwxr-xr-x  13 vmail vmail 4096 2004-10-16 12:39 /var/spool/mlmmj/mlmmj-test/

# ls -l /var/spool/mlmmj/mlmmj-test
total 8
drwxr-xr-x  2 vmail vmail   6 2004-10-11 22:17 archive/
drwxr-xr-x  2 vmail vmail   6 2004-10-11 22:17 bounce/
drwxr-xr-x  2 vmail vmail  47 2004-10-16 12:32 control/
drwxr-xr-x  2 vmail vmail   6 2004-10-16 12:34 incoming/
-rw-r--r--  1 vmail vmail   1 2004-10-16 12:34 index
-rw-------  1 vmail root  525 2004-10-16 12:39 mlmmj-maintd.lastrun.log
drwxr-xr-x  2 vmail vmail   6 2004-10-11 22:17 moderation/
drwxr-xr-x  3 vmail vmail  67 2004-10-16 12:35 queue/
drwxr-xr-x  2 vmail vmail  28 2004-10-16 12:35 requeue/
drwxr-xr-x  2 vmail vmail   6 2004-10-11 22:17 subconf/
drwxr-xr-x  2 vmail vmail  14 2004-10-11 22:23 subscribers.d/
drwxr-xr-x  2 vmail vmail   6 2004-10-11 22:17 text/
drwxr-xr-x  2 vmail vmail   6 2004-10-11 22:17 unsubconf/

and to answer your earlier question about the binaries:

 ls -l /usr/local/bin/mlmmj*
-rwxr-xr-x  1 root root 144171 2004-10-12 10:09 /usr/local/bin/mlmmj-bounce*
-rwxr-xr-x  1 root root 132250 2004-10-12 10:09 /usr/local/bin/mlmmj-maintd*
-rwxr-xr-x  1 root root   2939 2004-10-12 
10:09 /usr/local/bin/mlmmj-make-ml.sh*
-rwxr-xr-x  1 root root 277327 2004-10-12 10:09 /usr/local/bin/mlmmj-process*
-rwxr-xr-x  1 root root 100143 2004-10-12 10:09 /usr/local/bin/mlmmj-recieve*
-rwxr-xr-x  1 root root 217562 2004-10-12 10:09 /usr/local/bin/mlmmj-send*
-rwxr-xr-x  1 root root 164834 2004-10-12 10:09 /usr/local/bin/mlmmj-sub*
-rwxr-xr-x  1 root root 166315 2004-10-12 10:09 /usr/local/bin/mlmmj-unsub*

Everything seems to be as it should be as far as I can tell -- It was a 
standard install.

-A.
