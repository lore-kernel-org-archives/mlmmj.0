From: Geert Stappers <stappers@stappers.nl>
Date: Fri, 01 Feb 2019 09:29:36 +0000
Subject: Re: [mlmmj] Mlmmj webarchiver, patch, working confirmed
Message-Id: <20190201092936.etok6fnk36haakx2@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Thu, Nov 15, 2018 at 06:14:44PM -0500, Fabian Aldo Santiago wrote:
> On 2018-11-15 13:47, Fabian Aldo Santiago wrote:
> > On 2018-11-15 13:35, A. Schulze wrote:
> > > Am 15.11.18 um 16:28 schrieb fsantiago@gardenlan.com:
> > > > https://git.cryptomilk.org/projects/mlmmj-webarchiver.git/
> > > > And I???ve gotten it mostly working fine except the search link
> > > > when clicked presents a blank page.=A0
> > > > I nginx with php-fpm to serve the site. The nginx error log
> > > > complains about an unexpected ???&??? somewhere around line 34
> > > > of the search.php file.
> > >=20
> > > I've created a package for my installations. And - surprise - I wrote
> > > a patch years ago that looks similar to your problem.
> > >=20
> > > --- mlmmj-webarchiver.orig/mlmmj-webarchiver/search.php.newlist
> > > +++ mlmmj-webarchiver/mlmmj-webarchiver/search.php.newlist
> > > @@ -31,13 +31,13 @@
> > >                 $html=3Darray();
> > >                 $count=3D0;
> > >                 $maxresults=3D##MAX_RESULTS##;
> > > -               exec("find -type f -name '0*.html' | xargs egrep -roi
> > > '$words' | perl -pe 's/:.*//' | sort | uniq",&$output);
> > > +               exec("find -type f -name '0*.html' | xargs egrep -roi
> > > '$words' | perl -pe 's/:.*//' | sort | uniq",$output);
> > >                 while(isset($output[$count]) && $count<$maxresults)
> > >                 {
> > >                         $file=3D$output[$count++];
> > >                         $content=3Dfile_get_contents($file);
> > >                         $matches=3Darray();
> > > -                       if (preg_match('/<em>Subject<\/em>:
> > > ([^<]*)<\/li>[\S\s]+From<\/em>: ([^<]*)<\/li>[\S\s]+Date<\/em>:
> > > ([^<]*)<\/li>/',$content,&$matches))
> > > +                       if (preg_match('/<em>Subject<\/em>:
> > > ([^<]*)<\/li>[\S\s]+From<\/em>: ([^<]*)<\/li>[\S\s]+Date<\/em>:
> > > ([^<]*)<\/li>/',$content,$matches))
> > >                         {
> > >                                 $html[]=3D"<li><a
> > > href=3D'$file'>$matches[1]</a>, $matches[2], $matches[3]</li>";
> > >                         }
> > >=20
> > > > Has anyone seen this?
> > > obviously, because I wrote and forgot that patch :-)
> > >=20
> >=20
> > that's awesome! Thank you very much. I'll give this a whirl.
>=20
> worked fine. thank you.
>=20

Who is in contact with upstream of mlmmj-webarchiver?


Groeten
Geert Stappers
--=20
Leven en laten leven

