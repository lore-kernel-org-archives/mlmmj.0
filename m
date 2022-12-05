From: Baptiste Daroussin <bapt@nours.eu>
Date: Mon, 05 Dec 2022 13:08:13 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <20221205130813.egis6izeoyd2kmnp@aniel.nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Dec 05, 2022 at 01:32:50PM +0100, Baptiste Daroussin wrote:
> On Mon, Dec 05, 2022 at 10:32:03AM +0100, Baptiste Daroussin wrote:
> > On Sat, Dec 03, 2022 at 04:24:42PM +0100, A. Schulze wrote:
> > > 
> > > 
> > > Am 03.12.22 um 09:48 schrieb Franky Van Liedekerke:
> > > > > ok, now "make check" fail:
> > > > You need to install atf-sh (the devel-package of it, on fedora it is libatf-sh-devel)
> > > 
> > > Hello,
> > > 
> > > adding 'atf-sh' make sense, but do not change anything, at least on Debian (Bullseye|Bookworm).
> > > Here is how to reproduce with docker:
> > > 
> > > $ install -d /tmp/mlmmj/
> > > $ cat <<EOF > /tmp/mlmmj/Dockerfile
> > > FROM debian:bullseye-slim
> > > 
> > > RUN  apt-get -qq update && apt-get -qq --no-install-recommends install \
> > >        atf-sh \
> > >        autoconf \
> > >        automake \
> > >        build-essential \
> > >        ca-certificates \
> > >        git \
> > >        kyua \
> > >        libatf-dev \
> > >        pkg-config \
> > > 
> > > WORKDIR /tmp/
> > > RUN git clone https://codeberg.org/mlmmj/mlmmj
> > > WORKDIR /tmp/mlmmj/
> > > RUN git clone https://codeberg.org/mlmmj/listtexts
> > > 
> > > RUN sed -i -e '/^AC_CHECK_INCLUDES_DEFAULT/d' configure.ac
> > > RUN autoreconf -i
> > > RUN ./configure
> > > RUN make
> > > 
> > > # this fail ...
> > > RUN make check
> > > EOF
> > > 
> > > $ docker build -t mlmmj:1.4.0.a1 /tmp/mlmmj/
> > > 
> > 
> > The issue is because it runs the test suite as root, I will make sure the
> > testsuite can be run safely as root.
> > 
> > Best regards,
> > Bapt
> > 
> > 
> 
> Your dockerfile should now pass the entire testsuite but one test which seems
> to be related to how docker deals with network for this part I will let someone
> who is more knowledgeable that I am in docker.
> 
> I tested in a VM, the testsuite passes just fine under debian bullseye now.
> 
> Best regards,
> Bapt
> 

Actually there was a bug in the test itself which I now have fixed, this
dockerfile now works ootb.

Best regards,
Bapt

