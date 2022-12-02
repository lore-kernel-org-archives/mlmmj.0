From: "A. Schulze" <sca@andreasschulze.de>
Date: Fri, 02 Dec 2022 18:28:41 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <ec4c3c1e-87fa-b4be-61a6-731a6c018fff@andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Am 02.12.22 um 17:59 schrieb A. Schulze:
> I'll build, test and report ...

don't work on Debian Bullseye (x86_64):

1. `./autoreconf -i` failed:

     configure.ac:21: error: possibly undefined macro: AC_CHECK_INCLUDES_DEFAULT
           If this token and others are legitimate, please use m4_pattern_allow.
           See the Autoconf documentation.

I solved this by removing AC_CHECK_INCLUDES_DEFAULT (https://codeberg.org/mlmmj/mlmmj/src/commit/15152c0f3087e6fbfeac616d44915a6edd033c9d/configure.ac#L21)

2. now, `./configure` fail with

     configure: error: Package requirements (atf-c) were not met:
     No package 'atf-c' found

I installed https://packages.debian.org/bullseye/atf-sh but that did not help

Andreas

