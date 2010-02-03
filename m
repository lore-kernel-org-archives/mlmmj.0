From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 03 Feb 2010 01:41:37 +0000
Subject: Re: Proposal for richer list text
Message-Id: <4B68D451.4030803@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4B5EE8BD.2050205@yahoo.com.au>
In-Reply-To: <4B5EE8BD.2050205@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 3/02/10 9:36 AM, Robin H. Johnson wrote:
> On Wed, Jan 27, 2010 at 12:06:05AM +1100, Ben Schmidt wrote:
>> I'm wondering if this sounds acceptable. I'll go ahead and have a
>> shot implementing it, if so.
>>
>> I'm thinking of extending the listtext/prepstdreply mechanism to,
>> rather than just expect and include a subject header, to allow other
>> headers at the top of listtexts, that would/could replace the
>> default headers, and to allow greater amounts of the original mail
>> to be included, and random and subject substitutions.
>>
>> The first part would involve representing the default headers (To,
>> From, Reply-To, MIME-Version, Content-Type, etc.) in a
>> list/structure, then parsing each header line of the listtext,
>> removing existing headers from the structure if they match the new
>> one, and then adding the new one. Then the structure would be
>> reduced to a single string and output.
> Heavily in favour of supporting custom headers in listtexts.
>
> I just found out the hard way that subconf mails do NOT have any of the
> customheaders on them, and thus ended up getting us in a blacklist for a
> while.
>
> Can we get that first part implemented ASAP? One thing I am concerned
> about with it, is the ability to append vs. replace headers.
>
> For the moment, I say we just append, not replace.

Replacement is necessary to be able to change the content type which is
one of my main goals.

I can see it could be a problem if wanting to add multiple headers of
one kind, though.

How about it removes an mlmmj default header if it finds one, but
ensures it never replaces headers in the listtext with each other, i.e.
all the headers in the listtext will definitely end up in the mail?

For reference, the default headers mlmmj generates are:

From: for moderation emails, list+owner@...
To: for moderation emails, list-moderators@...
Reply-To: for moderation emails, list+moderate-blahblahblah@...
Date: ...
Message-ID: ...
Subject: from listtext
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Encoding: 8bit

Actually, this last one is a bug...that should be
'Content-Transfer-Encoding:'; there is no such MIME header as
'Content-Encoding:'. The same bug is there when digests are constructed.
That bugfix will be included in the patch when I've made it. As well as
another one I just spotted where the listtext file isn't closed if
digests don't have a thread summary.

At any rate, these are the only headers that mlmmj adds, so the only
candidates for replacement, and I can imagine it being useful to be able
to replace all of them except 'Date', 'Message-ID' and possibly
'Reply-To'. Simply appending wouldn't work, particularly for what I want
to achieve.

Does this slight modification sound OK to you?

Ben.





