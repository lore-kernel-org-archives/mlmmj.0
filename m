From: Martin Brampton <martin@black-sheep-research.com>
Date: Tue, 05 Nov 2019 09:29:15 +0000
Subject: Re: [mlmmj] How to start mlmmj as a service on Ubuntu 16.04
Message-Id: <4e8a38c7-6c53-4b94-a576-20df78a01004@black-sheep-research.com>
List-Id: <mlmmj.mlmmj.org>
References: <c52f5e7ebee197bd7ad6a46820f7368d@dalek.zone>
In-Reply-To: <c52f5e7ebee197bd7ad6a46820f7368d@dalek.zone>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 05/11/2019 02:18, Ori Bernstein wrote:
> On Tue, 05 Nov 2019 03:59:22 +0200, Dave Nelson <dave@dalek.zone> wrote:
> 
>> Hello,
>> I have installed mlmmj, but it is not started as a service on Ubuntu
>> 16.04 (systemd).
>> Please would anyone have instructions/advice about how to start mlmmj at
>> boot time on Ubuntu 16.04?
>> With many thanks in advance for any help,
>> Dave
> 
> mlmmj is not a service. It is run by your mail server. Configure a popular
> mail server (eg, postfix), and read then follow the directions here:
> 
> 	http://mlmmj.org/docs/readme-postfix/
> 
> If you prefer a different mail server, then follow (or adapt) the directions
> for those.

Quite correct, but it does prompt a related question. There is mention 
in the documentation of running mlmmj-maintd as a service, but how would 
this be done? Is it advantageous, relative to running maintd with cron?


