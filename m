From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Sat, 10 Apr 2010 19:34:30 +0000
Subject: Re: [mlmmj] Resent-From + subonlypost
Message-Id: <1270928070.12545.8.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <D3B4DC71-9D58-4DC3-86F9-C08C14A106BC@sabahattin-gucukoglu.com>
In-Reply-To: <D3B4DC71-9D58-4DC3-86F9-C08C14A106BC@sabahattin-gucukoglu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Sabahattin,

On Thu, 2010-04-08 at 00:07 +0100, Sabahattin Gucukoglu wrote:
> Sometimes I "Redirect" (RFC 5322 Resent-* fields) directly to my list. 
> The From: header thus is the original From:.  You might guess the
> problem: I'll redirect, then because subonlypost is set, a bounce will
> confuse the original sender.
> 
> Please can mlmmj support the Resent-From for the checks requiring a
> check against the original sender prior to the From: field?

No.

Quoting RFC 5322:

Resent fields are strictly informational.  They MUST NOT be used in the
normal processing of replies or other such automatic actions on
messages.

> BTW: would it be possible to implement nomail subscription
> automatically using a response to an initial post?

Could you rephrase that?


Best regards,
Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/


