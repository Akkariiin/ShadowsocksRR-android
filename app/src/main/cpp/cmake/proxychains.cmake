
cmake_minimum_required(VERSION 3.4.1)
project(libproxychains4 C)

set(CMAKE_C_STANDARD 11)

set(
        proxychains_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../proxychains-ng/src
)
set(
        libancillary_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../libancillary
)


include_directories(
        ${libancillary_ROOT_DIR}
        ${proxychains_ROOT_DIR}
        ${CMAKE_CURRENT_LIST_DIR}/../include/proxychains
)

add_definitions(-DUSE_NEW_VERSION_NDK_FOR_gethostbyaddr_D)

add_definitions(-DHAVE_CONFIG_H)
add_definitions(-DANDROID)

#add_definitions(INSTALL_PREFIX="/data/user/0/moe.yuruyuri.akkariiin.shadowsocksrr/")  # TODO
set(INSTALL_PREFIX "/data/user/0/moe.yuruyuri.akkariiin.shadowsocksrr/")  # TODO
add_definitions(-DSYSCONFDIR="/data/user/0/moe.yuruyuri.akkariiin.shadowsocksrr")  # TODO
add_definitions(-DLIB_DIR="/data/user/0/moe.yuruyuri.akkariiin.shadowsocksrr/lib")  # TODO
add_definitions(-DDLL_NAME="libproxychains4.so")  # TODO

## https://stackoverflow.com/questions/10046114/in-cmake-how-can-i-test-if-the-compiler-is-clang
## https://stackoverflow.com/questions/4580789/ld-unknown-option-soname-on-os-x
## https://github.com/CopernicaMarketingSoftware/PHP-CPP/issues/368
#if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
#    # using Clang
#    set(CMAKE_SHARED_LINKER_FLAGS "-Wl,-install_name,libproxychains4.so.$(SONAME),--no-as-needed")
#elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
#    # using GCC
#    set(CMAKE_SHARED_LINKER_FLAGS "-Wl,-soname,libproxychains4.so.$(SONAME),--no-as-needed")
##elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
##    # using Intel C++
##elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
##    # using Visual Studio C++
#endif()

# https://stackoverflow.com/questions/24532853/how-to-add-linker-flag-for-libraries-with-cmake
set(CMAKE_SHARED_LINKER_FLAGS "-Wl,--no-as-needed")

#set(CMAKE_SHARED_LINKER_FLAGS "-Wl,-install_name,libproxychains4.so.$(SONAME),--no-as-needed")
#set(NO_SONAME ON)
#set(CMAKE_SHARED_LINKER_FLAGS "-Wl,-soname,libproxychains4.so")

set(
        proxychains_SRC_FILE
        ${proxychains_ROOT_DIR}/version.c
        ${proxychains_ROOT_DIR}/core.c
        ${proxychains_ROOT_DIR}/common.c
        ${proxychains_ROOT_DIR}/libproxychains.c
        ${proxychains_ROOT_DIR}/allocator_thread.c
        ${proxychains_ROOT_DIR}/ip_type.c
        ${proxychains_ROOT_DIR}/hostsreader.c
        ${proxychains_ROOT_DIR}/hash.c
        ${proxychains_ROOT_DIR}/debug.c
)


add_library(
        proxychains4
        SHARED
        ${proxychains_SRC_FILE}
)


# add "-pthread"  use follow three line
# https://stackoverflow.com/questions/1620918/cmake-and-libpthread
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
target_link_libraries(
        proxychains4
        Threads::Threads
)


find_library(
        log-lib
        log
)

target_link_libraries(
        proxychains4
        ${log-lib}
)
