From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Sat, 04 Mar 2023 16:44:20 +0000
Subject: Re: [mlmmj] make check fail for 1.4.0.a2
Message-Id: <f85e3bcc-440e-617e-b8c5-10daf5a6bf98@telenet.be>
List-Id: <mlmmj.mlmmj.org>
References: <3a21b675-1ae7-71e8-1338-ccc2666e9f5d@andreasschulze.de>
In-Reply-To: <3a21b675-1ae7-71e8-1338-ccc2666e9f5d@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

On 5 checks, I get:

      failed: atf-c/utils.c:81: Cannot open atf_utils_fork_out.txt

I'm not really at home in atf-c, and google is not much of a help here 
as well :-)

Now, next to that, during compilation I got some (5) warnings (some 
might need to be addressed (certainly the one in mlmmj-sub.c):

mygetline.c: In function ‘mygetuntil’:
mygetline.c:43:24: warning: comparison of unsigned expression in ‘< 0’ 
is always false [-Wtype-limits]
    43 |                 if(res < 0) {
       |                        ^


listcontrol.c: In function ‘listcontrol’:
listcontrol.c:312:29: warning: this statement may fall through 
[-Wimplicit-fallthrough=]
   312 |                 subtypename = "digest";
       |                 ~~~~~~~~~~~~^~~~~~~~~~
listcontrol.c:315:9: note: here
   315 |         case CTRL_CONFSUB_NOMAIL:
       |         ^~~~
listcontrol.c:316:20: warning: this statement may fall through 
[-Wimplicit-fallthrough=]
   316 |                 if (subtype = NULL) {
       |                    ^
listcontrol.c:322:9: note: here
   322 |         case CTRL_CONFSUB_BOTH:
       |         ^~~~


mlmmj-process.c: In function ‘main’:
mlmmj-process.c:914:45: warning: ‘txt’ may be used uninitialized 
[-Wmaybe-uninitialized]
   914 |                             queuefilename = prepstdreply(txt, &ml,
       | ^~~~~~~~~~~~~~~~~~~~~~
   915 |                                     "$listowner$", testaddr, NULL);
       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mlmmj-process.c:387:15: note: ‘txt’ was declared here
   387 |         text *txt;
       |               ^~~


mlmmj-sub.c: In function ‘main’:
mlmmj-sub.c:441:62: warning: ‘%s’ directive argument is null 
[-Wformat-overflow=]
   441 |                         printf("Changing to uid %d, owner of 
%s.\n",
| ^~


In function ‘resend_queue’,
     inlined from ‘do_maintenance’ at mlmmj-maintd.c:693:7:
mlmmj-maintd.c:250:25: warning: ‘mailname’ may be used uninitialized 
[-Wmaybe-uninitialized]
   250 |                         unlink(mailname);
       |                         ^~~~~~~~~~~~~~~~
mlmmj-maintd.c: In function ‘do_maintenance’:
mlmmj-maintd.c:153:15: note: ‘mailname’ was declared here
   153 |         char *mailname, *fromname, *toname, *reptoname, *from, 
*to, *repto;
       |               ^~~~~~~~

Franky


On 3/4/23 16:45, A. Schulze wrote:
>
>
> Am 27.02.23 um 09:29 schrieb Baptiste Daroussin:
>> On Sun, Feb 26, 2023 at 08:12:18PM +0100, A. Schulze wrote:
>>> mlmmj-bounce:basics_6  ->  failed: atf-check failed; see the output 
>>> of the test for details [0.069s]
>
>> I did just run the test suite on debian 11.6, ubuntu 20.04, alpine 
>> and archlinux
>> without problem (not using your docker script).
>
> Hello,
>
> just run with codeberg.org/mlmmj/mlmmj / master and using Debian 
> Bookworm (for newer tools)
> but still the same:
>
>
> mlmmj-bounce:basics_6  ->  failed: atf-check failed; see the output of 
> the test for details  [0.054s]
>
>
> how can I "see the output of the test for details"? Do you have 
> instruction for me to check this?
>
> Andreas
>
>

