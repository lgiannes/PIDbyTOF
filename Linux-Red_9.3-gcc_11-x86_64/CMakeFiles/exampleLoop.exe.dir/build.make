# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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
CMAKE_SOURCE_DIR = /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/cmake

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/Linux-Red_9.3-gcc_11-x86_64

# Include any dependencies generated for this target.
include CMakeFiles/exampleLoop.exe.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/exampleLoop.exe.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/exampleLoop.exe.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/exampleLoop.exe.dir/flags.make

CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.o: CMakeFiles/exampleLoop.exe.dir/flags.make
CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.o: /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx
CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.o: CMakeFiles/exampleLoop.exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/Linux-Red_9.3-gcc_11-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.o"
	/afs/cern.ch/work/l/lgiannes/private/T2K/work/nd280release_14.10/nd280SoftwarePilot/scripts/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.o -MF CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.o.d -o CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.o -c /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx

CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.i"
	/afs/cern.ch/work/l/lgiannes/private/T2K/work/nd280release_14.10/nd280SoftwarePilot/scripts/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx > CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.i

CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.s"
	/afs/cern.ch/work/l/lgiannes/private/T2K/work/nd280release_14.10/nd280SoftwarePilot/scripts/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx -o CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.s

# Object files for target exampleLoop.exe
exampleLoop_exe_OBJECTS = \
"CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.o"

# External object files for target exampleLoop.exe
exampleLoop_exe_EXTERNAL_OBJECTS =

bin/exampleLoop.exe: CMakeFiles/exampleLoop.exe.dir/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/app/exampleLoop.cxx.o
bin/exampleLoop.exe: CMakeFiles/exampleLoop.exe.dir/build.make
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/MYSQL_5.6.20.02/Linux-Red_9.3-gcc_11-x86_64/lib/libMYSQL.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/GSL_1.15.0.00/Linux-Red_9.3-gcc_11-x86_64/lib/libGSL.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/ROOT_6.20.04.04/Linux-Red_9.3-gcc_11-x86_64/lib/libROOT.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaEvent_10.6/Linux-Red_9.3-gcc_11-x86_64/lib/liboaEvent.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRawEvent_3.33/Linux-Red_9.3-gcc_11-x86_64/lib/liboaRawEvent.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRuntimeParams_0.10/Linux-Red_9.3-gcc_11-x86_64/lib/liboaRuntimeParams.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaSlowControlDatabase_1.15.1/Linux-Red_9.3-gcc_11-x86_64/lib/liboaSlowControlDatabase.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaOfflineDatabase_2.16/Linux-Red_9.3-gcc_11-x86_64/lib/liboaOfflineDatabase.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaCalibTables_1.28/Linux-Red_9.3-gcc_11-x86_64/lib/liboaCalibTables.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaMagnetCalib_4.18/Linux-Red_9.3-gcc_11-x86_64/lib/liboaMagnetCalib.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaUtility_6.0/Linux-Red_9.3-gcc_11-x86_64/lib/liboaUtility.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaChanInfo_4.2/Linux-Red_9.3-gcc_11-x86_64/lib/liboaChanInfo.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaGeomInfo_6.4/Linux-Red_9.3-gcc_11-x86_64/lib/liboaGeomInfo.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/reconUtils_1.37/Linux-Red_9.3-gcc_11-x86_64/lib/libreconUtils.so
bin/exampleLoop.exe: /afs/cern.ch/work/l/lgiannes/private/T2K/work/CLHEP_2.1.1.0/cmake/../Linux-Red_9.3-gcc_11-x86_64/lib/libCLHEP.so
bin/exampleLoop.exe: CMakeFiles/exampleLoop.exe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/Linux-Red_9.3-gcc_11-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/exampleLoop.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/exampleLoop.exe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/exampleLoop.exe.dir/build: bin/exampleLoop.exe
.PHONY : CMakeFiles/exampleLoop.exe.dir/build

CMakeFiles/exampleLoop.exe.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/exampleLoop.exe.dir/cmake_clean.cmake
.PHONY : CMakeFiles/exampleLoop.exe.dir/clean

CMakeFiles/exampleLoop.exe.dir/depend:
	cd /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/Linux-Red_9.3-gcc_11-x86_64 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/cmake /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/cmake /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/Linux-Red_9.3-gcc_11-x86_64 /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/Linux-Red_9.3-gcc_11-x86_64 /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/Linux-Red_9.3-gcc_11-x86_64/CMakeFiles/exampleLoop.exe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/exampleLoop.exe.dir/depend

