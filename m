From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:18 +0000
Subject: [mlmmj] [PATCH 00 of 10] mlmmj-maintd.c tweaks
Message-Id: <patchbomb.1296169158@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

All,

As mentioned the other day here are a number of patches against 
mlmmj-maintd.c that fix relatively minor issues. I haven't attempted 
to make any changes outside of this one file but intend to look at those 
over the coming month or two as time allows.

I have also spotted a couple of other issues that I haven't addressed yet. 
The first is the fact that unlink calls never have their error status 
checked. I was thinking about introducing a myunlink() method that does 
the unlink and reports any error. That would help catch any permissions
problems. There is a potential that some of the files might not exist
in all situations (the -probe files for example) so it might not be
appropriate to log an error in all circumstances.

Also there are a couple of places in mlmmj-maintd.c where it doesn't find 
the contents of the files that it expects. It just carries onto the next 
file without logging an error.

Review comments most welcome.

Regards

Richard

