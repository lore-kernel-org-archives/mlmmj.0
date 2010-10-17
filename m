From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 17 Oct 2010 15:39:09 +0000
Subject: Re: [mlmmj] Is using the include path for php-admin a good idea?
Message-Id: <4CBB189D.7080803@goirand.fr>
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

Hi Ben,

Has this patch been applied? I think it would fix this:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bugY9183

As this would almost certainly fix this bug which is "release critical"
in Debian, I would like to know if you have tested it and applied it to
your HG repo. I didn't find it in the log on the web. I'd happily apply
it if I have confirmations that it fixes the issue (if nobody tests it,
I might be able to, but not right now, as I'm busy with other stuff).

Cheers,

Thomas

