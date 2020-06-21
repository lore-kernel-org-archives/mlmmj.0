From: webmaster <webmaster@vlsc.org>
Date: Sun, 21 Jun 2020 06:18:45 +0000
Subject: Re: [mlmmj] Trying to use moderation, but email server is rejecting moderator's release reply to lis
Message-Id: <fdbc9fe4-3682-0b82-d333-9e69c445256f@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------534A5176DC0F8DF01238F030"
List-Id: <mlmmj.mlmmj.org>
References: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
In-Reply-To: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------534A5176DC0F8DF01238F030
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

A pithy answer may be amusing, but it doesn't provide much to go on.

The moderation notice email contains:

To release it to the list, please send a message to
<list_release-59d6019902a42d96@vlsc.org> which can usually be done simply
by replying to this message.


Replying to that email didn't work, so I'm simply looking for a bit of
advice for where to start. 

For some time I've exploited the mlmmj system by writing my own code to
help manage the tunables as well as the the other text files, which I
know well, but up to now I've been managing relatively small lists that
never needed moderation. So now I'm back at the beginning, looking for
some help...not riddles.

Philip


On 6/20/2020 2:38 PM, Matrix Quote wrote:
> On Sat, Jun 20, 2020 at 02:10:55PM -0700, webmaster wrote:
>> I've been using MLMMJ for years with several closed lists, and it works
>> great! Can't say enough good things about it.
>>
>> Now I have finally reached a place where I need moderation on a list, so
>> I implemented the two files [list]/control/moderated and
>> [list]/control/moderators.
>>
>> Tested some email submissions, and as expected they were sent to the
>> moderators for release or rejection...So far so good...
>>
>> But when I reply to the moderation notice to release the original email
>> to the list, it's sent back to a pseudo-email address (the reply-to
>> address) like:
>>
>> [list name]_release-59d6019902a42d96@vlsc.org
>>
>> (list name obviscated above)
>>
>> Our email server doesn't recognize this as a real email account so it's
>> bouncing back my "release" response with the usual "Unknown user"
>> bounce-back.
>>
>> I tried reply-all, which also included the [list]-owner@vlsc.org
>> address, and the email server still bounced the reply.
>>
>> I've re-read the docs but can't find anything pointing to additional
>> steps needed to get the moderation-release replies to get past my email
>> server's filtering of non-existent addresses.  I doubt I'm supposed to
>> simply add these address accounts to the email server, not least because
>> there's no nothing to that effect in the documentation.
>>
>> How is this email-reply moderation process supposed to work when sending
>> pseudo-addresses to my email server, which is correctly rejecting such
>> incoming mail as directed to a non-existing account?
>
> Neo:  Why do my eyes hurt?
> Morpheus:  You never used them before.
>
>
>


--------------534A5176DC0F8DF01238F030
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Helvetica, Arial, sans-serif">A pithy answer may be
      amusing, but it doesn't provide much to go on.<br>
      <br>
      The moderation notice email contains:<br>
    </font><br>
    <pre class="moz-quote-pre" wrap="">To release it to the list, please send a message to
<a class="moz-txt-link-rfc2396E" href="mailto:board_release-59d6019902a42d96@vlsc.org">&lt;list_release-59d6019902a42d96@vlsc.org&gt;</a> which can usually be done simply
by replying to this message.


</pre>
    <font face="Helvetica, Arial, sans-serif">Replying to that email
      didn't work, so I'm simply looking for a bit of advice for where
      to start.  <br>
      <br>
      For some time I've exploited the mlmmj system by writing my own
      code to help manage the tunables as well as the the other text
      files, which I know well, but up to now I've been managing
      relatively small lists that never needed moderation. So now I'm
      back at the beginning, looking for some help...not riddles.<br>
      <br>
      Philip<br>
    </font><br>
    <br>
    <div class="moz-cite-prefix">On 6/20/2020 2:38 PM, Matrix Quote
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200620213845.ewfneemvblmjclk4@gpm.stappers.nl">
      <pre class="moz-quote-pre" wrap="">On Sat, Jun 20, 2020 at 02:10:55PM -0700, webmaster wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I've been using MLMMJ for years with several closed lists, and it works
great! Can't say enough good things about it.

Now I have finally reached a place where I need moderation on a list, so
I implemented the two files [list]/control/moderated and
[list]/control/moderators.

Tested some email submissions, and as expected they were sent to the
moderators for release or rejection...So far so good...

But when I reply to the moderation notice to release the original email
to the list, it's sent back to a pseudo-email address (the reply-to
address) like:

[list <a class="moz-txt-link-abbreviated" href="mailto:name]_release-59d6019902a42d96@vlsc.org">name]_release-59d6019902a42d96@vlsc.org</a>

(list name obviscated above)

Our email server doesn't recognize this as a real email account so it's
bouncing back my "release" response with the usual "Unknown user"
bounce-back.

I tried reply-all, which also included the [<a class="moz-txt-link-abbreviated" href="mailto:list]-owner@vlsc.org">list]-owner@vlsc.org</a>
address, and the email server still bounced the reply.

I've re-read the docs but can't find anything pointing to additional
steps needed to get the moderation-release replies to get past my email
server's filtering of non-existent addresses.  I doubt I'm supposed to
simply add these address accounts to the email server, not least because
there's no nothing to that effect in the documentation.

How is this email-reply moderation process supposed to work when sending
pseudo-addresses to my email server, which is correctly rejecting such
incoming mail as directed to a non-existing account?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Neo:  Why do my eyes hurt?
Morpheus:  You never used them before.



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------534A5176DC0F8DF01238F030--

