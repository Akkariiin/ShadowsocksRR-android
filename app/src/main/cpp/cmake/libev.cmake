
cmake_minimum_required(VERSION 3.4.1)
project(libev C)

set(CMAKE_C_STANDARD 11)

set(
        libev_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/shadowsocks-libev/libev   # TODO
)

include_directories(
        ${libev_ROOT_DIR}
        ${CMAKE_CURRENT_LIST_DIR}/../include/libev
)

add_definitions(-DHAVE_CONFIG_H)

set(
        libev_SRC_FILE
        ${libev_ROOT_DIR}/ev.c
        ${libev_ROOT_DIR}/event.c
)


add_library(
        libev
        STATIC
        ${libev_SRC_FILE}
)


