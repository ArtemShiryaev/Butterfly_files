# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build"

# Include any dependencies generated for this target.
include tests/CMakeFiles/test_moving_average.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/test_moving_average.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/test_moving_average.dir/flags.make

tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o: tests/CMakeFiles/test_moving_average.dir/flags.make
tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o: ../tests/test_moving_average.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o"
	cd "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build/tests" && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o -c "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/tests/test_moving_average.cpp"

tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_moving_average.dir/test_moving_average.cpp.i"
	cd "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build/tests" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/tests/test_moving_average.cpp" > CMakeFiles/test_moving_average.dir/test_moving_average.cpp.i

tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_moving_average.dir/test_moving_average.cpp.s"
	cd "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build/tests" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/tests/test_moving_average.cpp" -o CMakeFiles/test_moving_average.dir/test_moving_average.cpp.s

tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o.requires:

.PHONY : tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o.requires

tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o.provides: tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/test_moving_average.dir/build.make tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o.provides.build
.PHONY : tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o.provides

tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o.provides.build: tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o


# Object files for target test_moving_average
test_moving_average_OBJECTS = \
"CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o"

# External object files for target test_moving_average
test_moving_average_EXTERNAL_OBJECTS =

test_moving_average: tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o
test_moving_average: tests/CMakeFiles/test_moving_average.dir/build.make
test_moving_average: libbutterfly.a
test_moving_average: 3rd_party/cppnetworking/libnetworking.a
test_moving_average: 3rd_party/cppmisc/libcppmisc.a
test_moving_average: tests/CMakeFiles/test_moving_average.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../test_moving_average"
	cd "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build/tests" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_moving_average.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/test_moving_average.dir/build: test_moving_average

.PHONY : tests/CMakeFiles/test_moving_average.dir/build

tests/CMakeFiles/test_moving_average.dir/requires: tests/CMakeFiles/test_moving_average.dir/test_moving_average.cpp.o.requires

.PHONY : tests/CMakeFiles/test_moving_average.dir/requires

tests/CMakeFiles/test_moving_average.dir/clean:
	cd "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build/tests" && $(CMAKE_COMMAND) -P CMakeFiles/test_moving_average.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/test_moving_average.dir/clean

tests/CMakeFiles/test_moving_average.dir/depend:
	cd "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource" "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/tests" "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build" "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build/tests" "/home/butterfly/Desktop/template_Robotics_Cource(1)/template_Robotics_Cource/build/tests/CMakeFiles/test_moving_average.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : tests/CMakeFiles/test_moving_average.dir/depend

