From: Henne Vogelsang <hvogel@opensuse.org>
Date: Thu, 25 Jul 2013 11:55:55 +0000
Subject: Re: [mlmmj] Rejecting HTML email
Message-Id: <51F1124B.1010606@opensuse.org>
List-Id: <mlmmj.mlmmj.org>
References: <CAF8XF0eb+proK0922N7s580n=r6L65m=5JYa3x9-wMk1W8Wp=A@mail.gmail.com>
In-Reply-To: <CAF8XF0eb+proK0922N7s580n=r6L65m=5JYa3x9-wMk1W8Wp=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey,

On 25.07.2013 13:48, Kai Hendry wrote:
> On 25 July 2013 18:32, Florian Effenberger <floeff@gmail.com> wrote:
>> have a look at https://github.com/awerner/pymime - that's what we use
>> at The Document Foundation for filtering.
> 
> That and Henne's spam filter header suggestion seems a bit overkill
> for my liking.
> 
> I think I pretty much have what I want with: http://ix.io/6RT
> 
> Have I missed anything?

There are a lot of things that can be multipart/alternative and
multipart/related in a mail. And especially people with very broken
client setups tend to not send mime-formatted text. It has proven to be
not very reliable for us...

Henne

-- 
Henne Vogelsang
http://www.opensuse.org
Everybody has a plan, until they get hit.
	- Mike Tyson

