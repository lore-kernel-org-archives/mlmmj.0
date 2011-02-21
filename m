From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 21 Feb 2011 12:14:06 +0000
Subject: [mlmmj] Drafts of new listtexts
Message-Id: <4D62570E.9050007@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

OK! I finally did it! I've drafted new English listtexts!

I've used the features of conditionals and wrapping to cut down
duplication and allow more specifics to be included. I've tried to
strike a good balance between reducing duplication and having simple
conditionals, as these two goals conflict. I've also included text for a
feature or two that are due to be implemented soon. Some, though perhaps
not all, of these features will be in 1.2.18, but in order not to
require too many localisation efforts too soon, I am drafting all the
text now.

The thing most worthy of note is that I have changed some terminology:
Moderation of subscriptions is now known as gatekeeping, and the people
who perform it as gatekeepers--their job is either to permit or obstruct
a person's entry to the list. I also now refer to a moderator's job as
either releasing or rejecting a held post.

My work can be viewed here:
http://mlmmj.org/hg/listtexts/file/master/en

I'm interested in comments from developers, sysadmins, translators and
users. Do these texts adequately reflect the features of Mlmmj? Are the
features they describe or imply sensible? Do they read well? Are they
easy enough to translate? Are they easy enough to customise and
maintain?

Some more minor comments:

- I intend to move the first paragraph of each listtext (which is the
   same) into a separate 'include file' shortly.

- I have drafted a few other minor changes of keywords and so on. This
   is not final yet, and won't affect localisation.

- I've also changed the listtext naming scheme to be more consistent and
   flexible. I will document this more fully later, but in brief,
   listtexts are now named with a scheme of purpose-action-reason-type;
   parts may be dropped off the end and instead the listtext may deal
   with the multiple possibilities for that part using conditionals.

- Everything here will be implemented in a backward-compatible way, so
   old listtexts will continue to work (though not with the new
   features). However, I'm shamelessly paving the way for some
   incompatibilities which will come in a version 1.3.0 before too long
   (though probably with an upgrade script), and 2.0.0 further down the
   track.

Ben.




