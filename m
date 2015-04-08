From: "Christian Gleerup" <cromozon@swn.nu>
Date: Wed, 08 Apr 2015 07:31:00 +0000
Subject: Re[2]: [mlmmj] Setup access rule to only allow single sender IP
Message-Id: <68c6069aa919a54eef45fc6822877dbc@swn.nu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Dear Chris

Just to be sure I am clear, because from your response I am uncertain.
now I might say the same as what you have already written, just with my own wording.
sorry about that but I am really weak in the termonology used for emails :/

the system I have mlmmj running on, I do have access to the mail system,

> On 04/08/2015 01:48 AM, Christian Gleerup wrote:
> > Hi Chris
> > 
> > The computer that the mail is written from can be different,  but
> > they are send from a webmail client, as far as i can see, it does not
> > embed the ip in the email header.
> 
> That's unusual.  Usually a webmail system would talk SMTP to the local
> MTA, thereby leaving a "Received:" mail header that would contain the
> connection IP address (even if it's localhost [127.0.0.1]).  Are you
> saying that even this isn't added to the header?
> 
> > So i was wondering if it could be seen in some other way?
> 
> Well if you're sending mail from a webmail system then the /web server/
> would be the only place that would know the connection IP address.  From
> there if the webmail system contacts the MTA, the MTA will only get the
> IP of the webmail system, not the originating IP connecting to webmail.

The connection between the user (client-ip) and the webmail is not pinned to a single IP.
the client-IP /is/ embedded in the header, but it cannot be used in the access rules since it will change.

 
> It might be possible to write an ACL /in the MTA rules/ to do what you
> want here, but it would require the ACL to be able to parse the webmail
> logs, i.e. the webserver logs for webmail connections.  There are
> versions of Exim [such as exim4-daemon-heavy on Debian] which contain
> embedded Perl where you could write such a rule and use Perl regexes
> and so forth to match on an IP or a particular authenticated username...
> but all of this is dependent on what MTA you're using.


since the webmail does not embed the IP adress of the SMTP it is using in the header 
I guess what you are saying is that I have to handle this in the mail system 
(could that be postfix?, I am not really sure if postfix is only for sending or also receiving...)


I guess there are a couple of ways I could handle this then

1) in postfix?, I could configure a rule such that emails from the allowed address must come from a specific IP, 

2) I could configure some rule in postfix? such that the smtp IP is embedded in the adress, and then add this rule to the access controll in mlmmj

3) Am I missing that the header already is in the email by default, 
I have only inspected the raw header when the from the webmail was sent to my personal email (this), in here I could se a 'received from' (your email for instance have this in the header: Received: from*([173.77.220.181]
It is this I should try to go for? in the access control?

kind regards Christian.




