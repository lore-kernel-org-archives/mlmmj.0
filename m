From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 05 Oct 2010 17:33:37 +0000
Subject: Re: [mlmmj] Is using the include path for php-admin a good idea?
Message-Id: <4CAB6171.4010603@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4CA87D1F.6030009@yahoo.com.au>
In-Reply-To: <4CA87D1F.6030009@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Ben Schmidt wrote:
>>>> As a longtime php-coder, here's my opinion:
>>>> - Putting it in the include path is a bad idea
>>>> - hardcoding the path also
>>>> So best of all: figure out the current filepath, put it in a variable
>>>> and start from there (don't put this in a config file, it can be
>>>> determined automatically), something like "dirname(__FILE__);" or to
>>>> have the parent dir "basename(dirname(__FILE__));"
>>
>> I agree that here, there's absolutely no point in adding the include
>> path. That one is to use ... include, not at all for opening files
>> like the php-admin would need. It makes no sense in this context.
> 
> Have a look at my attached proposed patch. The interface was already
> updated since the bug report was filed, but looking for tunables.pl
> relative to $templatedir seems senseless to me, so I've added another
> variable, $confdir. I've removed hard-coded paths and used paths
> relative to __FILE__ instead. Finding config.php in the first place
> could still be difficult, but at least the require directive for it is
> at the top of each file, so it's easy to find what to change.
> 
> What do you think?
> 
> Ben.

That's a much much much better solution, definitively!

Somebody has sent a bug report on the MLMMJ package in Debian, about
this issue, I guess he was reading the list. I guess I'll have to apply
this patch to the SID/Squeeze package before the release.

Thomas


