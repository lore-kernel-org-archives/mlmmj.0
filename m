From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 29 Nov 2004 08:32:37 +0000
Subject: mlmmj-1.1.0 released
Message-Id: <20041129083237.GA15391@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

It's time to get this one out the door, otherwise we'll keep adding bits
and pieces which really doesn't fit in an RC period.

It's VERY important to read UPGRADING when upgrading from 1.0.0 or
below, since the listtexts have completely changed, and there's a couple
of new directories below the listdir.

So enjoy, here's the changes since RC3:

1.1.0
 o If mlmmj-recieve was invoked with a uid not root or not the owner of
   listdir inform about the uid actually invoked with
 o Add German listtexts (Hendrik Norman Vogelsang)
 o Add hooks for installing listtexts into $(pkgdatadir) (Drake Wyrm)
 o Add mlmmj-list manual page
 o Make mlmmj-list be capable of listing owners, moderators too
 o Perl interface updates

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
