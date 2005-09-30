From: Neale Pickett <neale@woozle.org>
Date: Fri, 30 Sep 2005 17:36:37 +0000
Subject: Re: silently discarded post
Message-Id: <200509301136.37982.neale@woozle.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_leXPDoOHPRZWQtV"
List-Id: <mlmmj.mlmmj.org>
References: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
In-Reply-To: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
To: mlmmj@mlmmj.org

--Boundary-00=_leXPDoOHPRZWQtV
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 30 September 2005 09:36 am, Neale Pickett wrote:
> This is perfectly valid according to both RFC 822 and RFC 2822, and parsing
> this as two addresses is an error.  I'll work on a patch to correctly parse
> it, but I can't promise anything right away.

Perhaps the following will be of some assistance.  I ripped the code from 
BSD's "mail" program.

Neale

--Boundary-00=_leXPDoOHPRZWQtV
Content-Type: text/x-csrc;
  charset="iso-8859-1";
  name="foo.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="foo.c"

/* Some crap from BSD mail to parse email addresses */

/*
 * Copyright (c) 1980, 1993
 *      The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *      This product includes software developed by the University of
 *      California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
char *skin(char *);

/*
 * Start of a "comment".
 * Ignore it.
 */
char *
skip_comment(cp)
        char *cp;
{
        int nesting = 1;

        for (; nesting > 0 && *cp; cp++) {
                switch (*cp) {
                case '\\':
                        if (cp[1])
                                cp++;
                        break;
                case '(':
                        nesting++;
                        break;
                case ')':
                        nesting--;
                        break;
                }
        }
        return (cp);
}

/*
 * Skin an arpa net address according to the RFC 822 interpretation
 * of "host-phrase."
 */
char *
skin(name)
        char *name;
{
        char *nbuf, *bufend, *cp, *cp2;
        int c, gotlt, lastsp;

        if (name == NULL)
                return (NULL);
        if (strchr(name, '(') == NULL && strchr(name, '<') == NULL
            && strchr(name, ' ') == NULL)
                return (name);

        /* We assume that length(input) <= length(output) */
        if ((nbuf = malloc(strlen(name) + 1)) == NULL)
                err(1, "Out of memory");
        gotlt = 0;
        lastsp = 0;
        bufend = nbuf;
        for (cp = name, cp2 = bufend; (c = *cp++) != '\0'; ) {
                switch (c) {
                case '(':
                        cp = skip_comment(cp);
                        lastsp = 0;
                        break;

                case '"':
                        /*
                         * Start of a "quoted-string".
                         * Copy it in its entirety.
                         */
                        while ((c = *cp) != '\0') {
                                cp++;
                                if (c == '"')
                                        break;
                                if (c != '\\')
                                        *cp2++ = c;
                                else if ((c = *cp) != '\0') {
                                        *cp2++ = c;
                                        cp++;
                                }
                        }
                        lastsp = 0;
                        break;

                case ' ':
                        if (cp[0] == 'a' && cp[1] == 't' && cp[2] == ' ')
                                cp += 3, *cp2++ = '@';
                        else
                        if (cp[0] == '@' && cp[1] == ' ')
                                cp += 2, *cp2++ = '@';
                        else
                                lastsp = 1;
                        break;

                case '<':
                        cp2 = bufend;
                        gotlt++;
                        lastsp = 0;
                        break;

                case '>':
                        if (gotlt) {
                                gotlt = 0;
                                while ((c = *cp) != '\0' && c != ',') {
                                        cp++;
                                        if (c == '(')
                                                cp = skip_comment(cp);
                                        else if (c == '"')
                                                while ((c = *cp) != '\0') {
                                                        cp++;
                                                        if (c == '"')
                                                                break;
                                                        if (c == '\\' && *cp != '\0')
                                                                cp++;
                                                }
                                }
                                lastsp = 0;
                                break;
                        }
                        /* FALLTHROUGH */

                default:
                        if (lastsp) {
                                lastsp = 0;
                                *cp2++ = ' ';
                        }
                        *cp2++ = c;
                        if (c == ',' && *cp == ' ' && !gotlt) {
                                *cp2++ = ' ';
                                while (*++cp == ' ')
                                        ;
                                lastsp = 0;
                                bufend = cp2;
                        }
                }
        }
        *cp2 = '\0';

        if ((cp = realloc(nbuf, strlen(nbuf) + 1)) != NULL)
                nbuf = cp;
        return (nbuf);
}

/* This part was written by Neale Pickett <neale@woozle.org>.
 *
 * I guess I'll release it for distribution under the same terms as BSD
 * mail.
 */
#ifndef GOOB
void
tryit(char *str)
{
  char *foo;

  printf("Trying \"%s\"...\t", str);
  foo = skin(str);
  if (0 != strcmp(foo, "neale@woozle.org")) {
    printf("returned %s.  No good.\n",
           foo);
    exit(1);
  } else {
    printf("Bitchen.\n");
  }
  free(foo);
}

int
main()
{
  char *foo;

  tryit("neale@woozle.org");

  tryit("Neale Pickett <neale@woozle.org>");
  tryit("\"Neale Pickett\" <neale@woozle.org>");
  tryit("\"Neale Pickett@woozle\" <neale@woozle.org>");

  tryit("neale@woozle.org (Neale Pickett)");
  tryit("neale@woozle.org (Neale \"Crashmaster\" Pickett)");
  tryit("neale@woozle.org (Neale Pickett@woozle)");

  tryit("neale(I am such a badass)@woozle.org");
  tryit("neale(\"The Man\")@woozle(not heffalump).org (Neale Pickett@woozle)");

  printf("Everything worked.  Congratulations.\n");

  return 0;
}
#endif

--Boundary-00=_leXPDoOHPRZWQtV--
