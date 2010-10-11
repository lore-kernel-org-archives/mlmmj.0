From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 11 Oct 2010 23:31:15 +0000
Subject: [mlmmj] Auto wrapping in list texts
Message-Id: <4CB39E43.80406@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I myself have a feature request related to list texts!

I would like an auto-wrapping ability, so that $whatever$ substitutions can be 
made, including of post subject lines and so on, without the need to put the 
$whatever$ on a line of its own for fear that it might become too long. List texts 
could be made more compact and readable, then.

My suggested mechanism is to have a 'substitution' $wrapN$ that must appear first 
on a line, optionally after whitespace (like $originalmailN$). It would have 
effect until the next line in the listtext that is empty or only contains 
whitespace, and would wrap the text to N columns, prefixing each line with the 
indent that the $wrapN$ directive had. N would default to 72 if omitted. So you 
could do

$wrap$The subject line of the post was "$subject$".

Or indented:
     $wrap64$The subject line of the post was "$subject$".

Or first-line-only indent:
$wrap$    The subject line of the post was "$subject$".

Ben.




