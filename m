From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 21 Jun 2004 11:42:30 +0000
Subject: mlmmj-0.8.0 is out
Message-Id: <20040621114230.GA91104@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello people,

Since a very nice feature have been added to mlmmj I've released version
0.8.0 just now. The ChangeLog has it all:

0.8.0
 o Added regular expression based access control.
 o Added wrappers for malloc(), realloc(), free() and strdup(), so we
   can bail out if any of them fail.

For those wondering about what regular expression based access control
is, I'll end this mail with README.access:

README.access                           present in mlmmj versions >= 0.8.0

Access control in mlmmj
===========
If the file listdir/control/access is present, access control is enabled.

NOTE: the default action is to deny access (reject the mail), so an empty
access control file will cause mlmmj to reject all posts, whereas a non-
existant file will change nothing, and mlmmj will behave as usual.

Each header in the mail is tested against each rule, rule by rule. That is,
all headers are first tested against the first rule, then all headers are
tested against the second rule, and so on.

The first rule to match a header decides which action to take - allow or
deny the post.

The syntax is quite simple: action[ [!]regexp]
- "Action" can be "allow" or "deny".
- The optional "!" makes the rule a match, if NO header matches the regular
  expression.
- "Regexp" is a POSIX.2 extended regular expression. Matching is done case
  insensitive.


First a simple example. This rule set will reject any mail that is NOT plain
text, or has a subject that contains "BayStar", and allow anything else:

deny !^Content-Type: text/plain
deny ^Subject:.*BayStar
allow


Now on to a more advanced example. Morten can post anything, Mads Martin can
post if the subject does not contain "SCO". Everything else is denied:

allow ^From: Morten
deny ^Subject:.*SCO
allow ^From: Mads Martin
deny

The last rule (deny) can be left out, as deny is the default action.


A third example. Deny any mails with "discount", "weightloss", or "bonus" in
the subject. Allow PGP signed and plain text mails. Anything else is denied:

deny ^Subject:.*discount
deny ^Subject:.*weightloss
deny ^Subject:.*bonus
allow ^Content-Type: multipart/signed
allow ^Content-Type: text/plain

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
