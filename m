From: "Gerd v. Egidy" <lists@egidy.de>
Date: Fri, 20 Jan 2012 09:00:56 +0000
Subject: Re: [mlmmj] Add Suscribers
Message-Id: <201201201000.56043.lists@egidy.de>
List-Id: <mlmmj.mlmmj.org>
References: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
In-Reply-To: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

> We
> have a mail list of ~12,000 people that get a weekly newsletter.  We
> currently have a way to track subscribes and unsubscribes in our
> business program that is based on SQL.  The mailist will be hosted on
> our ISP's server.  What I was hoping is that at the end of each day I
> could send two emails from the SQL server (easily done) to our ISP that
> would automatically add and remove people from the list.

we had exactly the same problem two years ago. We came to the conclusion that 
a mailinglist software like mlmmj is not the best solution for a newsletter 
scenario.

We now have a software that is dedicated for sending newsletters. It has 
several advantages like database imports from our crm software, personalized 
mails, true formatting for multipart/alternative (you can control the html and 
text part individually) and several more.

We have defined a view in our database which shows all recipients. Every time 
we send a newsletter, I export this and import it on the newsletter server. 
This is just two clicks.

We use http://www.superwebmailer.de/ but this seems to be available in German 
only. But I guess there is similar software available in English too.

Kind regards,

Gerd

-- 
Address (better: trap) for people I really don't want to get mail from:
jonas@cactusamerica.com

