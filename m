From: Jakob Hirsch <jh@plonk.de>
Date: Sun, 13 Mar 2005 23:55:30 +0000
Subject: Re: exim4
Message-Id: <4234D2F2.3090601@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>>I've wondered about that myself. If the binaries are installed somewhere
>>in $PATH, wouldn't that provide sufficient method for finding them?
> I would prefer for security reasons not to start parsing environment
> variables. 

Sounds sensible, but mlmmj uses execvp, which uses PATH itself, so why 
should you have to parse that yourself?
Another possibility would be to use a hard coded path from configure or 
some header file.

 > Besides, with this method, you can have many mlmmj
> installations in parallel.

mlmmj uses no config file, so what's the use? Having different versions 
of mlmmj running? That should be done with configure's --program-suffix. 
Otherwise you end up having a directory for every mlmmj installation.
