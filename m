From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Tue, 24 Jul 2007 18:56:39 +0000
Subject: question about tunable option
Message-Id: <20070724205639.58a3afa6@franky>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

one of the tunable options is "delheaders", which by default removes
the headers "From " and "Return-Path:".
And here is my question: why "From " and not "From:"? There is no
"From " header in a mail, every header is followed by a colon ... so
for now this doesn't do anything (please correct me if I'm wrong).

While I'm at it, it would be nice to have a seperate option that
replaces the "From:" header with the one from the list, or now I do
this with the extra option "From:" in delheaders and
"From:" and "Reply-to:" in customheaders.

Franky
