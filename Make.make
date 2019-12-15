# Name of the project
PROJECT_NAME=Photon

# Directory of the .cpp and .h files.
# Use both the same if you don't divide and have all in one
SOURCE_DIR=./src/
INCLUDE_DIR=include/

# If your source files have some sub directories, specify them here
FILES_SUB_DIRS=Rendering System Rendering/Textures Rendering/Defferred

# Where all the libs should be put
THIRD_PARTY=./third-party/
# All the libs that are in use
LIBS=-ldl -L/usr/lib64/ -lGL -lOpenGL -lGLU -lX11 -lXxf86vm -lXrandr -lpthread -l:libXi.so.6 -lgdiplus -lAvgLib -lglfw3
# Where should we look for the libs
LIB_DIRS=AvgLib glfw/src glm/glm
# Where we can find include files in these libs
INCLUDE=glad glm glfw/include AvgLib/include

# Other files that should be compiled into .o file
FILES=main.cpp


# C++ compiler
# CPP_COMPILER=g++
# Version of the c++
# CPP_VERSION=c++2a
# Flags to send to the compiler
# CPP_FLAGS=
# Additional flags to send to the compiler in case of debug
# CPP_DEBUG_FLAGS=
# Some macros to define
# CPP_DEFINITIONS=-DMAX_LIGHT_COUNT=32