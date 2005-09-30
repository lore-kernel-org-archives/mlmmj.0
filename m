From: "Patrick Bennett" <patrick@pebcomputing.com>
Date: Fri, 30 Sep 2005 15:56:21 +0000
Subject: Re: silently discarded post
Message-Id: <012d01c5c5d7$8222b3c0$6664a8c0@stnick>
List-Id: <mlmmj.mlmmj.org>
References: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
In-Reply-To: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

----- Original Message ----- 
From: "Mads Martin Joergensen" <mmj@mmj.dk>
To: <mlmmj@mmj.dk>
Sent: Friday, September 30, 2005 7:34 AM
Subject: Re: silently discarded post


>* Patrick Bennett <patrick@pebcomputing.com> [Sep 29. 2005 23:50]:
>> I pointed this out to the user and he says that listing is kept in a
>> global directory at work (he is a government employee... take a look
>> at the address, you can probably guess where) and he has no power to
>> change the way the listing is set up.  Additionally, he won't be able
>> to get anywhere having the IT Department change the listing for him,
>> since this is about a email issue for personal use.
>>
>> Thus, if this is the source of the error, the only way for him to be
>> able to use the mailing list is for mlmmj to be able to work around
>> it.
>
> It is the source of the error, and very hard to work around. Reason
> mlmmj discards it, is that it's not a valid from with two email adresses
> in it, and then it's thrown away.
>

I wonder if this could be (from a logical standpoint) handled in one of the 
following two ways, and whether it would make sense to program this logic 
into mlmmj:

1) Even though it is not a "valid from" if it contains (what appear to be) 
two email addresses and one of the two is on the authorized-to-post-list, 
the mail is accepted;

or

2) here's a quick survey of "From" fields in the message sources in my 
inbox:

From: "Patterson, Daniel@EDD" <DPatters@edd.ca.gov> (the offending example)
From: "renatofea@yahoo.com.br" <renatofea@yahoo.com.br>
From: Mads Martin Joergensen <mmj@mmj.dk>
From: root@norcalsolutions.com
From: Arno van Amersfoort <arnova@rocky.eld.leidenuniv.nl>

If there is a matching pair of <>, everything inside the "" (if they exist), 
or everything prior to < should be discarded.  Or perhaps it would be better 
to simply scan the "From" field and first discard everything inside quotes, 
before searching it for an @?

As I see it, the problem isn't so much a bloated mailer (even though it 
probably is bloated), it's that the @ symbol is considered a valid character 
for the "name" field of many mailers' email account settings (and now I see 
Neale's reply that this is within the RFC's).  I've just tested outlook 
express and mozilla thunderbird and both accepted @'s.  I believe my user is 
using outlook.  Theoretically, lots of mlmmj users and administrators - and 
not just ones using microsoft mailers - could run into this 
two-@'s-in-the-from-field snafu.

TIA,
Patrick 

