From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 07 Dec 2006 11:49:02 +0000
Subject: Re: String full names with subscribers addresses
Message-Id: <20061207114902.GD28318@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4577FD87.2040306@den-ouden.info>
In-Reply-To: <4577FD87.2040306@den-ouden.info>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Raymond den Ouden <raymond@den-ouden.info> [Dec 07. 2006 12:39]:
> Maybe this is a newbie question but I couldn't find anything on this
> subject.
> 
> Since I use mlmmj for maintaining lists for a sports club only e-mail
> addresses isn't very useful for me.
> 
> People can't subscribe since they are closed lists and people don't even
> know how to unsubscribe sinse I removed all the help messages, due to
> the fact they don't need to see it. And besides that I can't rely on
> them to unsubscribe. For example if someone leaves the board they
> shoulnd't recieve mails directed to the board.
> 
> Now I have to maintain 2 lists, 1 with the names and addresses and the
> list itself.
> 
> Is there a way to store the names with the addresses within the list?
> If not are there plans to  do so or is it something that doesn't fit in
> the design or ideas of the developers?

This is not possible right now, you would need to store that outside
mlmmj.

What you could do however, is just maintain one list, and with a script
dump the addresses into subscribers.d/ directory.

It doesn't matter what files are called, and how many of them there are
in subscribers.d/. Any file with emailaddresses will be considered a
subscribers file. And since you don't let people subscribe manually, you
control it.

 $ extract-addresses.pl my-names.txt > LISTDIR/subscribers.d/mysubs

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
