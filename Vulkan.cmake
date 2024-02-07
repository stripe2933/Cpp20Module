find_package(Vulkan REQUIRED)

if (NOT TARGET VulkanHppModule)
    # Require Vulkan version ≥ 1.3.256 (earliest version when the Vulkan module was available)
    if (${Vulkan_VERSION} VERSION_LESS "1.3.256")
        message(FATAL_ERROR "Minimum required Vulkan version for C++ modules is 1.3.256. Found ${Vulkan_VERSION}.")
    endif()

    # Setup Vulkan C++ module as a library
    add_library(VulkanHppModule)
    target_sources(VulkanHppModule PUBLIC
        FILE_SET CXX_MODULES
        BASE_DIRS ${Vulkan_INCLUDE_DIR}
        FILES ${Vulkan_INCLUDE_DIR}/vulkan/vulkan.cppm
    )
    target_link_libraries(VulkanHppModule PUBLIC Vulkan::Vulkan)

    add_library(Vulkan::module ALIAS VulkanHppModule)
endif()

# TODO: For now, MSVC can't handle Vulkan named module with smart handles. When it fixed, remove below lines.
# See https://github.com/KhronosGroup/Vulkan-Hpp/blob/main/README.md#c20-named-module.
if (MSVC)
    target_compile_definitions(VulkanHppModule PUBLIC VULKAN_HPP_NO_SMART_HANDLE)
endif()