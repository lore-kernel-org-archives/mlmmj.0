From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Fri, 13 Jan 2006 22:01:48 +0000
Subject: preline usage (Re: Is anyone using mlmmj with qmail?)
Message-Id: <Pine.LNX.4.61.0601131658510.16146@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Fri, 13 Jan 2006, Thomas Goirand wrote:

> What is strange, is that when I just type "preline -f /usr/bin/mlmmj-recieve 
> -L /var/spool/mlmmj/xen010503.gplhost.com_test" on the command line, it says 
> "preline: usage: preline cmd [ arg ... ]" so it seems to be wrong.

The man page for "preline" doesn't tell you a few things you need to know 
to run it from the command line like that. As we can see in the source 
code:

...
   if (!(ufline = env_get("UFLINE"))) die_usage();
   if (!(rpline = env_get("RPLINE"))) die_usage();
   if (!(dtline = env_get("DTLINE"))) die_usage();

   while ((opt = getopt(argc,argv,"frdFRD")) != opteof)
     switch(opt) {
       case 'f': flagufline = 0; break;
       case 'r': flagrpline = 0; break;
       case 'd': flagdtline = 0; break;
       case 'F': flagufline = 1; break;
       case 'R': flagrpline = 1; break;
       case 'D': flagdtline = 1; break;
       default: die_usage();
     }
   argc -= optind;
   argv += optind;
   if (!*argv) die_usage();

...

there's a variety of things which can cause "usage" to be displayed. In 
your case, it's the missing environment variables.

See http://www.courier-mta.org/?preline.html for what you need to set 
those variables to if you run from the command line. But qmail will 
already have set those during delivery.
