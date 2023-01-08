From: "A. Schulze" <sca@andreasschulze.de>
Date: Sun, 08 Jan 2023 11:13:11 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <85dc7c82-2c2f-fc6b-33ce-f349c6ff4d1c@andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Am 02.12.22 um 15:51 schrieb Baptiste Daroussin:
> https://codeberg.org/mlmmj/mlmmj/releases

Hello Baptiste,

currently, 'make' fail here again:
random-int.c:24:10: fatal error: sys/limits.h: No such file or directory

I found a commit fixing a similar compatibility issue.
https://codeberg.org/mlmmj/mlmmj/commit/a8020aaa4c79d5621745e5322fb45a2b68f8858c

Could you adopt this for all places, where 'limits.h' is included?

Andreas

