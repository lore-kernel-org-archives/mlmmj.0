From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 12 May 2005 07:46:48 +0000
Subject: 1.2.7 released
Message-Id: <20050512074648.GA99660@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

I know that there's been quite some releases lately, but I rather have
those bugs squashed so we can keep the latest release as stable as 1.2.4
was.

1.2.7
 o Remove old superflous cruft in the smtpreply reader function, making
   mlmmj-send not segfault in rare cases when SIGTERM was sent
 o Another printf had snuck in there printing a free'ed variable

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
