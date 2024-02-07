if (NOT TARGET VulkanMemoryAllocator-Hpp_module)
    add_library(VulkanMemoryAllocator-Hpp_module)
    target_sources(VulkanMemoryAllocator-Hpp_module PUBLIC
        FILE_SET CXX_MODULES
        BASE_DIRS ${VulkanMemoryAllocator-Hpp_SOURCE_DIR}
        FILES ${VulkanMemoryAllocator-Hpp_SOURCE_DIR}/src/vk_mem_alloc.cppm
    )
    target_link_libraries(VulkanMemoryAllocator-Hpp_module PUBLIC VulkanMemoryAllocator-Hpp)

    add_library(VulkanMemoryAllocator-Hpp::module ALIAS VulkanMemoryAllocator-Hpp_module)
endif()