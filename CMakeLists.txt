if (CONFIG_ZERO_CONTROL_MESSAGES)
    # Note that here, we're adding CMAKE_CURRENT_SOURCE_DIR to the include path for nanopb.
    # This is needed because the below call to nanopb_generate_cpp() is using
    # 'RELPATH .'
    # And generate with C-style names.
    set(NANOPB_OPTIONS "-I${CMAKE_CURRENT_SOURCE_DIR} -C")

    nanopb_generate_cpp(ZC_MESSAGES_SOURCES ZC_MESSAGES_HEADERS
        RELPATH "${CMAKE_CURRENT_SOURCE_DIR}" 
        "zc_messages.proto"
    )

    if(Zephyr_FOUND)
        zephyr_library()
        zephyr_library_sources(${ZC_MESSAGES_SOURCES})
        zephyr_library_include_directories(.)
        zephyr_library_include_directories(${CMAKE_CURRENT_BINARY_DIR})
    endif()
endif()
