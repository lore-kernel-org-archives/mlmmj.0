From: Raymond den Ouden <r.denouden@psychotek.com>
Date: Fri, 10 Apr 2009 09:56:11 +0000
Subject: Re: looking for mlmmj.org..
Message-Id: <49DF17BB.7020009@psychotek.com>
List-Id: <mlmmj.mlmmj.org>
References: <DF400A85-5EB2-40BC-A8B6-F6BE54D3E971@mmj.dk>
In-Reply-To: <DF400A85-5EB2-40BC-A8B6-F6BE54D3E971@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Seems to be a strange problem, worldwide DNS hickup?

domainname settings are ok, also the authorative nameservers seem to be 
working

nslookup
 > server NS1.PIL.DK
Default server: NS1.PIL.DK
Address: 193.162.142.2#53
 > mlmmj.org
Server:         NS1.PIL.DK
Address:        193.162.142.2#53

Name:   mlmmj.org
Address: 194.100.76.173

it puzzles me.


Mads Martin Joergensen schreef:
> Good question below, anyone on the list knows?
>
>
> On 08/04/2009, at 16.53, B. Cook wrote:
>
>> Hello,
>>
>> I was going to the site to read about somethings.. and it seems the 
>> site is down/gone?..
>>
>> curl -v -I http://mlmmj.org
>> * gethostbyname_r(2) failed for mlmmj.org
>> * Couldn't resolve host 'mlmmj.org'
>> * Closing connection #0
>> curl: (6) Couldn't resolve host 'mlmmj.org'
>>
>> host -t ns mlmmj.org
>> Host mlmmj.org not found: 3(NXDOMAIN)
>>
>> Is everything ok?
>>
>>
>> -- 
>> B. Cook
>> Network Analyst
>> Poughkeepsie City School District
>> Mobile: 845.264.5827 | Desk: 845.451.4791
>

