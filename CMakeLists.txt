cmake_minimum_required(VERSION 3.8)
project(bzip2)

enable_testing()

add_library(bz2 STATIC
    blocksort.c
    huffman.c
    crctable.c
    randtable.c
    compress.c
    decompress.c
    bzlib.c
    bzlib.h)
target_include_directories(bz2
    PUBLIC
    .)
target_compile_options(bz2
    PUBLIC
    -Wall -Winline -O2 -g -frecord-gcc-switches
)
target_compile_definitions(bz2
    PUBLIC
    -D_FILE_OFFSET_BITS=64
)

add_executable(bzip2
    bzip2.c)
target_link_libraries(bzip2
    PRIVATE
    bz2)

add_test(NAME "test::bzip2"
    COMMAND
    sh ${PROJECT_SOURCE_DIR}/tests/roundtrip.sh $<TARGET_FILE:bzip2>
    )