From: Martin Koch Andersen <martin@925.dk>
Date: Tue, 09 Nov 2010 10:34:02 +0000
Subject: [mlmmj] Re: Mail delivery issues and requeue
Message-Id: <FE1B10C8-1847-49AE-A149-0820B0B86712@925.dk>
List-Id: <mlmmj.mlmmj.org>
References: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
In-Reply-To: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 09/11/2010 11.17, Martin Koch Andersen wrote:
> Hi,
> 
> Today I had a user contacting me, that is a normal subscriber to one of our mlmmj mailinglists.
> He was not getting any mails he said.
> 
> I confirmed that he was indeed subscribed to the list, and other users are getting their mails.
> There is not a trace of his email addresses i the postfix maillog.
> 
> But I found his address in requeue/x/subscribers.
> 
> Can anyone explain to me what excatly requeue is?
> I don't understand why I can't find a delivery attempt in the maillog, but there is an entry in requeue?
> 
> Is this normal? And why is the user not getting any mail (ending up in requeue)?
> 
> I grep'ed on other addresses found in requeue/x/subscribers files, some of them were in maillog, but others, as the case mentioned above, were not.
> 
> Maintenance job is of course running.

One more information. I have "noarchive" enabled for all lists. So what happens to the subscribers ending up in requeue? How can mails be re-sent, when the original mail is not stored anywhere? So how can requeue be processed when noarchive is enabled?

And still, I don't get why subscribers end up in requeue in the first place - without a delivery attempt.

Thanks again.

-- 
Martin Koch Andersen
http://925.dk

