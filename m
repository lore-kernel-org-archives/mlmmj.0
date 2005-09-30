From: Neale Pickett <neale@woozle.org>
Date: Fri, 30 Sep 2005 15:36:35 +0000
Subject: Re: silently discarded post
Message-Id: <200509300936.36102.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
In-Reply-To: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Friday 30 September 2005 08:34 am, Mads Martin Joergensen wrote:

> It is the source of the error, and very hard to work around. Reason
> mlmmj discards it, is that it's not a valid from with two email adresses
> in it, and then it's thrown away.

The original header value was:

  From: "Patterson, Daniel@EDD"  <DPatters@edd.ca.gov>

This is perfectly valid according to both RFC 822 and RFC 2822, and parsing 
this as two addresses is an error.  I'll work on a patch to correctly parse 
it, but I can't promise anything right away.


The stuff inside the quotation marks is considered a "display-name" in the RFC 
2822 BNF, section 3.4:

address         =       mailbox / group

mailbox         =       name-addr / addr-spec

name-addr       =       [display-name] angle-addr

angle-addr      =       [CFWS] "<" addr-spec ">" [CFWS] / obs-angle-addr

group           =       display-name ":" [mailbox-list / CFWS] ";"
                        [CFWS]

display-name    =       phrase

mailbox-list    =       (mailbox *("," mailbox)) / obs-mbox-list

address-list    =       (address *("," address)) / obs-addr-list


And then "phrase" is defined in section 3.2.6:

word            =       atom / quoted-string

phrase          =       1*word / obs-phrase


And "quoted string" is discussed in 3.2.5:

qtext           =       NO-WS-CTL /     ; Non white space controls

                        %d33 /          ; The rest of the US-ASCII
                        %d35-91 /       ;  characters not including "\"
                        %d93-126        ;  or the quote character

qcontent        =       qtext / quoted-pair

quoted-string   =       [CFWS]
                        DQUOTE *([FWS] qcontent) [FWS] DQUOTE
                        [CFWS]


Correctly parsing all valid email addresses is a pain.  I can't find any 
non-GPL code that does it but I haven't looked too hard.

Neale

