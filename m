From: Geert Stappers <stappers@stappers.nl>
Date: Sat, 03 Jun 2017 14:23:34 +0000
Subject: [mlmmj] mlmmj-chown
Message-Id: <20170603142334.GE32244@gpm.stappers.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="bc2iwAtkAaXP8cWF"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--bc2iwAtkAaXP8cWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Summary: making possible that user can do
  chown -R mlmmj $MLMMJ_TOPDIR


Hello,

Those who want and did

  chown -R mlmmj /var/spool/mlmmj/teamfoo

will have seen

  chown: changing ownership of '/var/spool/mlmmj/teamfoo/index': Operation not permitted
  chown: changing ownership of '/var/spool/mlmmj/teamfoo/requeue': Operation not permitted
  chown: changing ownership of '/var/spool/mlmmj/teamfoo/moderation': Operation not permitted
  chown: changing ownership of '/var/spool/mlmmj/teamfoo/mlmmj-maintd.lastrun.log': Operation not permitted

and are tempted to do

  sudo chown -R mlmmj /var/spool/mlmmj/teamfoo

But `sudo` is not allowed for all users and surely not wanted
for webusers  ( the operating system user that runs the webserver process )

And sudo privilege is overkill for only the CAP_CHOWN capability is needed.

However setting CAP_CHOWN on a script has no effect, a binary is neeed.

Find attached the source for such binary.



Groeten
Geert Stappers
-- 
Leven en laten leven

--bc2iwAtkAaXP8cWF
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-chown.c"

/*
 *
 *  mlmmj-chown  /abso/lute/path/to/mlmmj/list
 *
 *  programm for non-root to change ownership to mlmmj user
 *
 *
 *  to build do
 *    gcc -o mlmmj-chown -D MLMMJ_USER=\"mlmmj\" mlmmj-chown.c
 *
 *  you have to do
 *    sudo /sbin/setcap cap_chown+ep ./mlmmj-chown
 *  before using
 *
 *  (C) 2017  Geert Stappers <stappers@stappers.it>
 *  Same license as mlmmj,
 *  it is okay to use this programm outside the mlmmj project
 *
 */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <pwd.h>

#ifndef MLMMJ_USER
#define MLMMJ_USER "mlmmj"
#endif

/* Global variables */
int verbose ;
uid_t uid ;

static void chownR( const char *fname ) ;

int main(int argc, char *argv[])
{
	int opt ;

	struct passwd *pwd;

	verbose = 0 ;

	while ((opt = getopt(argc, argv, "v")) != -1) {
		switch (opt) {
		case 'v':
			verbose = 1;
			break;
		default:
			fprintf(stderr, "Usage: %s [-v] /p/a/t/h\n",
				argv[0]);
			exit(EXIT_FAILURE);
		}
	}
	if (verbose) printf("Verbose flag is set.\n");

	if ( optind >= argc ) {
		fprintf(stderr, "Missing /p/a/t/h\n");
		exit(EXIT_FAILURE);
	}
	if (verbose) printf("Path argument '%s'\n", argv[optind]);

	/* Wish:
	 * tests on valid user input for the path to mlmmj listdir
	 */

	pwd = getpwnam(MLMMJ_USER);
	if (pwd == NULL) {
		fprintf(stderr,
			"No user '%s' in getent passwd.\n", MLMMJ_USER);
		exit(EXIT_FAILURE);
	}
	uid = pwd->pw_uid;
	if (verbose) printf("User ID of '%s' is %d.\n", MLMMJ_USER, uid);

	/* Start change owner */
	if (chown(argv[optind], uid, -1) == -1) {
		perror("chown");
		fprintf(stderr, "for %s\n", argv[optind] );
		exit(EXIT_FAILURE);
	}
	/* and continue recursive */
	chownR(argv[optind]);
	if (verbose) printf("Done.\n");

	exit(EXIT_SUCCESS);
}

void chownR( const char *fname )
{
	DIR *dir;
	struct dirent *entry;

	if (!(dir = opendir(fname)))
		return;
	if (!(entry = readdir(dir)))
		return;
	do {
		char path[1024];
		int len = snprintf(path, sizeof(path)-1,
				"%s/%s", fname, entry->d_name);
		path[len] = 0;
		if (entry->d_type == DT_DIR) {
			if (strcmp(entry->d_name, ".") == 0
					|| strcmp(entry->d_name, "..") == 0)
				continue;
			if (verbose) printf("d %s\n", path);
			if (chown(path, uid, -1) == -1) {
				perror("chown");
				fprintf(stderr, "on directory %s\n", path );
			}
			chownR(path);
		}
		else {
			if (verbose) printf("f %s\n", path);
			if (chown(path, uid, -1) == -1) {
				perror("chown");
				fprintf(stderr, "on file %s\n", path );
			}
		}
	} while (entry = readdir(dir));
	closedir(dir);
}

/* l l */

--bc2iwAtkAaXP8cWF--

