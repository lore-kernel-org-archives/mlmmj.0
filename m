From: Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
Date: Mon, 17 Jan 2005 20:30:28 +0000
Subject: mmm and mmm-subscribe
Message-Id: <41EC2064.3080504@bergenheim.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi!

I made 2 scripts to manage my multiple domain mlmmj lists:
mmm to create lists and mmm-subscribe to add people to lists

they are written in php (command-line php that is), here are the help
outputs. LMK if you are interested in them. if there is ennough interest
I could also make mmm-config to modify a list.

mmm [ OPTIONS ] -l list_name -d domain.tld -o owner@domain.tld
         -l      listname (local part only)
         -d      listdomain
         -o      owner of list
OPTIONS:
         -m moderator,... make list moderated the moderator email addresses
                         This is a comma-separated list.
         -p prefix        Subject prefix
         -j member,...    Automatically join members to the list at
creation time
                         This is a comma-separated list.
         -g member,...   Join digest members to the list at creation
time. This is a comma-separated list.
         -a member,...   Join nomail members to the list at creation
time. This is a comma-separated list.
         -b seconds       How long an address can bounce before it is 
removed
                         Defaults to 432000 seconds, which is 5 days.
         -c      closed list ((un-)subscription is disabled)
         -t      List does not have to be in the To or Cc field
         -s      Subscriber only list
         -n      Notify owners of new subscriptions


mmm-subscribe [ OPTIONS ] -l list_name -d domain.tld -j user@domain.tld,...
         -l              listname (local part only)
         -d              listdomain
         -j member,...   Join members to the list. This is a
comma-separated list.
OPTIONS:
         -g member,...   Join digest members to the list. This is a
comma-separated list.
         -a member,...   Join nomail members to the list. This is a
comma-separated list.

--Wolf

-- 

<:3 )---- Wolf Bergenheim ----( 8:>

