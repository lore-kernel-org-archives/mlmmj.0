From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sat, 27 May 2017 05:58:26 +0000
Subject: [mlmmj] Mlmmj 1.3.0 released
Message-Id: <cd35d0dd-68e1-70e9-1cd7-0a9aa004db95@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mlmmj 1.3.0 has been released. All feedback on 1.3.0a1 was positive, and
this release contains very few additional changes, and none that are
risky.

Please visit the downloads page (http://mlmmj.org/downloads/) to get it.

The changes include:

- A new smtphelo tunable for adjusting the hostname as given to SMTP
   HELO/EHLO

- A new modonlypost tunable for lists with posts from moderators only

- Bug fixes related to SMTP compliance and non-Mlmmj addresses
   containing the list delimiter

- Czech translation

It should be compatible with 1.2.18. It is called 1.3.0 as I am
attempting to migrate to a semver versioning scheme, and this release
contains new features. Future 1.3.x releases will contain bug fixes and
list text updates; future 1.x.x releases will have new features, but
should still be compatible with 1.3.0, and any incompatible changes will
go into 2.x.x.

Happy hacking!

Ben




