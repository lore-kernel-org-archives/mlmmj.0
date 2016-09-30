From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Fri, 30 Sep 2016 12:25:15 +0000
Subject: Re: [mlmmj] Notification sent to non-member for subscribers-only list
Message-Id: <20160930122515.GC7874@kibel.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <57ED7184.7060108@smartlabrador.ca>
In-Reply-To: <57ED7184.7060108@smartlabrador.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Sep 30, 2016 at 08:55:44AM -0230, Doug Robbins wrote:
> The most relevant file in $LISTDIR/text seemed to be 'subonlypost'.  I The
> wording of that file is similar but slightly different than the wording of
> the notification mail that is sent. Editing it had no effect on the
> notification message.
> 
> I've found that the notification mail is based on the file
> /usr/share/mlmmj/text.skel/en/deny-post. Editing that file, removing the
> original-post attachment, achieved what I wanted.

The 'subonlypost' is the old-style 'compatibility' name from an old version
of mlmmj. Normally 'deny-post' shall be used as it is looked up earlier.
Do you have that file in your $LISTDIR/text as well? It is kinda strange
that editing the /usr/share copy changed the mlmmj behaviour, unless your
$LISTDIR/text is effectively symlinked there somehow. The intention is
that the /usr/share files are copied over when a list is created so every
list has sensible defaults, but the list owner or an administrator can
tweak the texts for a particular list's needs.

Documentation doesn't tell anything about mlmmj looking in /usr/share
for the listtext files if they are not in $LISTDIR/text, but I haven't
looked at the code. Ben?

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

