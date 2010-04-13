From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Tue, 13 Apr 2010 05:31:33 +0000
Subject: Re: [mlmmj] Resent-From + subonlypost
Message-Id: <1271136693.12545.37.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <D3B4DC71-9D58-4DC3-86F9-C08C14A106BC@sabahattin-gucukoglu.com>
In-Reply-To: <D3B4DC71-9D58-4DC3-86F9-C08C14A106BC@sabahattin-gucukoglu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, 2010-04-12 at 00:32 +0100, Sabahattin Gucukoglu wrote:
> On 10 Apr 2010, at 20:34, Morten Shearman Kirkegaard wrote:
> > They MUST NOT be used in
...
> > other such automatic actions on messages.
> 
> That's right.  So how does this prevent using Resent-From before From?

That's how.

> sometimes someone wants to reply-all, including to a list,
> when they get into a thread someone quotes a list on.  Given the
> chance they may not want to subscribe but would, one time, reply to a
> message asking them if they want to post (like Dan's qsecretary). 
> When they reply, they get subscribed nomail, and the original post
> goes through.

Holding the original mail and releasing it when the sender subscribes
would require some changes, but it's doable. Automatically sending a
subscription request shouldn't be too hard. Patches are welcome.


Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/


