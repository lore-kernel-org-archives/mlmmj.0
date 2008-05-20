From: Claudio Prono <claudio.prono@atpss.net>
Date: Tue, 20 May 2008 14:36:51 +0000
Subject: Strange problem with a moderated list
Message-Id: <4832E203.6090203@atpss.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello everyone,

Sorry for my poor english. I have recently installed mlmmj on my Suse 
Linux 10.3 and i have some big problem with the moderation of the list. 
The problem is this:

- I send a mail to the list
- The list is moderated so is requested to reply to a mail generated 
from mlmmj to confirm the mail will be mailed to all the others 
subscribed to the mailling list. But, when i recieve the mail that is 
the result:

Soggetto: moderazione necessaria per lista@dominio.it

Ciao,

qualcuno ha inoltrato un messaggio, che deve essere moderato, a:

lista@dominio.it

Per accettarlo, manda un messaggio a:

lista+moderate-1728ce6d4c03aea6@dominio.it

Il tuo client di posta elettronica probabilmente replica automaticamente
all'indirizzo di cui sopra, quando premi il pulsante "rispondi".
Se non vuoi che il messaggio venga inoltrato a tutti iscritti della lista,
semplicemente ignora questa mail.

I seguenti moderatori hanno ricevuto questa mail:

moderator@domain.it


--- sotto questa linea le prime 100 righe del messaggio inoltrato per la moderazione --->


The last line tells "below that line the first 100 lines of the message 
forwarded for the moderation" or something like that.
The problem is below the last line, no lines of the message will be 
printed... and i don't know why...

Maybe some problem with the permissions ?

The message in the dir /var/spool/mlmmj/lista/moderation have that 
permissions:

-rw-------  1 nobody nobody 1176 May 20 16:05 247966f21e3f8783

The mail system is postfix, and the user used is nobody.

Any Clue?

Thank u,

Claudio Prono.

-- 
------------
Claudio Prono
Systems Development @ Atpss.net Srl, Divisione Implementazione Sistemi
Via San Bernardino, 17 - 10137 Torino (TO) - IT
Tel +39-011.32.72.100  Fax +39-011.32.46.497
PGP Fingerprint: 75C2 4049 E23D 2FBF A65F  40DB EA5C 11AC C2B0 3647
Disclaimer: http://atpss.net/disclaimer
------------ 

