From: Gavin Henry <ghenry@suretec.co.uk>
Date: Tue, 07 Oct 2014 07:25:42 +0000
Subject: Re: [mlmmj] Broken email
Message-Id: <CAPcb_G+0n=p8qQ3+3y5aOQyo-C7gtax1iU3Eqp9DVyPWvwdqmA@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
In-Reply-To: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Here's the raw email:

http://paste.scsys.co.uk/428484

We're testing with prefix, footer and customerheaders (have now
removed any trailing newlines and will test again):

cat prefix
[NOC Alerts]

cat customheaders
X-Mailinglist: noc-alerts
precedence: bulk
precedence: list
List-Id: <noc-alerts>
List-Unsubscribe: <mailto:noc-alerts+unsubscribe@lists.suretec.net>,
<http://lists.suretec.net/?list=noc-alerts>
List-Owner: Suretec Systems Ltd.


cat footer
-- 
To unsubscribe send a mail to noc-alerts+unsubscribe@lists.suretec.net

