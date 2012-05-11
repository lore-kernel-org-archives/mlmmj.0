From: theo borm <theo_mlmmj@borm.org>
Date: Fri, 11 May 2012 13:55:55 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <4FAD1A6B.5010806@borm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010800070107050200000007"
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
To: mlmmj@mlmmj.org

--------------010800070107050200000007
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christian,

Thanks for the answer.

On 05/11/2012 02:43 PM, Christian Laursen wrote:
> On 05/11/12 13:41, theo borm wrote:
> >
>> We operate a small, closed, moderated mailing list that recently stopped
>> working for a large part of its subscribers. The organization of which
>> these subscribers are a member maintains an SPF record which denies
>> access to all servers except a named few, which seems to be the cause of
>> these problems.
>
> It sounds like their SPF implementation is broken.

microsoft?

>
>> As a work-around I set mlmmj to use a different from address in the
>> "From:" header. This solution is, however, plainly bad as it removes the
>> original sender from the headers. I have seen other lists use "Sender:"
>> header, but results are a mixed bag. With strict SPF checking of the
>> "From:" header in place these mails also don't pass.
>
> SPF checking should be done on the enevelope FROM address, not the 
> From: header contained inside the mail.

http://www.openspf.org/SPF_vs_Sender_ID summarizes this nicely:

<quote>
How will /Sender ID/ implementations violating the /SPF/ specification 
affect me?

If you have published an |v=spf1| policy to protect the use of your 
domain in the MAIL FROM and HELO addresses, /Sender ID/ implementations 
that apply your policy to /PRA/ (per RFC 4406) will reject your mail if 
you use your domain in the "|From|" (or generally /PRA/) header field 
while sending from (MAIL FROM) another system.
</quote>

organization has an |v=spf1| policy in place. Mail is outsourced to 
microsoft, which uses sender ID.

It's the receiving server which has to implement spf/sender-ID, so 
delivery is erratic to say the least.


>
> When mlmmj send out mails to the list subscribers the envelope from 
> looks something like this:
> listname+bounces-XXXX-recipient=example.com@listowner.tld

listowner.tld doesn't have an spf record.

this is not the problem. problem is the "From" field/

>
> So the SPF checking is done against the domain that the list is 
> running on.
>
> The correct cause of action would be to get the organization with 
> broken SPF checking to fix that.
>

I (and others) have told them a few times to no avail.

regards, Theo


--------------010800070107050200000007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Hi Christian,<br>
<br>
Thanks for the answer.<br>
<br>
On 05/11/2012 02:43 PM, Christian Laursen wrote:
<blockquote cite="mid:4FAD0956.3040705@borderworlds.dk" type="cite">On
05/11/12 13:41, theo borm wrote: <br>
&gt; <br>
  <blockquote type="cite">We operate a small, closed, moderated mailing
list that recently stopped <br>
working for a large part of its subscribers. The organization of which <br>
these subscribers are a member maintains an SPF record which denies <br>
access to all servers except a named few, which seems to be the cause
of <br>
these problems. <br>
  </blockquote>
  <br>
It sounds like their SPF implementation is broken. <br>
</blockquote>
<br>
microsoft?<br>
<br>
<blockquote cite="mid:4FAD0956.3040705@borderworlds.dk" type="cite"><br>
  <blockquote type="cite">As a work-around I set mlmmj to use a
different from address in the <br>
"From:" header. This solution is, however, plainly bad as it removes
the <br>
original sender from the headers. I have seen other lists use "Sender:"
    <br>
header, but results are a mixed bag. With strict SPF checking of the <br>
"From:" header in place these mails also don't pass. <br>
  </blockquote>
  <br>
SPF checking should be done on the enevelope FROM address, not the
From: header contained inside the mail. <br>
</blockquote>
<br>
<a class="moz-txt-link-freetext"
 href="http://www.openspf.org/SPF_vs_Sender_ID">http://www.openspf.org/SPF_vs_Sender_ID</a>
summarizes this nicely:<br>
<br>
&lt;quote&gt;<br>
How will <em class="em1">Sender ID</em> implementations violating the <em
 class="em1">SPF</em> specification affect me?
<p>If you have published an <code>v=spf1</code> policy to protect the
use of your domain in the <tt>MAIL FROM</tt> and <tt>HELO</tt>
addresses, <em class="em1">Sender ID</em> implementations that apply
your policy to <em class="em1">PRA</em> (per RFC 4406) will reject
your mail if you use your domain in the "<code>From</code>" (or
generally <em class="em1">PRA</em>) header field while sending from (<tt>MAIL
FROM</tt>) another system.<br>
&lt;/quote&gt;<br>
</p>
<p>organization has an <code>v=spf1</code> policy in place. Mail is
outsourced to microsoft, which uses sender ID.</p>
<p>It's the receiving server which has to implement spf/sender-ID, so
delivery is erratic to say the least.<br>
</p>
<br>
<blockquote cite="mid:4FAD0956.3040705@borderworlds.dk" type="cite"><br>
When mlmmj send out mails to the list subscribers the envelope from
looks something like this: <br>
  <a class="moz-txt-link-abbreviated"
 href="mailto:listname+bounces-XXXX-recipient=example.com@listowner.tld">listname+bounces-XXXX-recipient=example.com@listowner.tld</a>
  <br>
</blockquote>
<br>
listowner.tld doesn't have an spf record. <br>
<br>
this is not the problem. problem is the "From" field/<br>
<br>
<blockquote cite="mid:4FAD0956.3040705@borderworlds.dk" type="cite"><br>
So the SPF checking is done against the domain that the list is running
on. <br>
  <br>
The correct cause of action would be to get the organization with
broken SPF checking to fix that. <br>
  <br>
</blockquote>
<br>
I (and others) have told them a few times to no avail.<br>
<br>
regards, Theo<br>
<br>
</body>
</html>

--------------010800070107050200000007--

