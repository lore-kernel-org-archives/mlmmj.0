From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 06 Mar 2011 15:32:09 +0000
Subject: Re: [mlmmj] Google Summer of Code
Message-Id: <4D73A8F9.3070405@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
In-Reply-To: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 03/06/2011 08:29 PM, Ben Schmidt wrote:
>    - Make a CGI binary (i.e. another small program written in C like the
>      rest of Mlmmj--small and slim) to allow archive browsing.

IMHO, using C for writing web interfaces is both counter-productive and
a security risk. BTW, what is the problem with things like mhonarc? I
think that generating static content is always better than (uselessly)
generating on-the-fly dynamic content.

>    - Refactor some code into clearer modules and extend the list access
>      module to support per-user options (delivery mode of normal, digest
>      or nomail, their real name, notmetoo, whether they're a moderator,
>      whether they're moderated, etc.). Possibly do this in a new module
>      that uses a database backend.

If we need a db, *please* make it possible to choose the back-end (like
for example: sqlite, postgres or MySQL).

Thomas

