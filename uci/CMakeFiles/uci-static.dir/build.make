# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /tmp/uci_for_linux/uci

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/uci_for_linux/uci

# Include any dependencies generated for this target.
include CMakeFiles/uci-static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/uci-static.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/uci-static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/uci-static.dir/flags.make

CMakeFiles/uci-static.dir/libuci.c.o: CMakeFiles/uci-static.dir/flags.make
CMakeFiles/uci-static.dir/libuci.c.o: libuci.c
CMakeFiles/uci-static.dir/libuci.c.o: CMakeFiles/uci-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/uci_for_linux/uci/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/uci-static.dir/libuci.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/uci-static.dir/libuci.c.o -MF CMakeFiles/uci-static.dir/libuci.c.o.d -o CMakeFiles/uci-static.dir/libuci.c.o -c /tmp/uci_for_linux/uci/libuci.c

CMakeFiles/uci-static.dir/libuci.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/uci-static.dir/libuci.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/uci_for_linux/uci/libuci.c > CMakeFiles/uci-static.dir/libuci.c.i

CMakeFiles/uci-static.dir/libuci.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/uci-static.dir/libuci.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/uci_for_linux/uci/libuci.c -o CMakeFiles/uci-static.dir/libuci.c.s

CMakeFiles/uci-static.dir/file.c.o: CMakeFiles/uci-static.dir/flags.make
CMakeFiles/uci-static.dir/file.c.o: file.c
CMakeFiles/uci-static.dir/file.c.o: CMakeFiles/uci-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/uci_for_linux/uci/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/uci-static.dir/file.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/uci-static.dir/file.c.o -MF CMakeFiles/uci-static.dir/file.c.o.d -o CMakeFiles/uci-static.dir/file.c.o -c /tmp/uci_for_linux/uci/file.c

CMakeFiles/uci-static.dir/file.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/uci-static.dir/file.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/uci_for_linux/uci/file.c > CMakeFiles/uci-static.dir/file.c.i

CMakeFiles/uci-static.dir/file.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/uci-static.dir/file.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/uci_for_linux/uci/file.c -o CMakeFiles/uci-static.dir/file.c.s

CMakeFiles/uci-static.dir/util.c.o: CMakeFiles/uci-static.dir/flags.make
CMakeFiles/uci-static.dir/util.c.o: util.c
CMakeFiles/uci-static.dir/util.c.o: CMakeFiles/uci-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/uci_for_linux/uci/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/uci-static.dir/util.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/uci-static.dir/util.c.o -MF CMakeFiles/uci-static.dir/util.c.o.d -o CMakeFiles/uci-static.dir/util.c.o -c /tmp/uci_for_linux/uci/util.c

CMakeFiles/uci-static.dir/util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/uci-static.dir/util.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/uci_for_linux/uci/util.c > CMakeFiles/uci-static.dir/util.c.i

CMakeFiles/uci-static.dir/util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/uci-static.dir/util.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/uci_for_linux/uci/util.c -o CMakeFiles/uci-static.dir/util.c.s

CMakeFiles/uci-static.dir/delta.c.o: CMakeFiles/uci-static.dir/flags.make
CMakeFiles/uci-static.dir/delta.c.o: delta.c
CMakeFiles/uci-static.dir/delta.c.o: CMakeFiles/uci-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/uci_for_linux/uci/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/uci-static.dir/delta.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/uci-static.dir/delta.c.o -MF CMakeFiles/uci-static.dir/delta.c.o.d -o CMakeFiles/uci-static.dir/delta.c.o -c /tmp/uci_for_linux/uci/delta.c

CMakeFiles/uci-static.dir/delta.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/uci-static.dir/delta.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/uci_for_linux/uci/delta.c > CMakeFiles/uci-static.dir/delta.c.i

CMakeFiles/uci-static.dir/delta.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/uci-static.dir/delta.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/uci_for_linux/uci/delta.c -o CMakeFiles/uci-static.dir/delta.c.s

CMakeFiles/uci-static.dir/parse.c.o: CMakeFiles/uci-static.dir/flags.make
CMakeFiles/uci-static.dir/parse.c.o: parse.c
CMakeFiles/uci-static.dir/parse.c.o: CMakeFiles/uci-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/uci_for_linux/uci/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/uci-static.dir/parse.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/uci-static.dir/parse.c.o -MF CMakeFiles/uci-static.dir/parse.c.o.d -o CMakeFiles/uci-static.dir/parse.c.o -c /tmp/uci_for_linux/uci/parse.c

CMakeFiles/uci-static.dir/parse.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/uci-static.dir/parse.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/uci_for_linux/uci/parse.c > CMakeFiles/uci-static.dir/parse.c.i

CMakeFiles/uci-static.dir/parse.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/uci-static.dir/parse.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/uci_for_linux/uci/parse.c -o CMakeFiles/uci-static.dir/parse.c.s

CMakeFiles/uci-static.dir/blob.c.o: CMakeFiles/uci-static.dir/flags.make
CMakeFiles/uci-static.dir/blob.c.o: blob.c
CMakeFiles/uci-static.dir/blob.c.o: CMakeFiles/uci-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/uci_for_linux/uci/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/uci-static.dir/blob.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/uci-static.dir/blob.c.o -MF CMakeFiles/uci-static.dir/blob.c.o.d -o CMakeFiles/uci-static.dir/blob.c.o -c /tmp/uci_for_linux/uci/blob.c

CMakeFiles/uci-static.dir/blob.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/uci-static.dir/blob.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/uci_for_linux/uci/blob.c > CMakeFiles/uci-static.dir/blob.c.i

CMakeFiles/uci-static.dir/blob.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/uci-static.dir/blob.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/uci_for_linux/uci/blob.c -o CMakeFiles/uci-static.dir/blob.c.s

# Object files for target uci-static
uci__static_OBJECTS = \
"CMakeFiles/uci-static.dir/libuci.c.o" \
"CMakeFiles/uci-static.dir/file.c.o" \
"CMakeFiles/uci-static.dir/util.c.o" \
"CMakeFiles/uci-static.dir/delta.c.o" \
"CMakeFiles/uci-static.dir/parse.c.o" \
"CMakeFiles/uci-static.dir/blob.c.o"

# External object files for target uci-static
uci__static_EXTERNAL_OBJECTS =

libuci.a: CMakeFiles/uci-static.dir/libuci.c.o
libuci.a: CMakeFiles/uci-static.dir/file.c.o
libuci.a: CMakeFiles/uci-static.dir/util.c.o
libuci.a: CMakeFiles/uci-static.dir/delta.c.o
libuci.a: CMakeFiles/uci-static.dir/parse.c.o
libuci.a: CMakeFiles/uci-static.dir/blob.c.o
libuci.a: CMakeFiles/uci-static.dir/build.make
libuci.a: CMakeFiles/uci-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/uci_for_linux/uci/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C static library libuci.a"
	$(CMAKE_COMMAND) -P CMakeFiles/uci-static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/uci-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/uci-static.dir/build: libuci.a
.PHONY : CMakeFiles/uci-static.dir/build

CMakeFiles/uci-static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/uci-static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/uci-static.dir/clean

CMakeFiles/uci-static.dir/depend:
	cd /tmp/uci_for_linux/uci && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/uci_for_linux/uci /tmp/uci_for_linux/uci /tmp/uci_for_linux/uci /tmp/uci_for_linux/uci /tmp/uci_for_linux/uci/CMakeFiles/uci-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/uci-static.dir/depend
