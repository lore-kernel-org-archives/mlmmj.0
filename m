From: Florian Effenberger <floeff@gmail.com>
Date: Thu, 30 Sep 2010 14:29:18 +0000
Subject: Re: [mlmmj] stripping HTML and attachments
Message-Id: <AANLkTi=+BDmmeTp+XhHnGKkFuig=S3nfLqPez6Npsj4_@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=KdahgYbnTd2oqH-qvondgrr4CG=kdnVrS_77e@mail.gmail.com>
In-Reply-To: <AANLkTi=KdahgYbnTd2oqH-qvondgrr4CG=kdnVrS_77e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

> However, by piping the mail through a filter before it reaches Mlmmj, this
> kind of thing can be done. Have a look at this:
>
> http://mlmmj.org/archive/mlmmj/2010-01/1635.html

thanks a lot! I hacked it a bit to make it work with stripmime.pl -
here is how it looks like:

=
#!/bin/bash
MLMMJRECIEVE=/usr/bin/mlmmj-recieve
ALTERMIME=/var/spool/mlmmj/stripmime.pl

# check executables
if ! [ -x $MLMMJRECIEVE ]; then
    echo "can't find $MLMMJRECIEVE executable, aborting"
    exit 1
fi

if ! [ -x $ALTERMIME ]; then
    echo "can't find $ALTERMIME executable, aborting"
    exit 1
fi

# read parameters
I=1
PARAM_L=0
while [ $I -le $# ] && [ $PARAM_L = 0 ]; do
    if [ "${!I}" = "-L" ]; then
        PARAM_L=1
    fi
    I=$[$I+1]
done

if [ $PARAM_L = 1 ] && [ $I -le $# ]; then
    MLPATH="${!I}"
else
    echo "parameter -L /path/to/listdir missing, aborting"
    exit 1
fi

if ! [ -d "${MLPATH}" ]; then
    echo "${MLPATH} is not existing or no directory, aborting"
    exit 1
fi

CONTROLD="${MLPATH}/control"

if ! [ -d "${CONTROLD}" ]; then
    echo "${CONTROLD} is not existing or no directory, aborting"
    exit 1
fi

# go to a dir where altermime can write it's tmp-files safely
cd $MLPATH

# pipe the calls
$ALTERMIME | $MLMMJRECIEVE "$@"
=

Basically untested, but seems to work ATM.

Florian

