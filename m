From: "Oliver Gading" <og-ml@gading.de>
Date: Thu, 20 Dec 2007 21:11:37 +0000
Subject: RE: php-admin based on perl-admin
Message-Id: <20071220211123.5191310AC1B6@canopus.gading.de>
List-Id: <mlmmj.mlmmj.org>
References: <019e01c84317$5eac2d30$4801a8c0@w2251702>
In-Reply-To: <019e01c84317$5eac2d30$4801a8c0@w2251702>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi

> I have converted the perl-admin source to php.
> It's based on the version from Franky Van Liederkerke
> which I found in following posting:
> http://mlmmj.mmj.dk/archives/mlmmj/2007-08/1122.html


I forgot to mention that my new php-admin is also based on the latest
version of php-admin (timestamp of May 2005).
I added (almost, see below) all new stuff from the most current perl-admin
(August 2007), plus:
 - "footer" config (was missing in tunables.pl)
 - listing differences after changes to text files
 - changes to subscriptions are shown with green and red colors

"Bulk add subscribers" is not yet implemented.


> Unfortunately I am to busy to write a README.

There is a README in the original mlmmj source in 
  mlmmj-1.2.15/contrib/web/php-admin/README
and one other in the perl-admin archive from August 2007.
Both need to be merged somehow.

Oliver


