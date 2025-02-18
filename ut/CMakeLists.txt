
FetchContent_Declare(
    r_fakey
    GIT_REPOSITORY https://github.com/dicroce/r_fakey.git
    GIT_TAG        main
)
FetchContent_MakeAvailable(r_fakey)

FetchContent_Declare(
    r_pipeline
    GIT_REPOSITORY https://github.com/dicroce/r_pipeline.git
    GIT_TAG        main
)
FetchContent_MakeAvailable(r_pipeline)

FetchContent_Declare(
    r_av
    GIT_REPOSITORY https://github.com/dicroce/r_av.git
    GIT_TAG        main
)
FetchContent_MakeAvailable(r_av)

function(dump_cmake_variables)
    get_cmake_property(_variableNames VARIABLES)
    list (SORT _variableNames)
    foreach (_variableName ${_variableNames})
        if (ARGV0)
            unset(MATCHED)
            string(REGEX MATCH ${ARGV0} MATCHED ${_variableName})
            if (NOT MATCHED)
                continue()
            endif()
        endif()
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
endfunction()

dump_cmake_variables("gstreamer")

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
    ${gstreamer_LIBRARY_DIRS}
    ${r_utils_SOURCE_DIR}/include
    ${r_fakey_SOURCE_DIR}/include
    ${r_pipeline_SOURCE_DIR}/include
    ${r_av_SOURCE_DIR}/include
)
target_link_directories(
    r_storage_ut PUBLIC 
    ${r_fakey_BUILD_DIR}
)
target_link_libraries(
    r_storage_ut LINK_PUBLIC 
    r_fakey
    r_pipeline
    r_av
    r_utils
    r_storage
    ${gstreamer-rtsp-server_STATIC_LIBRARIES}
    ${gstreamer-app_STATIC_LIBRARIES}
    ${gstreamer-plugins-good_STATIC_LIBRARIES}
    ${gstreamer-plugins-base_STATIC_LIBRARIES}
    ${gstreamer-codecparsers_STATIC_LIBRARIES}
    bz2
)
