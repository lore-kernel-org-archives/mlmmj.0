From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 17 Oct 2010 23:16:08 +0000
Subject: Re: [mlmmj] Is using the include path for php-admin a good idea?
Message-Id: <4CBB83B8.9090707@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4CA87D1F.6030009@yahoo.com.au>
In-Reply-To: <4CA87D1F.6030009@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> Have a look at my attached proposed patch. The interface was already
>> updated since the bug report was filed, but looking for tunables.pl
>> relative to $templatedir seems senseless to me, so I've added another
>> variable, $confdir. I've removed hard-coded paths and used paths
>> relative to __FILE__ instead. Finding config.php in the first place
>> could still be difficult, but at least the require directive for it is
>> at the top of each file, so it's easy to find what to change.
>
> Has this patch been applied?

I've just given it a quick test, merged and pushed it, along with
another little bug fix related to the earlier security fix, that is
particularly for the Mac.

> I think it would fix this:
>
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bugY9183

I think it will probably fix it, too, but haven't explicitly tested
that. Somebody else will need to do that.

Ben.





