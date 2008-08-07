From: Gareth Fiford <gareth@phporaclehosting.com>
Date: Thu, 07 Aug 2008 20:01:44 +0000
Subject: Re: Quick hack to get mlmmj to work in PHP 5
Message-Id: <236FD4AC-C9FA-49B2-B1A9-545C9DA6D22E@phporaclehosting.com>
List-Id: <mlmmj.mlmmj.org>
References: <45CB89DA-8EDA-4BB9-B500-967D0245BB71@phporaclehosting.com>
In-Reply-To: <45CB89DA-8EDA-4BB9-B500-967D0245BB71@phporaclehosting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Ps you do seem like an angry bunch, do you give this much of a hard  
time to everyone who wants to help your project?

Sent from my iPhone

On 7 Aug 2008, at 20:08, Thomas Goirand <thomas@goirand.fr> wrote:

> Gareth Fiford wrote:
>> Register globals is a security no no
>>
>> You don't need to disable globals for this to work
>>
>> No one is going to enable globals on any of my servers
>
> I would rather add a very small .htaccess or a directive in
> /etc/apache2, with the proper php directive to enable register  
> globals.
> That is much much better than modifying files of a package that will  
> be
> overwritten at the next upgrade. I don't see why using "Register
> globals" only for the faulty script is less safer than your hack (in
> fact, your hack is even more dangerous, as it's badly written, it
> forgets about things in sessions for example, so it's not fully
> compatible with enabling register globals).
>
>> Http_post_vars depricated on favour of _POST
>>
>> Same for get
>
> And both are to be avoided, it's been YEARS that I recommend using
> $_REQUEST instead so you don't need to bother if the variables are
> coming from GET, POST, or even the cookies.
>
>> Sent from my iPhone
>
> No one is going to enable an iPhone on any of my servers :)
>
> Thomas
