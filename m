From: Mads Martin Joergensen <mmj@suse.de>
Date: Tue, 05 Apr 2005 14:02:38 +0000
Subject: Re: can i run mlmmj commands how nobody user??
Message-Id: <20050405140238.GC3666@suse.de>
List-Id: <mlmmj.mlmmj.org>
References: <1112698748.11330.5.camel@zion>
In-Reply-To: <1112698748.11330.5.camel@zion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* lupin3rd <lupin3rd@gmx.it> [Apr 05. 2005 13:00]:
> i have a problem...
> i working to add mlmmj support to the GPL panel DTC (www.gplhost.com)...
> 
> the first little problem is that i can't create ml with a single command
> (mlmmj-make-ml) but i solve this running:
> (echo $var1; echo $var2; echo N;) | /usr/bin/mlmmj-make-ml -L $var3 -s
> $var4
> 
> Now i have a big problem... all the php scripts running how nobody user
> (from php script a can stop start apache, posfix, etc)... but if i run
> mlmmj-make-ml it don't create fine the mailing lists.
> It only works if i run from shell how root user.
> This is a big problem... if mlmmj want have a php panel for create ml.
> 
> Anyone can help me?

What if you let the toplevel directory the mailing lists are to be
created in be owned by nobody?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
