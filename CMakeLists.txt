cmake_minimum_required(VERSION 3.8)
project(bzip2)

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

add_executable(bzip2
    bzip2.c)
target_link_libraries(bzip2
    PRIVATE
    bz2)