From: Togan Muftuoglu <toganm@dinamizm.com>
Date: Thu, 10 Mar 2005 11:23:11 +0000
Subject: Configuring Postfix as a mailgateway for mlmmj
Message-Id: <20050310112311.GF210@dinamizm.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

I have installed mlmmj-1.2.4-3 on a SUSE 8.2 machine which is acting as
a mailgateway.

I have created the list via the command

mlmmj-make-ml.sh -L 5element -a

and run the newaliases command.

Since this machine is running as a mailserver gateway doing antivirus,
RBL, header checks along with the user check via relay_recipients maps
and then relaying the accepted mail to the inside mailserver, I am not
sure if the /etc/aliases file is the one I need. I have thought of the
relay_recipients_maps yet that would deliver the mail to the inside
mailserver which is not what I want.

Where would be the correct place to have "listname" added as alias or
virtual or whatever

Thanks
-- 

Togan Muftuoglu

I am the seasoned traveler of the Labyrinth.
I overturn barriers and boundaries, opening new paths and portals for
innovation. (Chinese Proverb)

