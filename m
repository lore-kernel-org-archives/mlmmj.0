From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 06 Oct 2010 08:03:31 +0000
Subject: Re: [mlmmj] List archive howto?
Message-Id: <4CAC2D53.9000704@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4C6B3882.6070904@gmail.com>
In-Reply-To: <4C6B3882.6070904@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I'm afraid you've completely lost me there, Robin, possibly because I
know basically nothing about mhonarc. The concepts sound great, though.

A question, though.... Is there anything specific and useful in your
stuff reply that I should be working into the documentation about
archive solutions? Or is this a complex solution, or not detailed
enough, and best left out and revealed if someone finds the other
solutions aren't adequate for them?

Cheers,

Ben.



On 4/10/10 8:37 AM, Robin H. Johnson wrote:
> On Tue, Aug 17, 2010 at 07:33:54PM -0600, Morgan Gangwere wrote:
>> Howdy y'all
>>
>> I'm kinda curious as to what is used for the archiving of the mailing list?
>>
>> I've got my own list set up and I'm pouring through the documentation
>> looking for what actually generates the html. Any help?
> For Gentoo, we use mhonarc, with some minor modifications.
>
> One of the key modifications was ultimately caused by the message
> numbering issue in threads.
>
> Specifically, what URL should exist if a message arrives out of sequence
> due to a delay. Some archive tools renumber the urls, others keep an
> index based on some part of the mail. Both of these caused some degree
> of problems for us, and we had to come up with an alternative.
>
> Specifically, when the message is being received, we add two headers:
> X-Archives-Salt: ${UUID}
> then we hash the entire message file, including the new header, and
> generate:
> X-Archives-Hash: ${SHA1}
>
> This gets used in the filename for the individual message files we
> write to disk:
> http://archives.gentoo.org/gentoo-scm/msg_c0f2f8f123f85bb8b664827b4a1dcb09.xml
> It's consistent regardless of how many times we have to rebuild a
> message archive.
>
> We've got nearly 588k messages in the archive, and now the next problem
> is starting to be the storage/access scalability of some of the larger
> lists. Also need to work on better parallelization for building archives
> for each list.
>
> Largest lists, by mails:
> 72808 gentoo-dev
> 97619 gentoo-user
> 283036 gentoo-commits
>
> Footnote:
> Yes, we generate XML, that's to integrate with our templating, but you
> could generate HTML even more easily.
>


