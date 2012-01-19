From: "Cody Moreshead" <cody@leachman.com>
Date: Thu, 19 Jan 2012 15:24:55 +0000
Subject: RE: [mlmmj] Add Suscribers
Message-Id: <D176E0C7E42DA44992D7811C809C30844E49CB@redbull.leachman.com>
List-Id: <mlmmj.mlmmj.org>
References: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
In-Reply-To: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I'll explain what we are doing to see if there is another solution.  We
have a mail list of ~12,000 people that get a weekly newsletter.  We
currently have a way to track subscribes and unsubscribes in our
business program that is based on SQL.  The mailist will be hosted on
our ISP's server.  What I was hoping is that at the end of each day I
could send two emails from the SQL server (easily done) to our ISP that
would automatically add and remove people from the list.  For various
reasons the person that does the newsletter does not want to relinquish
control of the additions/subtractions to the list.

Thanks for the help
Cody

-----Original Message-----
From: mlmmj@mlmmj.org [mailto:mlmmj@mlmmj.org] On Behalf Of Ben Schmidt
Sent: Wednesday, January 18, 2012 11:04 PM
To: Cody Moreshead
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] Add Suscribers

On 18/01/12 7:47 AM, Cody Moreshead wrote:
> Please can someone help. I may be using mimmj in the near future and 
> have osme questions. I need to be able to subscribe/unsubscribe users 
> vie email. For example set an email to
>
> Mlmmj+subscribe@mlmmj.org <mailto:Mlmmj+subscribe@mlmmj.org>
>
> With a body that has a bunch of emails to add.
>
> Can this be done?

Mlmmj doesn't have any functionality like this at the moment. I'm not
sure it's very likely to be added, either, because email is so easily
forged. Your mail server would effectively become an open relay for a
spammer if they could simply forge an email from an administrator to
subscribe a huge number of people to a mailing list and then send a
message to it for delivery.

Is there a particular reason you want or need to do this by email?
Perhaps if you explain your problem to us in more detail we could
suggest an alternative solution. Using the commandline or a web
interface behind some kind of authentication are strong possibilities.

Cheers,

Ben.







