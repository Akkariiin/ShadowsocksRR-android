
cmake_minimum_required(VERSION 3.4.1)
project(libproxychains4 C)

set(CMAKE_C_STANDARD 11)

set(
        proxychains_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/proxychains
)
set(
        libancillary_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../libancillary
)


include_directories(
        ${libancillary_ROOT_DIR}
        ${proxychains_ROOT_DIR}/src
        ${CMAKE_CURRENT_LIST_DIR}/include/proxychains
)

add_definitions(HAVE_CONFIG_H)
add_definitions(ANDROID)

#add_definitions(INSTALL_PREFIX="/data/user/0/moe.yuruyuri.akkariiin.shadowsocksrr/")  # TODO
set(INSTALL_PREFIX "/data/user/0/moe.yuruyuri.akkariiin.shadowsocksrr/")  # TODO
add_definitions(SYSCONFDIR="/data/user/0/moe.yuruyuri.akkariiin.shadowsocksrr")  # TODO
add_definitions(LIB_DIR="/data/user/0/moe.yuruyuri.akkariiin.shadowsocksrr/lib")  # TODO
add_definitions(DLL_NAME="libproxychains4.so")  # TODO
add_compile_options(-soname=libproxychains4.so) # TODO
# https://stackoverflow.com/questions/24532853/how-to-add-linker-flag-for-libraries-with-cmake
set(CMAKE_SHARED_LINKER_FLAGS "-Wl,--no-as-needed")

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
        proxychains
        SHARED
        ${proxychains_SRC_FILE}
)


# add "-pthread"  use follow three line
# https://stackoverflow.com/questions/1620918/cmake-and-libpthread
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
target_link_libraries(
        proxychains
        Threads::Threads
)


find_library(
        log-lib
        log
)

target_link_libraries(
        proxychains
        ${log-lib}
)
