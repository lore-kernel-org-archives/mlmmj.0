From: Mark Alan <varia@e-healthexpert.org>
Date: Sun, 06 Mar 2011 18:19:01 +0000
Subject: [mlmmj] bug in README.postfix
Message-Id: <20110306181901.46363f48@desk.localhost.localdomain>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


The following line in README.postfix references the expression
mlmmj:$1 that can't be found elsewhere in that file:
...
Now we setup the 'mlmmj' transport.  The 'mlmmj' in mlmmj:$1 above indicates a transport listed in the Postfix master.cf file.  We are
...

M.

