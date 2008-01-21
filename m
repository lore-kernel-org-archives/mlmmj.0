From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 21 Jan 2008 10:07:12 +0000
Subject: Re: feature request: archivedir setting - symlinks do not work
Message-Id: <1200910032.6759.7.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <20080121014028.GC23511@curie-int.orbis-terrarum.net>
In-Reply-To: <20080121014028.GC23511@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, 2008-01-21 at 01:51 -0800, Robin H. Johnson wrote:
> Yes it does. The layout was creating with using rsync /var/lists/ to
> the new location, but use the rsync filters to only select
> the /archive/ (and leave out all the other directories under each
> list).

worksforme

$ ./mlmmj-recieve -F -L /home/mopo/mlmmj-test/ </tmp/mail.txt

$ ls /home/mopo/mlmmj-archive/mlmmj-test/archive/
1

$ ls -l /home/mopo/mlmmj-test/archive
lrwxrwxrwx 1 mopo mopo 43 2008-01-21 11:01 /home/mopo/mlmmj-test/archive
-> /home/mopo/mlmmj-archive/mlmmj-test/archive

$ diff -u /tmp/mail.txt /home/mopo/mlmmj-archive/mlmmj-test/archive/1 
--- /tmp/mail.txt       2008-01-21 11:03:48.000000000 +0100
+++ /home/mopo/mlmmj-archive/mlmmj-test/archive/1       2008-01-21
11:03:50.000000000 +0100
@@ -1,4 +1,3 @@
-Return-Path: test@afdelingp.dk
 From: test@afdelingp.dk
 To: test-list@afdelingp.dk
 Subject: test test test


Are you sure the permissions are set correctly? Is there anything in
your maillog?

Morten

