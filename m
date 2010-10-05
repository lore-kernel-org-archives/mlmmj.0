From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 05 Oct 2010 23:23:19 +0000
Subject: Re: [mlmmj] mlmmj-maintd recursively
Message-Id: <4CABB367.6030001@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
In-Reply-To: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

(We lost the list; adding it back.)

On 6/10/10 3:14 AM, Thomas Goirand wrote:
> Ben Schmidt wrote:
>> On 5/10/10 8:34 PM, Thomas Goirand wrote:
>>> Florian Effenberger wrote:
>>>> Hi,
>>>>
>>>> is there an option to run mlmmj-maintd recursively? My Ubuntu cron
>>>> script invokes
>>>>
>>>> /usr/bin/mlmmj-maintd -F -d /var/spool/mlmmj
>>>>
>>>> However, I have my list organized in
>>>>
>>>> /var/spool/mlmmj/site1.org
>>>> /var/spool/mlmmj/site2.org
>>>>
>>>> and the like, and it seems that the above command at least doesn't
>>>> send out digests. I just invoked it manually with
>>>>
>>>> /usr/bin/mlmmj-maintd -F -d /var/spool/mlmmj/site1.org
>>>> /usr/bin/mlmmj-maintd -F -d /var/spool/mlmmjsite2.org
>>>>
>>>> and this seems to work.
>>>>
>>>> Thanks,
>>>> Florian
>>>
>>> Hint:
>>>
>>> find /var/spool/mlmmj -type d -exec \
>>>      /usr/bin/mlmmj-maintd -F -d {} \;
>>
>> Won't this also go too shallow and deep, though? I.e. it will run
>
> Use the -maxdepth option then!
>
> find /var/spool/mlmmj/ -mindepth 1 -maxdepth 1 -type d \
> 	/usr/bin/mlmmj-maintd -F -d {} \;
>
> the -mindepth 1 will remove /var/spool/mlmmj/ itself that would be
> otherwise listed...

Wonderful! I should work on my find(1) voodoo.

I have integrated this into the README for future releases. It will show
up in version control once I get around to pushing it.

Ben.




