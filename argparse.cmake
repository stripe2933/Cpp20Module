if (NOT TARGET argparse_module)
    add_library(argparse_module)
    target_sources(argparse_module PUBLIC
        FILE_SET CXX_MODULES
        BASE_DIRS ${argparse_SOURCE_DIR}
        FILES ${argparse_SOURCE_DIR}/module/argparse.cppm
    )
    target_link_libraries(argparse_module PUBLIC argparse::argparse)

    add_library(argparse::module ALIAS argparse_module)
endif()