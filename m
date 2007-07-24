From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 24 Jul 2007 19:17:55 +0000
Subject: Re: question about tunable option
Message-Id: <20070724191755.GA2073@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070724205639.58a3afa6@franky>
In-Reply-To: <20070724205639.58a3afa6@franky>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Franky Van Liedekerke <liedekef@telenet.be> [Jul 24. 2007 20:57]:
> Hi,
> 
> one of the tunable options is "delheaders", which by default removes
> the headers "From " and "Return-Path:".
> And here is my question: why "From " and not "From:"? There is no
> "From " header in a mail, every header is followed by a colon ... so
> for now this doesn't do anything (please correct me if I'm wrong).

The tunable delheaders is for adding the headers you want to delete
apart from "From " and "Return-Path:", since they _have_ to be deleted
since they have to change now we send the mail on. Maybe you don't have
a "From " header in a single mail, but look in an mbox file.

So if you make a 'delheaders' file like this:

To:
Subject:

Then all To: and Subject: headers will be removed.

> While I'm at it, it would be nice to have a seperate option that
> replaces the "From:" header with the one from the list, or now I do
> this with the extra option "From:" in delheaders and
> "From:" and "Reply-to:" in customheaders.

Don't ever change From: to the listname. It's not the list that's
sending the mail--it's bad netiquette. Just strip Reply-To: and add a
Reply-To: header if you want such, but removing the From: really is very
bad style. You cannot see who's sending the mail.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
