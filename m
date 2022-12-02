From: Baptiste Daroussin <bapt@nours.eu>
Date: Fri, 02 Dec 2022 20:05:10 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <39517ACA-A86A-4521-B3DC-43D1FBCE94AC@nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org



Le 2 décembre 2022 19:28:41 GMT+01:00, "A. Schulze" <sca@andreasschulze.de> a écrit :
>
>
>Am 02.12.22 um 17:59 schrieb A. Schulze:
>> I'll build, test and report ...
>
>don't work on Debian Bullseye (x86_64):
>
>1. `./autoreconf -i` failed:
>
>    configure.ac:21: error: possibly undefined macro: AC_CHECK_INCLUDES_DEFAULT
>          If this token and others are legitimate, please use m4_pattern_allow.
>          See the Autoconf documentation.
>
>I solved this by removing AC_CHECK_INCLUDES_DEFAULT (https://codeberg.org/mlmmj/mlmmj/src/commit/15152c0f3087e6fbfeac616d44915a6edd033c9d/configure.ac#L21)

Interesting probably my autotools are too recent,  I ll fix thanks
>
>2. now, `./configure` fail with
>
>    configure: error: Package requirements (atf-c) were not met:
>    No package 'atf-c' found
>
>I installed https://packages.debian.org/bullseye/atf-sh but that did not help
>
>Andreas
>

On debian it needs libatf-dev for the testsuite, I need to make that dep optional.

I tested the build on ubuntu 20.04, archlinux (as of tokay) and alpine 3.17

Best regards,
Bapt

