From: Baptiste Daroussin <bapt@nours.eu>
Date: Fri, 13 Oct 2023 16:05:24 +0000
Subject: [mlmmj] Release 1.4.0 rc1
Message-Id: <rxctul3imfit4sazeyjfqdyjcbbmc6lwbjpfzmenqcxteprejn@ovaxslejroq7>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

hello everyone,

I am please to announce the 1.4.0 rc1 release, I really hope that this would
be the final pre release before 1.4.0.

It's been 2 years since I started working on mmmj code base and while there are
still plenty of things to do, it is time to cut a release.

Here is what happen in 2 years:

New features:
- New 'send' tunable to allow email passthrough
- Add support for 'X-Original-From'
- Reduce subscription confirmation address length to fit RFC 5321
- ipv6 support

Internal changes:
- modernize code using:
  * dprintf, posix_spawn, asprintf, getline, daemon, open_memstream...
  * copy_file_range (if available)
  * arc4random (if available)
- greatly reduce memory manipulation, prefering manipulating files and
  directories via file descriptors when possible
- Reduce I/O by passing file descriptors when possible
- Add a test suite
- The contributed php code should now be php 8 friendly

Bug fixes and small changes:
- Logs are not limited anymore to 256 characters per lines
- Fix decode quoted printable subject
- Fix decode quoted printable subject
- Fix crash when no owner is defined
- Validate ranges of all integers conversion

I know there are changes that one would love to see in that release, namely
partionning the archives, better bounce messages and fine grained deny messages
but this will have to wait for mlmmj 1.5.0

I needs a lot of testing, I do plan to switch the entire FreeBSD mailing list to
this rc1 version to battle test it, if you can also test it on your side that
would be helpful, it would be nice if we can get a 1.4.0 release as solid as the
one you have been used to with previous releases.

As usual now please report any bug either to this mailing list or to codeberg

https://codeberg.org/mlmmj/mlmmj

Best regards,
Bapt

PS: I noticed the mlmmj.org website is broken again, maybe it would be nice to
make it redirect to codeberg?

