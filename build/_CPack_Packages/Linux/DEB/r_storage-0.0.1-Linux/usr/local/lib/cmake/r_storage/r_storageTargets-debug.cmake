#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "r_storage::r_storage" for configuration "Debug"
set_property(TARGET r_storage::r_storage APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(r_storage::r_storage PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libr_storage.a"
  )

list(APPEND _cmake_import_check_targets r_storage::r_storage )
list(APPEND _cmake_import_check_files_for_r_storage::r_storage "${_IMPORT_PREFIX}/lib/libr_storage.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
