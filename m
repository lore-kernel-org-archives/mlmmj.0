From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Wed, 19 Mar 2014 11:52:09 +0000
Subject: Re: [mlmmj] problems with many mails to a subscriber
Message-Id: <20140319115207.GB23804@szaflik.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <33e6f5e35cab1310d0c06eeae4106d27@swn.nu>
In-Reply-To: <33e6f5e35cab1310d0c06eeae4106d27@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, Mar 18, 2014 at 07:51:36PM +0100, Christian Gleerup wrote:
> so I guess the scenario is,
> we send to <**RECIPENT**>
> <**RECIPENT**> forwards a copy to <**RECIPENT_REAL_NAME@SUR_NAME.COM**> 
> <**RECIPENT_REAL_NAME@SUR_NAME.COM**> complains that the mail comes from a wrong IP according to our SPF record.
> the person the checks probably both <**RECIPENT**> and <**RECIPENT_REAL_NAME@SUR_NAME.COM**>, and since the behaviour above, 

This is one reson why SPF is a Bad Thing. It breaks previuosly normal,
valid and legitimate functionality such as simple email forwarding, user
-requested resends (aka "bounces" - not related to SMTP bounce) etc.

One thing you may try is to change your SPF record to soft fail (~all)
if you have hard fail (-all) currently. It may cause the recipient's
system not to bounce the forwarded mail. Or maybe - as a short-term                                                                                                                                   experiment to verify if the SPF theory is correct - add the forwarding
system's address or domain to your SPF record.
                                                                                                                                                                                                      Otherwise I would rather say that SPF, forwarding and bounce-probing
are simply an incompatible set of features.
                                                                                                                                                                                                      Another thing - ask the user (or propose doing it youself) to change her
subscription to the target (forwarded to) address.

Cheers,

--                                                                                                                                                                                                    Piotr "Malgond" Auksztulewicz                     firstname@lastname.net


