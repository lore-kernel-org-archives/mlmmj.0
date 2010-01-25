From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 25 Jan 2010 13:40:45 +0000
Subject: Re: PATCH: Not me too
Message-Id: <4B5D9F5D.6070809@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4B5D78F3.30600@yahoo.com.au>
In-Reply-To: <4B5D78F3.30600@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thanks again for the offer of help, Franky. No worries that you didn't get around 
to the earlier patch; what you wrote in your email was a pretty good start and 
quite detailed, so helpful.

I think I've cracked the moderation thing! Wrote about it in another email.

Extra hands testing are always appreciated, especially because I have a pretty 
limited selection of list options in use myself.

Ben.



On 25/01/10 10:49 PM, Franky Van Liedekerke wrote:
> Well, since I promised a patch but didn't get around doing it, I feel so
> guilty that I will test your patch as well, maybe I can help to figure
> out where the moderated problem thingie is.
>
> Franky
>
> On Mon, Jan 25, 2010 at 12:08 PM, Ben Schmidt
> <mail_ben_schmidt@yahoo.com.au <mailto:mail_ben_schmidt@yahoo.com.au>>
> wrote:
>
>     That bit about testing being successful...might need to change
>     that... It doesn't work for moderated mail; my test of that just got
>     clogged somewhere in the Internet and didn't arrive for a while!
>
>     Still feel free to offer any comments about the patch, or
>     suggestions regarding implementing this for moderated mail, but also
>     feel free to disregard it until I come back with something a bit
>     more functional.
>
>     Cheers,
>
>     Ben.
>
>
>
>
>     On 25/01/10 9:56 PM, Ben Schmidt wrote:
>
>         The attached patch adds a 'not me too' feature to mlmmj, where post
>         senders are excluded from the post distribution so people don't get
>         copies of their own mail. A number of people, particularly those who
>         aren't familiar with traditional email mailing lists, prefer
>         this. It
>         applies on top of the tunables patch I emailed earlier (which I
>         neglected to mention applies over 1.2.17).
>
>         Some info and design decisions:
>
>         I decided a simple boolean tunable would suffice for this, at
>         least in
>         the short term, and quite probably long term, too. For now,
>         people who
>         really want confirmation their mail has arrived on the list can
>         always
>         subscribe a nomail email to post from. I will devote my mind to
>         how this
>         could neatly be extended later if it seems warranted.
>
>         Thanks to Franky for getting me started on this. The from address in
>         those low level sending functions is the envelope sender, so
>         based on
>         the list address, not the sender of the mail, though. The sender
>         of the
>         mail is parsed with the other mail headers in mlmmj-process.
>         This means
>         I needed to communicate that information from mlmmj-process to
>         mlmmj-send. Commandline paramaters seemed the way most
>         consistent with
>         the rest of the program, so I added an option.
>
>         I also had to decide whether the tunable should be tested in
>         mlmmj-process or mlmmj-send. I opted for mlmmj-process, as
>         that's where
>         most decisions about whether and where to send mail are made,
>         and as a
>         general rule it's best if commandline arguments can override
>         tunables
>         rather than be affected by them. Thus I added an '-o' option to
>         omit a
>         specified address. The alternative is making the option specify an
>         originator address, and testing the tunable in mlmmj-send to see
>         whether
>         or not to omit them from the distribution.
>
>         I decided to do an extra pass through the recipients list in
>         main() to
>         do the filtering rather than modify the lower level functions,
>         as the
>         functions are used in numerous locations, but this filtering is only
>         required once, so an interface change doesn't seem warranted, and
>         iterating the recipients shouldn't be too slow, even for large
>         lists.
>
>         Comments? Questions?
>
>         I have tested it and it works fine for me.
>
>         Could this be included in mlmmj?
>
>         The patch includes updating the php and perl web admin interfaces'
>         tunables.pl <http://tunables.pl> file. Should I be CCing people
>         of that code specifically?
>
>         Cheers,
>
>         Ben.
>
>
>
>
>
>
>
>


