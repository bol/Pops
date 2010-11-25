cmake_minimum_required (VERSION 2.6)

project (Pops)

set (POPS_VERSION_MAJOR 0)
set (POPS_VERSION_MINOR 1)

set (CMAKE_CXX_FLAGS "-Wall -g")

configure_file (
			"${PROJECT_SOURCE_DIR}/PopsConfig.h.in"
			"${PROJECT_BINARY_DIR}/PopsConfig.h"
)

# FIXME: This is not how you do it
find_library(RAKNET_LIBRARY NAMES RakNetDynamic PATHS "${CMAKE_CURRENT_SOURCE_DIR}/../raknet")
set(RAKNET_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../raknet/include/raknet")

include_directories("${PROJECT_BINARY_DIR}")
include_directories("${RAKNET_INCLUDE_DIR}")

set (SOURCE_FILES main.cpp)
add_executable(${PROJECT_NAME} ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} ${RAKNET_LIBRARY})
