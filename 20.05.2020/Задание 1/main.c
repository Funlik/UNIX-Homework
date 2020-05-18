#include <stdio.h>
#include <spawn.h>

int main(int argc, const char * argv[])
{
	extern char **environ;
	pid_t pid;
	char *args[] = {
	    "/usr/bin/wget",
	    "https://www.w3.org/TR/PNG/iso_8859-1.txt",
	    "-O",
	    "/var/mobile/test.txt",
	    NULL
	};
	
	posix_spawn(&pid, argv[0], NULL, NULL, args, environ);
	return 0;
}
