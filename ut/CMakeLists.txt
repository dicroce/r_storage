
FetchContent_Declare(
    r_fakey
    GIT_REPOSITORY https://github.com/dicroce/r_fakey.git
    GIT_TAG        main
    FIND_PACKAGE_ARGS NAMES r_fakey
)
FetchContent_MakeAvailable(r_fakey)

FetchContent_Declare(
    r_pipeline
    GIT_REPOSITORY https://github.com/dicroce/r_pipeline.git
    GIT_TAG        main
    FIND_PACKAGE_ARGS NAMES r_pipeline
)
FetchContent_MakeAvailable(r_pipeline)

FetchContent_Declare(
    r_av
    GIT_REPOSITORY https://github.com/dicroce/r_av.git
    GIT_TAG        main
    FIND_PACKAGE_ARGS NAMES r_av
)
FetchContent_MakeAvailable(r_av)

add_executable(
    r_storage_ut
    include/framework.h
    source/framework.cpp
    include/utils.h
    source/utils.cpp
    include/test_r_storage.h
    source/test_r_storage.cpp
)

if(MSVC)
    target_link_options(r_storage_ut PUBLIC "/STACK:10000000")
endif()

target_include_directories(
    r_storage_ut PUBLIC 
    include
    ../include
)
target_link_libraries(
    r_storage_ut LINK_PUBLIC 
    r_fakey
    r_pipeline
    r_av
    r_utils
    r_storage
    ${GST_LIBS}
    bz2
)
