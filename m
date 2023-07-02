From: "A. Schulze" <sca@andreasschulze.de>
Date: Sun, 02 Jul 2023 15:25:33 +0000
Subject: SOLVED: [mlmmj] make check fail for 1.4.0.a2
Message-Id: <d59ddb9d-a113-5225-f26e-c24d42134ff4@andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hello all,

I spend some time on mlmmj today and now I manage to build and PASS 'make check'!
Since my last try 1.4.0b2 is available. So I used that version.

The key point was to *not* run 'make check' as root but as user nobody.

So finally my build issue is solved and I could step further to create a working lab environment to make real live tests.

Thanks
Andreas

Am 04.03.23 um 16:45 schrieb A. Schulze:
> 
> mlmmj-bounce:basics_6  ->  failed: atf-check failed; see the output of the test for details  [0.054s]
> 

