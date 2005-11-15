From: Neale Pickett <neale@woozle.org>
Date: Tue, 15 Nov 2005 15:27:33 +0000
Subject: Postfix recipient_delimiter (was: recipient delimiter bug with RC1)
Message-Id: <200511150827.33824.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Monday 14 November 2005 04:58 pm, Jeremy Hinegardner wrote:

> [ lots of good stuff removed ]

I guess that since Jeremy wrote up what he's doing, I should respond in kind.  
I'm using an m4 macro (which is really just a shell script) to create an 
aliases file based on the directories in /var/spool/mlmmj.  So for me to 
solve the Postfix recipient_delimiter problem, I just made a symlink to my 
pajarito-riders directory called "pajarito".  Problem solved, although I'm 
not super pleased about the solution.

/etc/postfix/main.cf gets this:
  alias_maps = hash:/etc/postfix/mlmmj


/etc/postfix/mlmmj.m4:
---8<---
#
# mlmmj mail list alias doohickies
#
#
# Unless you are editing a file ending with .m4, your changes will be lost.
#
esyscmd(`
for i in /var/spool/mlmmj/*/; do
  ml=$(basename $i)
  echo "$ml     \"|/usr/local/bin/mlmmj-recieve -L $i\""
done
')
---8<---


/etc/postfix/Makefile:
---8<---
all: mlmmj.db # plus many more files I create with m4

%.db: %
	postmap hash:$<

%: %.m4
	m4 $< > $@
---8<---


When I create a new list, I only need to run "make -C /etc/postfix" from my 
custom "newlist" script (which uses a template directory to create new lists, 
I can write about this too if people like).

Neale
