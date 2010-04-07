From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 07 Apr 2010 01:36:23 +0000
Subject: Re: ***SPAM*** [mlmmj] subonlypost + Access Control
Message-Id: <4BBBE197.4050402@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <FEF71DB1-28FB-4C06-BA85-D257FE8D35C9@sabahattin-gucukoglu.com>
In-Reply-To: <FEF71DB1-28FB-4C06-BA85-D257FE8D35C9@sabahattin-gucukoglu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

This is possible using a feature I recently implemented and which I believe has 
been accepted, so it just needs to be committed to CVS and should be included in 
the next release.

Or you can apply the patch yourself. See here:

http://mlmmj.org/archive/mlmmj/2010-02/1653.html

Ben.



On 7/04/10 11:08 AM, Sabahattin Gucukoglu wrote:
> Hi all,
>
> The problem: I want to run a list where subscribers can communicate between each other but where non-subscribers can't get in.  This is fine, subonlypost.
>
> But the list is actually a reflector for messages received by netnews.  Oops!  I can't set subonlypost now.  Even if I add a secret header to the gateway script stripped by delheaders and allowed by access control, I cannot arrange it so that the authenticated netnews postings make it while only non-subscribers can post.
>
> Have I missed anything at all?  If not, a feature request: access control should add another action, "Really-Allow", which does exactly that, no further progress through subonlypost/other testing just straight allowed.
>
> Cheers,
> Sabahattin




