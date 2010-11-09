From: Martin Koch Andersen <martin@925.dk>
Date: Tue, 09 Nov 2010 10:17:21 +0000
Subject: [mlmmj] Mail delivery issues and requeue
Message-Id: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

Today I had a user contacting me, that is a normal subscriber to one of our mlmmj mailinglists.
He was not getting any mails he said.

I confirmed that he was indeed subscribed to the list, and other users are getting their mails.
There is not a trace of his email addresses i the postfix maillog.

But I found his address in requeue/x/subscribers.

Can anyone explain to me what excatly requeue is?
I don't understand why I can't find a delivery attempt in the maillog, but there is an entry in requeue?

Is this normal? And why is the user not getting any mail (ending up in requeue)?

I grep'ed on other addresses found in requeue/x/subscribers files, some of them were in maillog, but others, as the case mentioned above, were not.

Maintenance job is of course running.

Thanks in advance for any help regarding this issue.

-- 
Martin Koch Andersen
http://925.dk

