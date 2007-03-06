From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 06 Mar 2007 22:23:03 +0000
Subject: Re: [PATCH] mimestrip / mimereject
Message-Id: <536874089d5a15052a06333a4c9eae27@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200702261335.13954.ssommer@suse.de>
In-Reply-To: <200702261335.13954.ssommer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Sascha,

Sascha Sommer <ssommer@suse.de> wrote:
>> If you move this code into a seperate program, I will be happy to
>> include it in the contrib/ directory of the mlmmj tarballs.
> 
> Some more thoughts about this:
> 
> When this mime stripping and analysis should be done in a seperate
> program that then calls either mlmmj-process or mlmmj-receive.

Call mlmmj-process if you are already running "in the background." Mail
servers (may) kill sub-processes, if they are running for too long. Or
call mlmmj-recieve [sic] to background the process.

> Could we have a commandline parameter for these mlmmj tools to reject
> mails?

If you have not backgrounded your process, you can do this by exit()ing
with something other than EXIT_SUCCESS. Just write your error message
to stdout (or stderr) and e.g. exit(EX_UNAVAILABLE) - then your MTA
will deliver the error message.

> Adding a header is not optimal because it would require to either keep
> the parsed mail in memory or to parse it again in order to add the
> header.

A bit ugly, but you could also

(echo 'X-NewHeader: blah'; cat $mailfile) |mlmmj-recieve

> It would also require to do 2 configuration changes to activate mime
> stripping:
> - activating the mime parser + its rules
> - setting the X-ThisMailContainsEvilMimeParts deny rules in the lists
> rules files
> The last step could be avoided if mlmmj had a commandline parameter to
> reject mails.

True, but you should be able to use the exit code trick, if it is only a
question about denying every mail with "bad" mime parts.

Adding a header and using the access control have the advantage that you
can mix it with other rules:

allow ^Subject: something
deny ^X-ThisMailContainsEvilMimeParts: yes
allow

> What do you think?

I am lazy and conservative :-)

I don't think we need to change anything in mlmmj to allow this to work,
but I may be wrong.

Happy hacking,
Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

