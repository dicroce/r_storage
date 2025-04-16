cmake_minimum_required(VERSION 3.28.3)
set(PROJECT_VERSION_MAJOR 0)
set(PROJECT_VERSION_MINOR 0)
set(PROJECT_VERSION_PATCH 1)
project(r_storage VERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH})

include(r_build.txt)
include(FetchContent)

FetchContent_Declare(
    r_utils
    GIT_REPOSITORY https://github.com/dicroce/r_utils.git
    GIT_TAG        main
    FIND_PACKAGE_ARGS NAMES r_utils
)
FetchContent_MakeAvailable(r_utils)

FetchContent_Declare(
    r_db
    GIT_REPOSITORY https://github.com/dicroce/r_db.git
    GIT_TAG        main
    FIND_PACKAGE_ARGS NAMES r_db
)
FetchContent_MakeAvailable(r_db)

add_library(
    r_storage
    include/r_storage/r_dumbdex.h
    source/r_dumbdex.cpp
    include/r_storage/r_ind_block.h
    source/r_ind_block.cpp
    include/r_storage/r_rel_block.h
    source/r_rel_block.cpp
    include/r_storage/r_ring.h
    source/r_ring.cpp
    include/r_storage/r_storage_file.h
    source/r_storage_file.cpp
    include/r_storage/r_storage_file_reader.h
    source/r_storage_file_reader.cpp
)

target_include_directories(
    r_storage PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

target_link_libraries(
    r_storage 
    r_utils
    r_db
    ${CMAKE_DL_LIBS}
)

#add_subdirectory(ut)

configure_dev_package("r_storage" "Code for creating and working with revere media files.")
