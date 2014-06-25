From: "A. Schulze" <sca@andreasschulze.de>
Date: Wed, 25 Jun 2014 06:32:47 +0000
Subject: Re: [mlmmj] mlmmj and DKIM
Message-Id: <20140625083247.Horde.nQCbYbAAb1g5Kt5L0saNOg1@horde.andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
References: <53A949B5.8070300@uffe.org>
In-Reply-To: <53A949B5.8070300@uffe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Uffe Jakobsen:

> I'm trying to solve a problem with some users originating and  
> posting to my lists from DKIM "restrained" sites.
...
> Any suggestions - How do you approach such problems ?

Hello,

we had a similar question a month ago (unfortunately not visible in  
the archive)
I suggest to simply not modify any message content. Not only on  
listservers - any MTA
should be configured to avoid unnecessary content modification.

In case of mlmmj thats easy.

$ rm ${LIST_HOME}/control/prefix
$ rm ${LIST_HOME}/control/footer
$ rm ${LIST_HOME}/control/delheaders

also I suggest to add a set of standard headers. These are normally  
not covered by DKIM signatures
and should not invalidate them.

$ cat ${LIST_HOME}/control/customheaders
List-Id: <testing.lists.example.org>
List-Post: <mailto:testing@lists.example.org>
List-Help: <mailto:testing+help@lists.example.org>
List-Subscribe: <mailto:testing+subscribe@lists.example.org>
List-Unsubscribe: <mailto:testing+unsubscribe@lists.example.org>
List-Owner: <mailto:testing+owner@lists.example.org>
Precedence: list

Andreas


