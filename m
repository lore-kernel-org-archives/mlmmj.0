From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Tue, 13 Apr 2010 05:20:42 +0000
Subject: Re: [mlmmj] More Nits
Message-Id: <1271136042.12545.32.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
In-Reply-To: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, 2010-04-11 at 23:58 +0100, Sabahattin Gucukoglu wrote:
> On Wed, 2010-04-07 at 05:39 +0100, Sabahattin Gucukoglu wrote:
> >> Delimiter, if set to '-', causes problems when list names have '-' in
> >> them.  Since this isn't the behaviour of for instance ezmlm, it'd be
> >> nice if this could be fixed somehow.
> 
> If I try to send mail to list "me-mates" when delimiter is '-',
> there'll be a message in syslog that tells me that "mates" isn't a
> valid command. :-)

Which mail server are you using, and how do you invoke mlmmj?

> I think the solution is to scan from the right, so that the list can
> contain the delimiter character.

No, then listname-bounce-user=example.org@example.net would be
interpreted as the list "listname-bounce" with the command
"user=example.org".

Having the delimiter in the name is quite ugly, and requires help from
the mail server; It must set the environment variable EXTENSION,
LOCAL_PART_SUFFIX or DEFAULT, or invoke mlmmj-recieve [sic] with the -e
option.


Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/


