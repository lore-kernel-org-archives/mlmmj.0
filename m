From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 22 Sep 2004 08:52:04 +0000
Subject: Re: hypermail 2.1.8
Message-Id: <20040922085203.GG4285@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <00d801c4a07f$9b0519b0$0a00a8c0@FABERKOUT>
In-Reply-To: <00d801c4a07f$9b0519b0$0a00a8c0@FABERKOUT>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Fabrizio Gatti <f.gatti@dms.it> [Sep 22. 2004 10:44]:
> Hi,
> I've just installed mlmmj, and it's great!!!

Glad you like it.

> Now, I'm trying to setup hypermail 2.1.8 but it seems to read only mbox
> files.
> How is possible to let it work with the separeted files created by mlmmj?

Yeah, there's some options to use with hypermail.

-i            : Read messages from standard input
-u            : Update archive by one article
-d dir        : The directory to save HTML files in

So you can do something like:

for singlemail in /path/to/listdir/archive* ;
        hypermail -i -u -d /www/outputdir < $singlemail
done

Personally I save the index file from the listdir in a lastindex file
everytime I update the archive. This way I only have to do it if there's
new mails, and I only add the new ones. Something like this:

LASTINDEX=`cat lastindex`
NEWINDEX=`cat /path/to/listdir/index`

for IT in `seq $LASTINDEX $NEWINDEX`
        hypermail -i -u -d /www/outputdir < /path/to/listdir/archive/$IT
done

echo $NEWINDEX > lastindex

It's not complete but you might get the idea.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
