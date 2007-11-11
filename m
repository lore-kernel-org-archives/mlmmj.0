From: Neale Pickett <neale@woozle.org>
Date: Sun, 11 Nov 2007 16:43:12 +0000
Subject: Re: Autoresponders vs. reply-to list
Message-Id: <w53wssoag2n.fsf@fozzie.woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
In-Reply-To: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen <mmj@mmj.dk> writes:

> On 08/11/2007, at 15.26, Marcelo wrote:
>
>> Short version: it causes trouble, but some users want it.  No mailing
>> list software should use it by default.
>
> Of course not, and we would never do that. We don't even have a specific
> setting for it in mlmmj, you have to insert the complete  header in
> 'addheaders'.

I hereby withdraw my proposal to add a blurb to TUNABLES about Reply-To.
MLMMJ doesn't need to take a stance on munging Reply-To: any more than
it needs to take a stance on munging From: or Message-Id:.

I propose instead the changing the "customheaders" TUNABLES entry:

    These headers are added to every mail coming through.  Please do
    your research before fiddling with headers (such as Reply-To) that
    don't begin with "List-".

I promise to field all questions to the list about what research needs
to be done.

Neale
