From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Tue, 07 Oct 2014 08:11:39 +0000
Subject: Re: [mlmmj] Broken email
Message-Id: <5433A03B.20908@oldelvet.org.uk>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
In-Reply-To: <CAPcb_GLkCEA6jPGqTE-jOmTax79m4=WoOsFyRSPSpg9bgQFxMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

On 07/10/2014 08:25, Gavin Henry wrote:
> Here's the raw email:
>
> http://paste.scsys.co.uk/428484
>
> We're testing with prefix, footer and customerheaders (have now
> removed any trailing newlines and will test again):
>
> cat prefix
> [NOC Alerts]
>
> cat customheaders
> X-Mailinglist: noc-alerts
> precedence: bulk
> precedence: list
> List-Id: <noc-alerts>
> List-Unsubscribe: <mailto:noc-alerts+unsubscribe@lists.suretec.net>,
> <http://lists.suretec.net/?list=noc-alerts>
> List-Owner: Suretec Systems Ltd.
>

I suspect that there is an empty line at the end of the customheaders 
file as Ben suggested earlier. That matches with the blank line in your 
raw email (the Message-Id, From and Date headers were added by 
subsequent mail systems after it left mlmmj).

Regards

Richard

>
> cat footer
>

