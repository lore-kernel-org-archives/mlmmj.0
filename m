From: Ori Bernstein <ori@eigenstate.org>
Date: Sun, 28 Jun 2015 23:13:07 +0000
Subject: [mlmmj] Archive Script
Message-Id: <20150628161307.c0621e23d727de511625d531@eigenstate.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

I've been happily running mlmmj for my own stuff for the last while, but
wasn't happy with the scripts for generating archives, so I wrote my own.
You can look at it here:

    http://git.eigenstate.org/ori/mkarchive.git/

This is kind of hacky, but, it does the job:

    - Written in Python
    - Generates static pages
    - Works well enough.

To run it, I have this in my crontab;

    $INSTALL_DIR/mkarchive.py -m $MLMMJ_SPOOL -o $WEBDIR -c $MHONARC_CONFIG

The main thing I'd change if I cared enough would be to switch the
index generation away from hardcoded, and move it to a template or
soemthing.

If anyone finds it useful, that would be cool.

-- 
    Ori Bernstein

