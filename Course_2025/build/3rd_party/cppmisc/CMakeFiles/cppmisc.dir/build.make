# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_SOURCE_DIR = /home/butterfly/Desktop/Course_2025

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/butterfly/Desktop/Course_2025/build

# Include any dependencies generated for this target.
include 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/compiler_depend.make

# Include the progress variables for this target.
include 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/progress.make

# Include the compile flags for this target's objects.
include 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/flags.make

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/json.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/flags.make
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/json.cpp.o: /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/json.cpp
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/json.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/butterfly/Desktop/Course_2025/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/json.cpp.o"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/json.cpp.o -MF CMakeFiles/cppmisc.dir/src/json.cpp.o.d -o CMakeFiles/cppmisc.dir/src/json.cpp.o -c /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/json.cpp

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/json.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/cppmisc.dir/src/json.cpp.i"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/json.cpp > CMakeFiles/cppmisc.dir/src/json.cpp.i

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/json.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/cppmisc.dir/src/json.cpp.s"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/json.cpp -o CMakeFiles/cppmisc.dir/src/json.cpp.s

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/signals.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/flags.make
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/signals.cpp.o: /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/signals.cpp
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/signals.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/butterfly/Desktop/Course_2025/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/signals.cpp.o"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/signals.cpp.o -MF CMakeFiles/cppmisc.dir/src/signals.cpp.o.d -o CMakeFiles/cppmisc.dir/src/signals.cpp.o -c /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/signals.cpp

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/signals.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/cppmisc.dir/src/signals.cpp.i"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/signals.cpp > CMakeFiles/cppmisc.dir/src/signals.cpp.i

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/signals.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/cppmisc.dir/src/signals.cpp.s"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/signals.cpp -o CMakeFiles/cppmisc.dir/src/signals.cpp.s

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/traces.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/flags.make
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/traces.cpp.o: /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/traces.cpp
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/traces.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/butterfly/Desktop/Course_2025/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/traces.cpp.o"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/traces.cpp.o -MF CMakeFiles/cppmisc.dir/src/traces.cpp.o.d -o CMakeFiles/cppmisc.dir/src/traces.cpp.o -c /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/traces.cpp

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/traces.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/cppmisc.dir/src/traces.cpp.i"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/traces.cpp > CMakeFiles/cppmisc.dir/src/traces.cpp.i

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/traces.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/cppmisc.dir/src/traces.cpp.s"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/traces.cpp -o CMakeFiles/cppmisc.dir/src/traces.cpp.s

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/strings.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/flags.make
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/strings.cpp.o: /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/strings.cpp
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/strings.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/butterfly/Desktop/Course_2025/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/strings.cpp.o"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/strings.cpp.o -MF CMakeFiles/cppmisc.dir/src/strings.cpp.o.d -o CMakeFiles/cppmisc.dir/src/strings.cpp.o -c /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/strings.cpp

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/strings.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/cppmisc.dir/src/strings.cpp.i"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/strings.cpp > CMakeFiles/cppmisc.dir/src/strings.cpp.i

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/strings.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/cppmisc.dir/src/strings.cpp.s"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/strings.cpp -o CMakeFiles/cppmisc.dir/src/strings.cpp.s

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/files.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/flags.make
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/files.cpp.o: /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/files.cpp
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/files.cpp.o: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/butterfly/Desktop/Course_2025/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/files.cpp.o"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/files.cpp.o -MF CMakeFiles/cppmisc.dir/src/files.cpp.o.d -o CMakeFiles/cppmisc.dir/src/files.cpp.o -c /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/files.cpp

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/files.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/cppmisc.dir/src/files.cpp.i"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/files.cpp > CMakeFiles/cppmisc.dir/src/files.cpp.i

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/files.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/cppmisc.dir/src/files.cpp.s"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc/src/files.cpp -o CMakeFiles/cppmisc.dir/src/files.cpp.s

# Object files for target cppmisc
cppmisc_OBJECTS = \
"CMakeFiles/cppmisc.dir/src/json.cpp.o" \
"CMakeFiles/cppmisc.dir/src/signals.cpp.o" \
"CMakeFiles/cppmisc.dir/src/traces.cpp.o" \
"CMakeFiles/cppmisc.dir/src/strings.cpp.o" \
"CMakeFiles/cppmisc.dir/src/files.cpp.o"

# External object files for target cppmisc
cppmisc_EXTERNAL_OBJECTS =

3rd_party/cppmisc/libcppmisc.a: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/json.cpp.o
3rd_party/cppmisc/libcppmisc.a: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/signals.cpp.o
3rd_party/cppmisc/libcppmisc.a: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/traces.cpp.o
3rd_party/cppmisc/libcppmisc.a: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/strings.cpp.o
3rd_party/cppmisc/libcppmisc.a: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/src/files.cpp.o
3rd_party/cppmisc/libcppmisc.a: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/build.make
3rd_party/cppmisc/libcppmisc.a: 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/butterfly/Desktop/Course_2025/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library libcppmisc.a"
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && $(CMAKE_COMMAND) -P CMakeFiles/cppmisc.dir/cmake_clean_target.cmake
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cppmisc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
3rd_party/cppmisc/CMakeFiles/cppmisc.dir/build: 3rd_party/cppmisc/libcppmisc.a
.PHONY : 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/build

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/clean:
	cd /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc && $(CMAKE_COMMAND) -P CMakeFiles/cppmisc.dir/cmake_clean.cmake
.PHONY : 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/clean

3rd_party/cppmisc/CMakeFiles/cppmisc.dir/depend:
	cd /home/butterfly/Desktop/Course_2025/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/butterfly/Desktop/Course_2025 /home/butterfly/Desktop/Course_2025/3rd_party/cppmisc /home/butterfly/Desktop/Course_2025/build /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc /home/butterfly/Desktop/Course_2025/build/3rd_party/cppmisc/CMakeFiles/cppmisc.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : 3rd_party/cppmisc/CMakeFiles/cppmisc.dir/depend

