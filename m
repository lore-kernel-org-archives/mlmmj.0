From: "Christian Nygaard" <christiannygaard@gmail.com>
Date: Thu, 24 Aug 2006 11:34:43 +0000
Subject: mailinglist owner subscribe?
Message-Id: <4d4321660608240434i5444467g171a8b77f83c1742@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_114559_27230845.1156419283870"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

------=_Part_114559_27230845.1156419283870
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

How can the mailinglist owner subscribe new members to a mlmmj list?

I've tried chgrp subscribers.d folder and the files in it to list owners
group + emacs to edit them but as soon as someone unsubscribes from the list
the permissions are
changed back to nobody.nobody ownership.

Is there some mailinglist owner command that I missed that can be used?

ezmlm does this by:
mailinglist-subscribe-john=example.net@example.org

Thanks for input,
Chris

------=_Part_114559_27230845.1156419283870
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

How can the mailinglist owner subscribe new members to a mlmmj list?<br><br>I've tried chgrp subscribers.d folder and the files in it to list owners group + emacs to edit them but as soon as someone unsubscribes from the list the permissions are
<br>changed back to nobody.nobody ownership. <br><br>Is there some mailinglist owner command that I missed that can be used?<br><br>ezmlm does this by:<br>mailinglist-subscribe-john=<a href="mailto:example.net@example.org">
example.net@example.org</a><br><br>Thanks for input,<br>Chris<br>

------=_Part_114559_27230845.1156419283870--
