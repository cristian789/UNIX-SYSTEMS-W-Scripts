/**************************************************************************
* Pgm copies a file passed in on command line to a file called copy.txt
* Usage is ./filecopy file
* Ex:  ./filcopy /home/hopper/t90jfl1/j7.txt
*************************************************************************/
#include <iostream>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string>

using namespace std;

int main(int argc, char * argv[])
{
	const int BUFFER_SIZE = 17;	//The max size to read at one time.
								//data file has 16 char plus \n
	int returnCode;			//Holds the return code from stat to check for errors
	int fdInFile;			//FD for file to copy
	int numberRead;			//# of bytes to read from file

	char fileDataBuff[BUFFER_SIZE];	//A buffer to hold the char read in
	char  *fileName_ptr;		//Will point to cstring filename

	struct stat fileInfoStruct;      //declare a struct which is datatype of stat
									// will be filled later 
	int status;


/**********************errors**********************************/

								//Check command line arguments
	if (argc != 3)
	{
		cerr << "Usage: invalid number of arguments on command line " << argv[0] << endl;
		exit(EXIT_FAILURE);
	}


	fileName_ptr = argv[1];		//copy pointer in argv1 to fileName_ptr
	
	returnCode = stat(fileName_ptr, &fileInfoStruct);
	if (returnCode < 0)
	{
		perror("Usage: file does not exist, exiting program");
		exit(EXIT_FAILURE);
	}


	if (fdInFile == -1)            //check for -1
	{
		//perror will add on a system diagnostic message to your mess
		perror("Error on open of input file ");

		exit(EXIT_FAILURE);
	}

	if ((fileInfoStruct.st_mode & 777) != 0)       //if a flag is not zero, it has permissions
	{ 
		//perror will add on a system diagnostic message to your mess
		perror("Error, permission exist on file you entered and now exiting pgm \n");

		exit(EXIT_FAILURE);
	}



/******************************good values***********************************/


		cout << "\nYour file does exist with zero permissions, permissions changed to access"<<endl;




		status = chmod("myfile.txt", 0200);  //filename, perm to set it to 200




//	cout << endl << endl << " Before opening  " << fileName_ptr << " to copy.txt" << endl << endl;
	//Open the input file for read only, get back a fd number.
	//int open(const char *path, int oflag)
	open("myfile.txt", O_WRONLY | O_APPEND | O_CREAT, 0700);

cout<< "Opened file for append"<< endl;



	int fdCopyFile = open("myfile.txt", O_WRONLY | O_APPEND | O_CREAT, 0700);
	//O_trunc)
	//default is trunc, be careful if file exists

	if (fdCopyFile == -1)
	{
		perror("error on opening file that you want to create");
		cout << fdCopyFile << endl;
		exit(EXIT_FAILURE);
	}
cout<<"Appended command line string and to the file"<<endl;



/*
 write("myfile.txt",argv[2],6);

/*
if (rc = 0)
{
	perror("rc = 0 error on write");
	exit(EXIT_FAILURE);
}
*/
cout << "Closed file and reset permissions to 000 " << endl<<endl;




//cout<<argv[2]<<endl;
	status = chmod("myfile.txt", 0000);  //filename, perm to set it to 200

	return 0;
}
