From: "Nikolay Derkach" <nderkach@gmail.com>
Date: Sat, 30 Aug 2008 20:01:34 +0000
Subject: Re: Russian translations for mlmmj
Message-Id: <f276b80f0808301301s77225944j19c405505197e227@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <1200309131.6509.12.camel@mopo-laptop>
In-Reply-To: <1200309131.6509.12.camel@mopo-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sat, Aug 30, 2008 at 11:34 PM, Thomas Goirand <thomas@goirand.fr> wrote:
> Nikolay Derkach wrote:
>> cat file | uni2ascii -a U > file.ascii
>>
>> uni2ascii can be found at http://billposer.org/Software/uni2ascii.html
>
> What's the advantage of uni2ascii compared to iconv that is a standard
> tool shipped with all libc6 setup?

Maybe, but I took a quick look at iconv and didn't succeed with it
(tried -f utf8 -t ascii).

>> PS: In my opinion, localizations in ascii is a nonsense, really it's a
>> step back.
>
> Every software should use gettext(), that's for sure!

That doesn't contradict my statement.

-- 
Regards, Nikolay Derkach
