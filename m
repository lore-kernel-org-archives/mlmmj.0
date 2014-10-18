From: =?utf-8?Q?Mads_Martin_J=C3=B8rgensen?= <mmj@mmj.dk>
Date: Sat, 18 Oct 2014 08:13:10 +0000
Subject: Re: [mlmmj] bulk-adding emails to a mlmmj email list
Message-Id: <etPan.54422116.41b71efb.1a7@cato.local>
List-Id: <mlmmj.mlmmj.org>
References: <5441875E.3050403@vlsc.org>
In-Reply-To: <5441875E.3050403@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


On 17 Oct 2014 at 23:20:42, webmaster@vlsc.org (webmaster@vlsc.org(mailto:webmaster@vlsc.org)) wrote:

[snip]
 
> [ I noticed after adding several addresses to a list, that they seem to appear in the /var/spool/mlmmj/listname/subscribers.d/ directory, each address ending up in a single-character-name file, based on the 1st letter in the address - ie. paul@me.com(mailto:paul@me.com), peter@msn.com(mailto:peter@msn.com), etc. all ended up in a file called "p". Is it possible to use scripts to simply stuff addresses into these files, based on the 1st character in the address? What would be the implication of doing this independently of the existing mlmmj-sub script? ]

You can just put it in files in the subscribers.d/ directory, yes. You shouldn’t need the same sorting as mlmmj does. Any file will be read as a subscriber file. If you do want mlmmj-sub to do it, just put all addresses in a file and run through it with a simple bash script 1-liner:

$ for ADDR in `cat file-with-addr.txt`; do /path/to/mlmmj-sub -L dir -l $ADDR

> With the old Majordomo, it was relatively easy for me to setup some PHP admin scripts that let me view/add/edit the list of addresses in an email list, and I'm hoping to do the same with mlmmj.

It’s just as easy here.

> P.S. is there a procedure for deleting a mailing list? can one simply delete the .../mlmmj/listdir and all it's contents?

Correct.

--  
Mads Martin Joergensen, mmj@mmj.dk
"Why make things difficult, when it is possible to make them cryptic
and totally illogical, with just a little bit more effort?"
-- A. P. J.




