From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 24 Mar 2014 01:52:12 +0000
Subject: Re: [mlmmj] Getting resent mail when subscribing to list
Message-Id: <532F8FCC.6000904@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
In-Reply-To: <B1DF0070-DAA5-4C05-9400-D32EDBBD9115@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 20/03/14 8:45 AM, Matti Nykyri wrote:
> On Mar 19, 2014, at 23:04, Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net> wrote:
>> On Wed, Mar 19, 2014 at 04:29:23PM -0400, Chris Knadle wrote:
>>> On Wednesday, March 19, 2014 13:02:15 Matti Nykyri wrote:
>>>> I recently installed mlmmj on my server. I would like to add an
>>>> option to tunables so that list could be configured to send old
>>>> posts when people subscribe to the list
>>> A more interesting option which could do the same thing would be
>>> to allow a subscriber of the list to be sent a particular /range/
>>> of list emails.
>>
>> The 'get-range' option is more sensible. It would be rather annoying
>> (for me at least) to get a bunch of emails just after subscribing
>> to a list.  Besides, sending such bursts will not only load both the
>> list server and the new subscriber's server - it potentialy can land
>> the list server on some blacklists.
>>
>> Better still, keep a nice web archive of the list and have the list
>> welcome message point to it.
>>
> The archive is the best, but still needs to be setup. Even more setup
> is needed if some privacy is required... Although mailing list will
> never be truly private due to design.

I agree with most of what has been said here.

I probably wouldn't accept a patch which automatically sends list posts
when a user subscribes.

However, implementation of a range with +get would probably be OK
(though it should probably have some restriction, perhaps a tunable
maximum number of messages that can be retrieved this way; and thought
should be given to whether to deliver such messages individually or as
one or more digests--probably the digest is better). I would also be
happy with changes that facilitate putting a link to specific +get
address and/or an online archive in the welcome mail, e.g. a $lastindex$
substitution.

Putting these ideas together, perhaps this kind of syntax works:

- retrieve messages 123 to 456:
   listname+get-123-456@lists.domain.tld

- retrieve 123 messages, ending with message 456:
   listname+get-456-123@lists.domain.tld

- retrieve most recent 123 messages:
   listname+get--123@lists.domain.tld

- retrieve 10 most recent messages (for list texts):
   $list+$get-$lastindex$-10@$domain$
   $list+$get--10@$domain$
   (note that the first one will give the last ten messages prior to the
   text being sent, such as subscription time, whereas the second one
   will give the last ten messages at the time the user sends mail +get,
   which might be a useful link to include in the help email)

Happy coding!

Ben.




