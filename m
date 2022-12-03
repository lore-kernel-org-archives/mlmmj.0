From: "A. Schulze" <sca@andreasschulze.de>
Date: Sat, 03 Dec 2022 15:24:42 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <b0379f4b-2022-b38e-9c43-c07604efefb7@andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Am 03.12.22 um 09:48 schrieb Franky Van Liedekerke:
>> ok, now "make check" fail:
> You need to install atf-sh (the devel-package of it, on fedora it is libatf-sh-devel)

Hello,

adding 'atf-sh' make sense, but do not change anything, at least on Debian (Bullseye|Bookworm).
Here is how to reproduce with docker:

$ install -d /tmp/mlmmj/
$ cat <<EOF > /tmp/mlmmj/Dockerfile
FROM debian:bullseye-slim

RUN  apt-get -qq update && apt-get -qq --no-install-recommends install \
        atf-sh \
        autoconf \
        automake \
        build-essential \
        ca-certificates \
        git \
        kyua \
        libatf-dev \
        pkg-config \

WORKDIR /tmp/
RUN git clone https://codeberg.org/mlmmj/mlmmj
WORKDIR /tmp/mlmmj/
RUN git clone https://codeberg.org/mlmmj/listtexts

RUN sed -i -e '/^AC_CHECK_INCLUDES_DEFAULT/d' configure.ac
RUN autoreconf -i
RUN ./configure
RUN make

# this fail ...
RUN make check
EOF

$ docker build -t mlmmj:1.4.0.a1 /tmp/mlmmj/

Andreas
> Franky
> 
> 
> 

