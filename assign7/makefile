#
# PROGRAM:    zp
# PROGRAMMER: your name
# LOGON ID:   your z-id
# DATE DUE:   due date of program
#

# Compiler variables
CCFLAGS = -ansi -Wall -std=c++11

# Rule to link object code files to create executable file
zp: zp.o
	g++ $(CCFLAGS) -o zp zp.o

# Rule to compile source code file to object code
zp.o: zp.cpp
	g++ $(CCFLAGS) -c zp.cpp

# Pseudo-target to remove object code and executable files
clean:
	-rm *.o zp
