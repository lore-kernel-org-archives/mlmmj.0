From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 06 Oct 2010 11:19:48 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <4CAC5B54.7040103@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 6/10/10 9:50 PM, Mads Martin J=F8rgensen wrote:
> On Wed, Oct 6, 2010 at 9:55 AM, Ben Schmidt
> <mail_ben_schmidt@yahoo.com.au>  wrote:
>>> I believe it does remove trailing whitespaces, but that's not a
>>> whitespace, that's a carriage return.
>>
>> I think that's a whitespace. Non-linear, but still whitespace.
>
> According to the ASCII definition:
>
> 13	0D	CR	Carriage return
>
> :-)

Well, yes, it is both.

According to my `man isspace':

      The isspace() function tests for the white-space characters.  For any
      locale, this includes the following standard characters:

      ``\t''   ``\n''    ``\v''    ``\f''    ``\r''    `` ''

:-)

The tab (\t) and space characters are linear whitespace (they appear in
a line just as other characters do), and the others are non-linear (they
break that rule somehow).

> It's from the old days of typewriters, where to start a new line
> in your text, you first have to do a newline, and then send the
> carriage back to the beginning of that line.

Indeed. Though in this case, \n is not newline, but linefeed,
semantically. Only on Unix, where \n represents both the carriage return
and the line feed, does it really mean newline. And, in fact, even that
meaning is not 100% right: it actually means EOL--end of line, for it is
used at the very end of a file to mark the end of the last line, even
though there is no new line after it. But we are often sloppy in our
terminology. :-)

I bought myself a typewriter recently. I have a friend who has one, too,
and it allows us to do instant messaging when we go away camping
together, just like when we are at home with our computers.

Smiles,

Ben.





