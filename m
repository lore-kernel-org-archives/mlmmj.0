From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 14 Jun 2004 15:19:00 +0000
Subject: mlmmj-0.7.2
Message-Id: <20040614151900.GA29389@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

I've just uploaded mlmmj-0.7.2 tarballs to the website. There's the
following changes which was needed for some users to put it in
production:

0.7.2
 o Make it possible to only let subscribers post
 o Implement feature to deny posts where the listaddress is not in To: or
   Cc:. Enabled pr. default, but can be disabled by touching control/tocc
 o Make mlmmj-sub change uid to the owner of listdir to avoid permission
   problems. Disable with -U to mlmmj-sub.
 o More memory debugging

Don't forget to upgrade the list texts!

As usual, feedback is very welcome.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
