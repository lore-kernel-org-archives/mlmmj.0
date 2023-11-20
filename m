Return-Path: <mlmmj+bounces-3010-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B6CC2BB3F
	for <mlmmj@archiver.kernel.org>; Mon, 20 Nov 2023 20:50:54 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3010-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r5Ax0-00BPsK-6k
	for mlmmj@archiver.kernel.org; Mon, 20 Nov 2023 20:32:58 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1r5Awt-00BPrW-Hp
	for mlmmj@mlmmj.org; Mon, 20 Nov 2023 20:32:51 +0000
Received: from [IPv6:::1] (2a02-8428-078f-2201-f81c-0a66-3558-3c65.rev.sfr.net [IPv6:2a02:8428:78f:2201:f81c:a66:3558:3c65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aniel.nours.eu (Postfix) with ESMTPSA id AAD1A145003;
	Mon, 20 Nov 2023 21:41:16 +0100 (CET)
Date: Mon, 20 Nov 2023 21:41:16 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: =?ISO-8859-1?Q?Rapha=EBl_Jadot?= <rj@hodo.fr>,
 "mlmmj@mlmmj.org" <mlmmj@mlmmj.org>
Subject: Re: [mlmmj] Release 1.4.0 rc2
User-Agent: K-9 Mail for Android
In-Reply-To: <37331700508990@mail.yandex.com>
References: <ttakhkfcehtadqyxzkxflp45abpyo4xoxkfaruqr7p5jb62mw6@2lbe52374cda> <251101700393649@mail.yandex.com> <2FCB34BE-4D27-43BA-84A2-147BA7C1CB28@nours.eu> <37331700508990@mail.yandex.com>
Message-ID: <A2728DD2-CF67-4402-ABDD-D63E95C68549@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 20 novembre 2023 20:39:14 GMT+01:00, "Rapha=C3=ABl Jadot" <rj@hodo=2Efr>=
 a =C3=A9crit=C2=A0:
>Thanks for the insights, I have done quite a work on the package, but I h=
ave a strange behaviour on yunohost test VM (which runs on Debian Bullseye)=
, though it works on my machine, not sure what is wrong
>
>raph@raph:~/mlmmj$ autoreconf -i && =2E/configure && make && sudo make in=
stall=20
>checking for a BSD-compatible install=2E=2E=2E /usr/bin/install -c
>checking whether build environment is sane=2E=2E=2E yes
>checking for a thread-safe mkdir -p=2E=2E=2E /usr/bin/mkdir -p
>checking for gawk=2E=2E=2E gawk
>checking whether make sets $(MAKE)=2E=2E=2E yes
>checking whether make supports nested variables=2E=2E=2E yes
>checking for gcc=2E=2E=2E gcc
>checking whether the C compiler works=2E=2E=2E yes
>checking for C compiler default output file name=2E=2E=2E a=2Eout
>checking for suffix of executables=2E=2E=2E=20
>checking whether we are cross compiling=2E=2E=2E no
>checking for suffix of object files=2E=2E=2E o
>checking whether we are using the GNU C compiler=2E=2E=2E yes
>checking whether gcc accepts -g=2E=2E=2E yes
>checking for gcc option to accept ISO C89=2E=2E=2E none needed
>checking whether gcc understands -c and -o together=2E=2E=2E yes
>checking whether make supports the include directive=2E=2E=2E yes (GNU st=
yle)
>checking dependency style of gcc=2E=2E=2E gcc3
>checking for ranlib=2E=2E=2E ranlib
>checking for socket in -lsocket=2E=2E=2E no
>checking for gethostbyname in -lnsl=2E=2E=2E yes
>checking for iconv_open in -liconv=2E=2E=2E no
>checking how to run the C preprocessor=2E=2E=2E gcc -E
>checking for grep that handles long lines and -e=2E=2E=2E /usr/bin/grep
>checking for egrep=2E=2E=2E /usr/bin/grep -E
>checking for ANSI C header files=2E=2E=2E yes
>checking for sys/types=2Eh=2E=2E=2E yes
>checking for sys/stat=2Eh=2E=2E=2E yes
>checking for stdlib=2Eh=2E=2E=2E yes
>checking for string=2Eh=2E=2E=2E yes
>checking for memory=2Eh=2E=2E=2E yes
>checking for strings=2Eh=2E=2E=2E yes
>checking for inttypes=2Eh=2E=2E=2E yes
>checking for stdint=2Eh=2E=2E=2E yes
>checking for unistd=2Eh=2E=2E=2E yes
>checking arpa/inet=2Eh usability=2E=2E=2E yes
>checking arpa/inet=2Eh presence=2E=2E=2E yes
>checking for arpa/inet=2Eh=2E=2E=2E yes
>checking fcntl=2Eh usability=2E=2E=2E yes
>checking fcntl=2Eh presence=2E=2E=2E yes
>checking for fcntl=2Eh=2E=2E=2E yes
>checking netinet/in=2Eh usability=2E=2E=2E yes
>checking netinet/in=2Eh presence=2E=2E=2E yes
>checking for netinet/in=2Eh=2E=2E=2E yes
>checking stddef=2Eh usability=2E=2E=2E yes
>checking stddef=2Eh presence=2E=2E=2E yes
>checking for stddef=2Eh=2E=2E=2E yes
>checking for stdlib=2Eh=2E=2E=2E (cached) yes
>checking for string=2Eh=2E=2E=2E (cached) yes
>checking sys/socket=2Eh usability=2E=2E=2E yes
>checking sys/socket=2Eh presence=2E=2E=2E yes
>checking for sys/socket=2Eh=2E=2E=2E yes
>checking syslog=2Eh usability=2E=2E=2E yes
>checking syslog=2Eh presence=2E=2E=2E yes
>checking for syslog=2Eh=2E=2E=2E yes
>checking for unistd=2Eh=2E=2E=2E (cached) yes
>checking time=2Eh usability=2E=2E=2E yes
>checking time=2Eh presence=2E=2E=2E yes
>checking for time=2Eh=2E=2E=2E yes
>checking iconv=2Eh usability=2E=2E=2E yes
>checking iconv=2Eh presence=2E=2E=2E yes
>checking for iconv=2Eh=2E=2E=2E yes
>checking for an ANSI C-conforming const=2E=2E=2E yes
>checking for size_t=2E=2E=2E yes
>checking for stdlib=2Eh=2E=2E=2E (cached) yes
>checking for GNU libc compatible malloc=2E=2E=2E yes
>checking for ftruncate=2E=2E=2E yes
>checking for memset=2E=2E=2E yes
>checking for socket=2E=2E=2E yes
>checking for strerror=2E=2E=2E yes
>checking for strncasecmp=2E=2E=2E yes
>checking for snprintf=2E=2E=2E yes
>checking for fcntl=2E=2E=2E yes
>checking for nanosleep=2E=2E=2E yes
>checking for time=2E=2E=2E yes
>checking for strftime=2E=2E=2E yes
>checking for syslog=2E=2E=2E yes
>checking for regcomp=2E=2E=2E yes
>checking for regexec=2E=2E=2E yes
>checking for arc4random_uniform=2E=2E=2E no
>checking for copy_file_range=2E=2E=2E yes
>=2E/configure: line 4802: syntax error near unexpected token `ATF,'
>=2E/configure: line 4802: `PKG_CHECK_MODULES(ATF, atf-c)'
>

You are missing atf-devel package when generatig the configuration file

Bapt


>19=2E11=2E2023, 14:33, "Baptiste Daroussin" <bapt@nours=2Eeu <mailto:bapt=
@nours=2Eeu>>:
>
>Le 19 novembre 2023 12:49:21 GMT+01:00, "Rapha=C3=ABl Jadot" <rj@hodo=2Ef=
r <mailto:rj@hodo=2Efr>> a =C3=A9crit :
>
>Hi there,
>
>I wanted to let you know that I'm working on a new Yunohost package for m=
lmmj=2E I'm doing this because Mailman 3 (which is provide in the list of a=
pplications) seems a bit too heavy for small servers, and I really love mlm=
mj=2E
>
>This is my first time making a package for Yunohost, so it's a bit of a l=
earning process=2E I might need some help or advice as I go along=2E
>
>I'm also thinking about adding a web interface for looking at email archi=
ves=2E Do you have any suggestions for the best existing solution, or shoul=
d I develop something from scratch?
>
>You can check out what I've done so far here: https://github=2Ecom/ashled=
ombos/mlmmj-ynh=2E Right now, I've mostly worked on the manifest=2Etoml and=
 install scripts=2E The other files are still just the basic template=2E
>
>Best regards,
>
>24=2E10=2E2023, 22:53, "Baptiste Daroussin" <bapt@nours=2Eeu <mailto:bapt=
@nours=2Eeu>>:
>
>Hello everyone,
>
>You can now find the RC2 release:
>https://codeberg=2Eorg/mlmmj/mlmmj/releases/tag/RELEASE_1_4_0rc2
>
>It contains 2 important regression fixes spotted by Konstantin (thanks a =
lot!)
>- VERP with postix
>- modifymod tunable
>
>Given a week has passed since last bug report, I think we are safe to
>issue a 1=2E4=2E0 rc2 release!
>
>Please test and report issue!
>Best regards,
>Bapt
>
>Excellent! Please make sure to use latest git there aee important fixes t=
here=2E
>
>I can issue a rc3 if needed or I think it is stable enough for a final re=
lease=2E
>
>For the archives on freebsd, the index https://lists=2Efreebsd=2Eorg <htt=
ps://lists=2Efreebsd=2Eorg/> is using
>https://codeberg=2Eorg/bapt/mlmmj-webview
>
>The archives themselves are generated using https://fossil=2Enours=2Eeu/m=
lmmj-archiver/doc/trunk/README=2Emd
>
>Both are maybe portable, maybe not, but I accept portability patches for =
both=2E
>
>I can move mlmmj-archiver to codeberg to ease contribution if that helps
>
>There are plenty of other options=2E
>
>Bapt
>
>--=20
>
>Rapha=C3=ABl J=2E


