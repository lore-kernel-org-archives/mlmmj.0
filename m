From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 04 Feb 2008 11:00:23 +0000
Subject: Re: strange mail from the list..
Message-Id: <20080204110023.GP84525@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Petre Daniel <dani@delfix.ro> [Jan 25. 2008 14:25]:
> so, i made a list with some subscribers, it has the following in the
> LISTNAME/control :
> 
> closedlist     delheaders   owner   subonlyget
> customheaders  listaddress  prefix  tocc
> 
> delheaders contains:
> Reply-To
> 
> customheaders contains:
> Reply-To:Listname <listname@domain.tld>
> 
> but the problem is at every mail i send to the list i receive it with a small
> text in front, like:
> 
> --- body of message ---
> 
> "Mime-Version: 1.0
> Content-Type: text/plain; charset="iso-8859-1"
> Content-Transfer-Encoding: quoted-printable"
> 
> my message..
> 
> --- end of body ---
> 
> any ideas please?

You have an empty line in customheaders?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
