From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Fri, 20 Jan 2012 03:59:41 +0000
Subject: Re: [mlmmj] Add Suscribers
Message-Id: <robbat2-20120120T035656-871153333Z@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
References: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
In-Reply-To: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Jan 19, 2012 at 08:24:55AM -0700, Cody Moreshead wrote:
> I'll explain what we are doing to see if there is another solution.  We
> have a mail list of ~12,000 people that get a weekly newsletter.  We
> currently have a way to track subscribes and unsubscribes in our
> business program that is based on SQL.  The mailist will be hosted on
> our ISP's server.  What I was hoping is that at the end of each day I
> could send two emails from the SQL server (easily done) to our ISP that
> would automatically add and remove people from the list.  For various
> reasons the person that does the newsletter does not want to relinquish
> control of the additions/subtractions to the list.
What ability do you have to run other code on the ISP's server?
If you have a shell account, you have more than enough ability to do
what you want in a much more secure manner.

It would however be useful if mlmmj-sub/unsub could take stdin for the
list of email addresses to add/remove, instead of having to exec them
for each address.

-- 
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85

