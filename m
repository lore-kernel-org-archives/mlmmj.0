From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 19 Oct 2014 20:33:08 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <54442004.2060203@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thanks for documenting your experience. One day hopefully we can
integrate anything that's missing into Mlmmj's README.sendmail. I think
if nothing else, README.sendmail is only for non-virtual setups, so
could definitely be improved, as virtual setups seem more common these
days.

On 18/10/14 7:56 AM, webmaster@vlsc.org wrote:
> - I'm not sure I needed to, but I also created a list-owner entry in the
> virtusertable file:
>
> listname-owner@mydomain.com    listname-owner.mydomain.com
>
> and an entry in the /etc/aliases file:
>
> listname-owner.mydomain.commyownaddr@mydomain.com

You shouldn't need this.

Mlmmj provides listname+owner@mydomain.com (note the + where you had -)
which forwards to the address(es) listed in the owner tunable for the
list. Other Mlmmj features, e.g. subscription, also use +, such as in
listname+subscribe.

Ben.




