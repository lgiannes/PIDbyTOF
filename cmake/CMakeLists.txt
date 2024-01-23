# CMakeLists.txt for analyse package. It creates a library with dictionary and a main program
cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

find_package(nd280SoftwarePolicy 3.1)
if( NOT nd280SoftwarePolicy_FOUND) 
  message(FATAL_ERROR " nd280SoftwarePolicy not found - abort ")
endif()

include(analysePackageVersion.cmake)
ND280_PROJECT(analyse ${PACKAGE_VERSION})
include(analyseND280_USE.cmake)

#ND280_STANDARD_LIBRARY()
ND280_NO_LIBRARY(analyse)
ND280_EXECUTABLE(exampleLoop exampleLoop.cxx )
ND280_EXECUTABLE(checkReconInfo checkReconInfo.cxx)
ND280_EXECUTABLE(getReconTime getReconTime.cxx )
ND280_EXECUTABLE(helloWorld helloWorld.cxx )
ND280_END_PROJECT()
