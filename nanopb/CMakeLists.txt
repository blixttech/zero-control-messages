zephyr_library()
zephyr_library_include_directories(.)
zephyr_include_directories(.)
zephyr_library_sources(
    pb_common.c
    pb_decode.c
    pb_encode.c
)