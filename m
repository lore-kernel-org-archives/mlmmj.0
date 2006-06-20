From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 20 Jun 2006 14:57:48 +0000
Subject: Re: Mail sent to mlmmj-recieve but MLMMJ don't send subscribeconfirmation
Message-Id: <44980CEC.4020208@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <44916980.7060706@goirand.fr>
In-Reply-To: <44916980.7060706@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Morten K. Poulsen wrote:
> On Sun, 18 Jun 2006 14:42:04 +0800, Thomas Goirand <thomas@goirand.fr> wrote:
>> Christoph Wilke wrote:
>>> Did you change your command delimeter to a '-' (minus sign)?
>>> If not, this might be the problem and the address should read:
>>> testzigo+subscribe@stoppnazistene.no
>> Yes, my control panel does that setup as default. This might change in
>> the future, as I've noticed that using the '-' delimiter prevent from
>> using "my-address@my-domain.com". Anyway, this is NOT the problem.
> 
> How do you know that it is not the problem?
> 
> Did you remember to set the "delimiter" option in mlmmj?
> 
> Morten

As I said, we have MLMMJ being setup for all our control panel account,
I have arround 50 VPS setup with Postfix + MLMMJ and there was no
problem on them (at least nobody complained).

This VPS server is setup with the latest CVS version of our control
panel, and that might be the reason (maybe something broken in our CVS?).

Anyway, as I get less busy with super-important-urgent things this week,
I'll be able to check. I'm almost sure it's our fault, I just needed to
check, and there is a big chance that this patch doing extensive logging
will help me to find out.

Thomas
