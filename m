From: Per Jessen <per@opensuse.org>
Date: Sun, 14 Jun 2020 14:18:09 +0000
Subject: [mlmmj] access::Deny seems to have stopped working ?
Message-Id: <rc5bj1$gl8$1@saturn.local.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

For years we have had a standard set of access rules, the previous list
manager at openSUSE set them up.  Somehow those rules seems to have
stopped working - example:

deny ^Content-Type:.*image/png

simply does not deny a mail with a png attached.  I was just wondering
if anybody else had observed this? 

We're on mlmmj 1.2.19. 


thanks
Per

-- 
Per Jessen, Zürich (18.2°C)
Member, openSUSE Heroes


