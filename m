From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 17 Jan 2012 21:58:12 +0000
Subject: Re: [mlmmj] Add Suscribers
Message-Id: <4F15EEF4.2000402@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
In-Reply-To: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 01/18/2012 04:47 AM, Cody Moreshead wrote:
> Please can someone help.  I may be using mimmj in the near future and
> have osme questions.  I need to be able to subscribe/unsubscribe users
> vie email.  For example set an email to
> 
> Mlmmj+subscribe@mlmmj.org <mailto:Mlmmj+subscribe@mlmmj.org>
> 
> With a body that has a bunch of emails to add.
> 
> Can this be done?
> 
> Thanks
> 
> Cody

It's not working with what's in the body. Instead, you'd have to tweak
what's in the headers, and send multiple emails.

Alternatively, you could just write a script that would write in the
subscriber.d folder by yourself. I do that (on a web GUI), and it works
very well.

Thomas

