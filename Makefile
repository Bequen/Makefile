PROJECT_NAME=SuperSecretProject

CPP_COMPILER=g++
CPP_VERSION=c++2a

include ./Make.make

CPP_FLAGS+=-std=${CPP_VERSION} -DMAX_LIGHT_COUNT=32
CPP_DEBUG_FLAGS+=${CPP_FLAGS} -O0 -g3 -ggdb -DDEBUG
CPP_DEFINITIONS+=-DPROJECT_NAME=${PROJECT_NAME}

# Actual code files
SOURCE=$(foreach dir, $(addprefix ${SOURCE_DIR}, ${FILES_SUB_DIRS}), $(wildcard $(dir)/*.cpp)) $(addprefix ${SOURCE_DIR}, ${FILES})
HEADERS=$(foreach dir, $(addprefix ${INCLUDE_DIR}, ${FILES_SUB_DIRS}), $(wildcard $(dir)/*.h))

# Libs
LIB_INCLUDE=$(addprefix -I${THIRD_PARTY}, ${INCLUDE}) -I${THIRD_PARTY} -I${INCLUDE_DIR}
LIB_FILES=$(addprefix -L${THIRD_PARTY}, ${LIB_DIRS})

ODIR=obj
OBJ=${SOURCE:.cpp=.o}

# Final build targets
.PHONY: debug
debug: ${OBJ}
	@echo -e "\033[0;34mCompiling ${PROJECT_NAME}\033[0m"
	@${CPP_COMPILER} ${CPP_DEBUG_FLAGS} ${CPP_DEFINITIONS} -o ${DIR}${PROJECT_NAME} $^ ./src/glad.c ${LIBS} ${LIB_FILES} ${LIB_INCLUDE} 
	@echo -e "\033[0;32mCompiling finished\033[0m"

.PHONY: release
release: ${OBJ}
	@echo -e "\033[0;35mCreating release build"
	@echo -e "\033[0;34mCompiling ${PROJECT_NAME}\033[0m"
	@${CPP_COMPILER} ${CPP_FLAGS} ${CPP_DEFINITIONS} -o ${DIR}${PROJECT_NAME} $^ ./src/glad.c ${LIBS} ${LIB_FILES} ${LIB_INCLUDE} 
	@echo -e "\033[0;32mCompiling finished\033[0m"

# Final targets
.PHONY: library
library: ${OBJ}
	@ar rvs -c lib${PROJECT_NAME}.a $^

.PHONY: test
test: debug
	./${PROJECT_NAME}

.PHONY: build
build:
	@mkdir -p build
	@${MAKE} DIR=./build/ release
	@cp -r assets ./build/

$(OBJ): %.o: %.cpp
	@echo -e "\033[0;34m Compiling $^ for $@\033[0m"
	@${CPP_COMPILER} ${CPP_DEBUG_FLAGS} ${CPP_DEFINITIONS} ${LIB_INCLUDE} -c -o $@ $<
	@echo -e "\033[0;32mCompiling $^ for $@ was successfull\033[0m"


# CLEANING
.PHONY: clean
clean:
	@rm -f ${OBJ}
	@rm -f -r ./build/
	@rm -f ./${PROJECT_NAME}
	@rm -f ./lib${PROJECT_NAME}.a

.PHONY: clean_build
clean_build:
	@rm -f -r ./build/
	@rm -f ./${PROJECT_NAME}
	@rm -f ./lib${PROJECT_NAME}.a