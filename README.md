## Universal makefile

This is makefile I use for most of my C++ projects. It can be easily set up and modified.

### How to use

Don't touch 'Makefile' file, only modify 'Make.make' (gosh, it's terrible name, got to think of different one).

In 'Make.make' edit:

**PROJECT_NAME** to name of your project, let's say 'Space Invaders', the 'Makefile' will automatically make macro for it in code

**SOURCE_DIR** to where all the .c or .cpp files are located

**INCLUDE_DIR** to where all the .h files are located, assign SOURCE_DIR if you doesn't have specific 'include' folder

**FILES_SUB_DIRS** if there are some other subdirectories in 'SOURCE_DIR', bear in mind that the directory tree in 'INCLUDE_DIR' and 'SOURCE_DIR' must be the same.

**LIBS** to what libs you want to include, for example `-lGL`

**LIB_DIRS** is where to look for these libs, for example, if you have 'lib' folder with all the .so or .dll files, point there

**INCLUDE**: all the libs need their .h files, this is where to look for them

**FILES** other files that will need compilation, but doesn't have .h (header) file, usually 'main.cpp'


### Desired Project Structure

Makefile kinda expect usage of standard project structure, that said:

libs/ = Where all the libraries go
src/ = In case of library, here goes the .cpp files, otherwise even .h can go here
include/${PROJECT_NAME}/ = Where all the .h files go in case of library
third-party/ = Where all the sub projects go 
