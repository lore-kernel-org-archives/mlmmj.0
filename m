From: Jakob Hirsch <jh@plonk.de>
Date: Thu, 13 Dec 2007 13:09:05 +0000
Subject: Re: MIME encodings when dealing with adding the footer
Message-Id: <47612EF1.30904@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <1197540455.6128.23.camel@camobap>
In-Reply-To: <1197540455.6128.23.camel@camobap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

> There is a problem in the current version of mlmmj in handling footer

This is a known issue, see this thread following
http://mlmmj.mmj.dk/archives/mlmmj/2005-07/0357.html

A while ago, I wrote a patch to fix this, but unfortunately it was
rejected and there was obviously no interest to discuss this (or even
write a warning that the footer feature is broken):
http://mlmmj.mmj.dk/archives/mlmmj/2006-09/0794.html

So, the official solution seems to be: Use some external wrapper
program. How, which? Your problem.


