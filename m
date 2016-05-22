From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 22 May 2016 23:44:15 +0000
Subject: [mlmmj] I need help testing Mlmmj 1.3.0a1
Message-Id: <dfe775df-17bd-d642-459e-52ed8c610c68@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mlmmj 1.3.0a1 has been released. Although I believe it to be fairly stable, I've 
labelled it alpha as it contains a number of changes that have not yet been tested 
in production, and if there's a bug in them, it could cause significant failure. 
I've given it a quick test on Debian using both Exim and Postfix, but I'm really 
going to need the help of the community to test it further.

Please visit the downloads page (http://mlmmj.org/downloads/) to get it, try it 
out, and report back successes on the mailing list, or problems on the bug tracker 
(http://mlmmj.org/bugs/), which I will try to address promptly.

The changes include:

- A new smtphelo tunable for adjusting the hostname as given to SMTP HELO/EHLO

- A new modonlypost tunable for lists with posts from moderators only

- Bug fixes related to SMTP compliance and non-Mlmmj addresses containing the list 
delimiter

It should be compatible with 1.2.18. It is called 1.3.0 as I am attempting to 
migrate to a semver versioning scheme, and this release contains new features. 
Future 1.3.x releases will contain bug fixes and list text updates; future 1.x.x 
releases will have new features, but should still be compatible with 1.3.0, and 
any incompatible changes will go into 2.x.x.

Happy hacking!

Ben



