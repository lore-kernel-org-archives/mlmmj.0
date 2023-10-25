From: "A. Schulze" <sca@andreasschulze.de>
Date: Wed, 25 Oct 2023 18:50:19 +0000
Subject: [mlmmj] make check fail for 1.4.0rc2
Message-Id: <812a5dcc-09ac-4254-a868-f8939817bd93@andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Am 02.07.23 um 17:25 schrieb A. Schulze:> I spend some time on mlmmj today and now I manage to build and PASS 'make check'!
> Since my last try 1.4.0b2 is available. So I used that version.
> 
> The key point was to *not* run 'make check' as root but as user nobody.

Hello,

while 'make check' succeeded with 1.4.0b2, it now fail again for 1.4.0rc2 here:

tests/mlmmj-receive:subscription_moderation  ->  failed: atf-check failed; see the output of the test for details  [0.455s]

Andreas

