From: Henne Vogelsang <hvogel@opensuse.org>
Date: Tue, 20 Mar 2007 14:09:35 +0000
Subject: Address Parsing
Message-Id: <20070320140935.GP25058@suse.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

i had a listmember that sent a mail that included brackets in the
address field. Something like that:

To: mmj@mmj.dk
Cc: Heino Vogel <hvogel@hennevogel.de>, opensuse-test@opensuse.org, "Henne (Work)" <hvogel@suse.de>

After some testing we found that the to/cc parsing goes wrong here
(maybe because () are illegal?). The 3. and 4. address never reach mlmmj
and thus it thinks that the listaddress (opensuse-test@opensuse.org) is
not in to or cc.

Henne 

-- 
Henne Vogelsang, Teamlead Core Services
http://www.opensuse.org
