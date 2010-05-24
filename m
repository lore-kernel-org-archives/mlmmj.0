From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Mon, 24 May 2010 09:54:33 +0000
Subject: Re: [mlmmj] MLMMJ discarding messages
Message-Id: <20100524115433.6edca903@telenet.be>
List-Id: <mlmmj.mlmmj.org>
References: <4BF9D2DF.8070207@goirand.fr>
In-Reply-To: <4BF9D2DF.8070207@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, 24 May 2010 09:14:07 +0800
Thomas Goirand <thomas@goirand.fr> wrote:

> Hi,
> 
> MLMMJ has been discarding messages without valid reasons. Here's the
> message I get in my mail.log:
> 
> /usr/bin/mlmmj-process[5365]: mlmmj-process.c:705: Discarding
> /var/www/sites/dtc/gplhost.sg/lists/gplhost.sg_dtcdev//incoming/36fed42864be910a
> due to missing envelope from address: Success
> 
> As much as I know, there's a From: field.
> 
> Has anyone got a clue why it's doing this?
> 
> Thomas
> 
> 
> 

It's the envelope from address that's empty, not the "From:" header.
This means somebody send a mail with "<>" as the real sender of the
mail. Your mta should discard these already by itself.
Are you sure the messages discarded are valid messages? Check the
message in the discarded queue (if it is still there, it's kept for 7
days), location probably:
/var/www/sites/dtc/gplhost.sg/lists/gplhost.sg_dtcdev/queue/discarded/

Franky

