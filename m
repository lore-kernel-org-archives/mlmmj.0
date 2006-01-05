From: Thomas Goirand <thomas@goirand.fr>
Date: Thu, 05 Jan 2006 03:12:18 +0000
Subject: Re: mlmlmj control files
Message-Id: <43BC8E92.9020001@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
In-Reply-To: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Mads Martin Joergensen wrote:

>* Mads Martin Joergensen <mmj@mmj.dk> [Jan 04. 2006 20:30]:
>  
>
>>* Mads Martin Joergensen <mmj@mmj.dk> [Jan 02. 2006 17:49]:
>>    
>>
>>>Relayhost has the same problem, and I really should fix it tomorrow on
>>>my last vacation day--it's a pretty ridiculous and annoying bug.
>>>
>>>Problem is that in the case of administrative mails, there was no need
>>>to pass a list directory to mlmmj-send, and thus does there two files
>>>not get read.
>>>      
>>>
>>So it wasn't tomorrow, but the day after tomorrow :-)
>>
>>Please test--I might have forgotten a place.
>>    
>>
Hello,

As said before, we have setup MLMMJ inside our GPL control panel. It's 
now a click and go, if your /etc/mailname and mydestination in postifx 
is setup correctly. Our setup include amavis + clamav + spamassassin 
(see http://www.gplhost.com/software-dtc.html). Virus as simply put in 
quarantine, and a warning message is sent. For spam, they are marked as 
spams, and when it's not a list, it's dropped inside a special IMAP 
folder for spams.

Would it be possible that MLMMJ handle the informations sent by both 
clamav and spamassassin, warn the owner of the list (maybe send the mail 
as attachment) and not send the mail to the subscribers? That would be a 
killer feature that would make people switch IMHO.

Regards,

    Thomas Goirand

