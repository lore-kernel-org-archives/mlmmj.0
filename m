From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 26 Jan 2010 13:06:05 +0000
Subject: Proposal for richer list text
Message-Id: <4B5EE8BD.2050205@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

I'm wondering if this sounds acceptable. I'll go ahead and have a shot 
implementing it, if so.

I'm thinking of extending the listtext/prepstdreply mechanism to, rather than just 
expect and include a subject header, to allow other headers at the top of 
listtexts, that would/could replace the default headers, and to allow greater 
amounts of the original mail to be included, and random and subject substitutions.

The first part would involve representing the default headers (To, From, Reply-To, 
MIME-Version, Content-Type, etc.) in a list/structure, then parsing each header 
line of the listtext, removing existing headers from the structure if they match 
the new one, and then adding the new one. Then the structure would be reduced to a 
single string and output.

The second part would involve moving the code for including original mail out of 
substitute_one() and into prepstdreply(). It would require the $originalmail$ 
substitution to appear alone on a line, or merely with preceding whitespace, to be 
recognised: this shouldn't be a problem as it is senseless to do anything else! 
The move of the code to prepstdreply() is so that instead of buffering the content 
of the mail in a string, it can be copied directly from the mailfile into the 
queuefile, which will be important for large mails. To specify how much of the 
mail to include, I suggest using $originalmailNNNNN$ where NNNNN is a number. The 
default, if the number were omitted, would be 100, so current behaviour would be 
unchanged, and to include the whole mail, a ridiculously large number could be 
given (1000000000 or something). Any whitespace preceding $originalmail$ would be 
prepended to each line of the mail also. The current single-space indent could be 
achieved with a single space, then, but that could be avoided, too.

The third part would require searching for Subject: lines in mails that arrive to 
mlmmj-process and then allowing $subject$ to be replaced by it in the listtext, as 
well as substitutions $randomN$ which would generate random strings like the 
cookies generate, and which could be reused by including the same number N.

The result of all this is that you could construct MIME mails for your listtexts, 
including properly randomised boundaries, and attach the original mail message to 
them in entirety rather than have a text dump of its initial lines. This could 
pave the way to more nice-looking listtexts (even HTML for those so inclined) and 
easier moderation with more meaningful subject lines including the subjects of the 
messages being moderated.

Does this seem like an OK extension, and a suitable way to implement it?

Ben.




