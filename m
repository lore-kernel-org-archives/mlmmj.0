From: Uffe Jakobsen <uffe@uffe.org>
Date: Thu, 03 Feb 2005 15:26:45 +0000
Subject: Re: Corrections to mlmmj-1.2.2
Message-Id: <420242B5.8060507@uffe.org>
List-Id: <mlmmj.mlmmj.org>
References: <4202359E.7030404@uffe.org>
In-Reply-To: <4202359E.7030404@uffe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Martin,

Thanks for your fast response !

Mads Martin Joergensen wrote:
> * Uffe Jakobsen <uffe@uffe.org> [Feb 03. 2005 15:30]:
>>"/etc/aliases": in order to support arguments to the proc alias the command 
>>needs to be enclosed in quotes like this:
>>
>>mlmmj-test:     |"/usr/local/bin/mlmmj-recieve -L 
>>/var/spool/mlmmj/mlmmj-test/"
> 
> 
> I think I had it like that once, but someone claimed it should be
> otherwise. Is this mailserver dependant?
> 
> 

Currently you have this variation (see below) in your README file - that for sure will not work - because '|' needs to be the first non-whitespace char after ':' in /etc/aliases

WRONG:
mlmmj-test:     "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test"

RIGHT:
mlmmj-test:     |"/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test"

>>
>>I guess that you've forgot to postpend a '/' between the listdir and the 
>>file name for the logfile.
> 
> 
> Good spotting! Here's a patch to fix it:
> 

I can verify that the fix in src/log_oper.c works for me - thanks !!!  :-)

Kind regards Uffe Jakobsen


