#include <stdio.h>
#include <stdlib.h>


int main(int argc, const char * argv[])
{
    printf("Hello, World!\n");
    printf("Running on \n");
    #if __APPLE__
	#include <TargetConditionals.h>
    #endif
    #if __APPLE__ && (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    	printf ("iOS");
    #else
	    if (system("ver > NUL 2>&1")==0)
	    {
	        //Most likely we are on windows
	        system("ver");
	    }
	    else if (system("uname -a > NUL 2>&1")==0)
	    {
	        //Most likely we are on unix
	        system("uname -a");
	    }
	    else
	        printf("Unknown OS");
    #endif
    printf("\n");
    return 0;
}
