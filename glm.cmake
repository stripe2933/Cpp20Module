if (NOT TARGET glm_module)
    add_library(glm_module)
    target_sources(glm_module PUBLIC
        FILE_SET CXX_MODULES
        BASE_DIRS ${glm_SOURCE_DIR}
        FILES ${glm_SOURCE_DIR}/glm/glm.cppm
    )
    target_link_libraries(glm_module PUBLIC glm::glm)

    add_library(glm::module ALIAS glm_module)
endif()