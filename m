From: Marco S Hyman <marc@snafu.org>
Date: Wed, 12 Jan 2011 23:53:04 +0000
Subject: [mlmmj] Bounce handling and digest users
Message-Id: <47837AA0-258E-4C10-ADB4-EB3C9B2C37F3@snafu.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

My site was recently placed on a blacklist due to an excessive
number of bounces in a short time.   Eventually I found the cause:
people subscribed to the digest version of one of my mailing lists
were not being pruned.  The sendmail log contains a bunch of
"dsn=5.1.1, stat=User unknown" results for the troublesome users.

I'm running 1.2.16.  Is this a known issue with that version.

/\/\arc


