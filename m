From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Thu, 13 May 2010 17:26:26 +0000
Subject: [mlmmj] deletion of From-header
Message-Id: <20100513192626.4a9759e8@telenet.be>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

in the source code there's a line:

delheaders->strs[delheaders->count++] = mystrdup("From ");

effectively deleting a header called "From " in a mail, but this never
happens in reality (maybe it does with feeded mails via a program); the
header is always "From:".

For now this always forced me to add "From:" to the delheaders section,
but maybe this can be changed? Maybe just by removing it from the code
entirely (so people can choose wether or not to remove the
"From:"-information) ?

Just a thought ...

Franky

