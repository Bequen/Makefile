# Name of the project
PROJECT_NAME=

# Directory of the .cpp and .h files.
# Use both the same if you don't divide and have all in one
SOURCE_DIR=./src/
INCLUDE_DIR=./include/
LIB_DIR=./deps/

# If your source files have some sub directories, specify them here
FILES_SUB_DIRS=

# Where libraries, other than those in /usr/lib64/ are put
THIRD_PARTY=./third-party/
# All the dependencies that are in use
DEPS=
# Where should we look for the .so files in sub projects
LIB_DIRS=
# Where we can find header files of these sub projects
LIB_INCLUDE_DIRS=

# Other files that should be compiled into .o file
FILES=main.cpp

# Define default target
.DEFAULT:= 

# Declare here custom targets
# Warning, these are taken before any other, which they are default by default, use above variable to set it to test or something