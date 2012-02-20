From: MERIGHI Marcus <mcmer-mlmmj@tor.at>
Date: Mon, 20 Feb 2012 18:28:11 +0000
Subject: Re: [mlmmj] ezmlm to mlmmj migration - messages
Message-Id: <20120220182811.GE28919@tor.at>
List-Id: <mlmmj.mlmmj.org>
References: <20120218124538.GF3704@tor.at>
In-Reply-To: <20120218124538.GF3704@tor.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello Ben, all, 

mail_ben_schmidt@yahoo.com.au (Ben Schmidt), 2012.02.18 (Sat) 21:25 (CET):
> >2) Is the message storage just the plain message in mlmmj as it appears
> >    to be in ezmlm?
> Yep. <listdir>/archive/1, <listdir>/archive/2, etc..

I had another look at ezmlm and it seems it stores the archives as:
<listdir>/archive/1/00-99
<listdir>/archive/2/00-99
<listdir>/archive/N/00-99

So, there's a directory in between.

Apart from that it maintains 
authors: <listdir>/archive/authors/aa-zz/<strange_filename>
subjects: <listdir>/archive/subjects/aa-zz/<strange_filename>
threads: <listdir>/archive/threads/YYYYMM

But you are right about mlmmj; a test mailing list reveals the behaviour
you describe. 

> >3) Is there a way to re-index messages just copied from ezmlm-archive to
> >    mlmmj? (depends on the answers to 2)
> 
> Not a provided way, AFAIK. It shouldn't be hard to make even a bash
> shell script do it, though (list files ordered by date and iterate them,
> incrementing a counter while renaming each file).
> The index of the next incoming message is determined by <listdir>/index,
> which stores the last-used index I believe. Be sure to update that when
> you add messages to the archive.

I have no idea whether that one is bash compatible, but it's ksh for
sure:

#!/bin/sh -e
local _ezmlm_dir="${1}"
local _mlmmj_dir="${2}"
_opwd=$(pwd)
cd "${_ezmlm_dir}"
cd archive
_mlmmj_idx=0
_ezmlm_dirs=$(find . -type d -mindepth 1 -maxdepth 1 -name "[0-9]*" | \
  cut -d "/" -f 2 | sort -n)
for _ezmlm_dir in ${_ezmlm_dirs}; do
	_ezmlm_files=$(find "${_ezmlm_dir}" -type f -mindepth 1 -maxdepth 1 \
	  -name "[0-9]*" | cut -d "/" -f 2 | sort -n)
	for _ezmlm_file in ${_ezmlm_files}; do
		_src="${_ezmlm_dir}/${_ezmlm_file}"
		_tgt="${_opwd}/${_mlmmj_dir}/archive/${_mlmmj_idx}"
		sed s/"run by ezmlm"/"run by mlmmj"/ "${_src}" > "${_tgt}"
		print -n "${_mlmmj_idx}" > "${_opwd}"/"${_mlmmj_dir}"/index
		_mlmmj_idx=$((_mlmmj_idx + 1))
	done
done
cd "${_opwd}"
 
that works as far as I can see. There's some more work on my side until
I can report final success (i.e. working migrated mailing list).

> >4) Worst case scenario: request messages from ezmlm with the address
> >    (MAIL FROM:) of the mlmmj mailing list. Does that sound feasible?
> You would probably also need to turn off Mlmmj's checking of the To/CC
> header (add a tocc tunable). Then it probably works.

thanks for the hint, but since the above (3) appears to work there is no
need to go that route. 

bye and thanks, Marcus

