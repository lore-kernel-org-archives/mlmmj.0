From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 05 Oct 2010 09:30:08 +0000
Subject: Re: [mlmmj] Is using the include path for php-admin a good idea?
Message-Id: <4CAAF020.8080303@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4CA87D1F.6030009@yahoo.com.au>
In-Reply-To: <4CA87D1F.6030009@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Franky Van Liedekerke wrote:
> On Sun, 3 Oct 2010 15:49:35 +0200
> Franky Van Liedekerke <liedekef@telenet.be> wrote:
> 
>> As a longtime php-coder, here's my opinion:
>> - Putting it in the include path is a bad idea
>> - hardcoding the path also
>> So best of all: figure out the current filepath, put it in a variable
>> and start from there (don't put this in a config file, it can be
>> determined automatically), something like "dirname(__FILE__);" or to
>> have the parent dir "basename(dirname(__FILE__));"
>>
> 
> well, please ignore my last statement :-)
> Basename strips the parent dir, not returns it. I wish for a mail-recall
> feature in mlmmj ;-)
> 
> Franky

It doesn't mater, you got the main principle right anyway. I agree that
here, there's absolutely no point in adding the include path. That one
is to use ... include, not at all for opening files like the php-admin
would need. It makes no sense in this context.

Thomas


