From: Yuri D'Elia <wavexx@thregr.org>
Date: Wed, 21 May 2014 12:32:56 +0000
Subject: Re: [mlmmj] Dealing with DMARC - any out-of-the-box solution in sight?
Message-Id: <537C9CF8.6020608@thregr.org>
List-Id: <mlmmj.mlmmj.org>
References: <CAOPHaVTAVpbLN9OUyzG7NMWu4szaHCKgLbjE56wvL6tJpFY-2A@mail.gmail.com>
In-Reply-To: <CAOPHaVTAVpbLN9OUyzG7NMWu4szaHCKgLbjE56wvL6tJpFY-2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 05/21/2014 01:19 PM, Christian Lohmaier wrote:
> Hi *,
> 
> DMARC is in use by yahoo and others for a while, and gmail and others
> already respect the settings, causing many bounces....
> 
> I wonder whether mlmmj will have some dmarc-compatible default soon or
> how other mailinglist admins deal with the topic.
> 
> Disallow all mail from dmarc-policy using senders?
> Forward only (no footers, no list-tag, no body filtering... - and no
> real solution with some SPF)?
> Just replace from-address by "John Doe via <list-addresss>"?
> Replace From and add reply-to?
> Replace From by forwarder-address?
> 
> What have other mailinglistadmins done?
> And what is the suggestion by mlmmj-devs?

I'm currently removing DKIM and some obvious headers (using delheaders):

DKIM-Signature:
Return-Receipt-To:
Disposition-Notification-To:
X-Confirm-Reading-To:
X-PMRQC:

in order to bypass DKIM checks. It works if there's no DMARC, but I had
no bounces from gmail users either.

If I read the spec correctly, the only solution would be to replace
From: with the list header (or a forwarder under the list domain) and
add a Reply-To:. And of course, you cannot modify the body/subject if
DKIM is in use.

I don't like neither. The ability to choose reply-to-author/list is lost.

Also, AFAIK there's no way to construct a Reply-To: automatically from
the From: address in mlmmj.

[sigh]

I don't understand why the keep breaking mailing lists....
Though DMARC with SPF *only* seems reasonable enough, the biggest
players all seem to use DKIM as well.


