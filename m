From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 21 Jan 2008 11:05:25 +0000
Subject: Re: feature request: archivedir setting - symlinks do not work
Message-Id: <1200913525.6759.18.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <20080121014028.GC23511@curie-int.orbis-terrarum.net>
In-Reply-To: <20080121014028.GC23511@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, 2008-01-21 at 02:38 -0800, Robin H. Johnson wrote:
> On Mon, Jan 21, 2008 at 11:07:12AM +0100, Morten K. Poulsen wrote:
> > $ ./mlmmj-recieve -F -L /home/mopo/mlmmj-test/ </tmp/mail.txt
> ...
> > Are you sure the permissions are set correctly? Is there anything in
> > your maillog?
> Captured it in testing now.
> 
> Jan 21 10:37:02 pigeon /usr/bin/mlmmj-send[31612]: mlmmj-send.c:1252:
> Could not
> rename(/var/lists/gentoo-test//queue/105c88835cb90bff,/var/lists/gentoo-test//archive/241);:
> Invalid cross-device link

Ah yes, a rename() is atomic, but that is not possible across
partitions.

You could move queue/ to the same partition.

Morten

