if (CONFIG_ZERO_CONTROL_MESSAGES)
    zephyr_library()
    zephyr_library_include_directories(.)

    # Note that here, we're adding CMAKE_SOURCE_DIR to the include path for nanopb.
    # This is needed because the below call to nanopb_generate_cpp() is using
    # 'RELPATH .'
    set(NANOPB_OPTIONS "-I${CMAKE_SOURCE_DIR}")
    nanopb_generate_cpp(proto_sources proto_headers RELPATH . zc_messages.proto)

    # we need to be able to include generated header files
    zephyr_library_include_directories(${CMAKE_CURRENT_BINARY_DIR})
endif()
