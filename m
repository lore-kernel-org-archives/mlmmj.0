From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 24 Aug 2010 12:35:14 +0000
Subject: [mlmmj] mlmmj 1.2.17.1 released
Message-Id: <4C73BC82.2020906@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, everybody!

As we have had a few important patches recently, I have released
mlmmj 1.2.17.1.

This release contains security-related bugfixes, other minor
bugfixes, and updates to listtexts and documentation.

Most importantly, everyone using the web admin interfaces is
advised to update.

It includes these changes:

- Check return status in mlmmj-perl-admin when adding subscribers
   (Florian Streibelt, Bitmand)
- Better validation of input in php-admin (Thomas Goirand)
- Added Turkish translation (Samed Beyribey)
- Fixed security bug in mlmmj-php-admin (Florian Streibelt,
   Morten Shearman Kirkegaard)
- Added README.postfix to distribution tarball
- Added contrib/amime-receive (Gerd v. Egidy)
- Fixed memory leak in substitute_one() (Ben Schmidt)
- Updated German listtexts (Christoph Wilke)
- Updated TUNABLES file (Ben Schmidt)

This is an interim release which won't be represented by any
revision in version control. Rather, it is 1.2.17 with a
collection of recent patches that were felt important or
unobtrusive enough to release quickly, rather than waiting for a
full test-and-release cycle.

It is, of course, available on the downloads page.
http://mlmmj.org/downloads/

We will do a full test-and-release cycle for mlmmj 1.2.18
shortly.

In the meantime, enjoy 1.2.17.1, and, of course, let me know of
any problems you encounter.

Smiles,

Ben.





