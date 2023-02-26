From: "A. Schulze" <sca@andreasschulze.de>
Date: Sun, 26 Feb 2023 19:12:18 +0000
Subject: [mlmmj] make check fail for 1.4.0.a2
Message-Id: <3a21b675-1ae7-71e8-1338-ccc2666e9f5d@andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hello,

while building master ¹) aswell as 1.4.0.a2 ²),
"make check" fail with the same error:

...
mlmmj-bounce:basics_5  ->  passed  [0.047s]
mlmmj-bounce:basics_6  ->  failed: atf-check failed; see the output of the test for details  [0.069s]
mlmmj-bounce:basics_7  ->  passed  [0.080s]
...
128/129 passed (1 failed)
...

Is this a known problem?

Andreas



¹) https://codeberg.org/mlmmj/mlmmj/commits/branch/master
²) https://codeberg.org/mlmmj/mlmmj/commits/tag/RELEASE_1_4_0a2

