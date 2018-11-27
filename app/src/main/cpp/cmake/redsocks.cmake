
cmake_minimum_required(VERSION 3.4.1)
project(redsocks C)

set(CMAKE_C_STANDARD 99)

set(
        redsocks_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../redsocks
)
set(
        libevent_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../libevent
)


add_definitions(USE_IPTABLES)

set(
        redsocks_SRC_FILE
        ${redsocks_ROOT_DIR}/base.c
        ${redsocks_ROOT_DIR}/http-connect.c
        ${redsocks_ROOT_DIR}/log.c
        ${redsocks_ROOT_DIR}/md5.c
        ${redsocks_ROOT_DIR}/socks5.c
        ${redsocks_ROOT_DIR}/base64.c
        ${redsocks_ROOT_DIR}/http-auth.c
        ${redsocks_ROOT_DIR}/http-relay.c
        ${redsocks_ROOT_DIR}/main.c
        ${redsocks_ROOT_DIR}/parser.c
        ${redsocks_ROOT_DIR}/redsocks.c
        ${redsocks_ROOT_DIR}/socks4.c
        ${redsocks_ROOT_DIR}/utils.c
)

include_directories(
        ${redsocks_ROOT_DIR}
        ${libevent_ROOT_DIR}
        ${libevent_ROOT_DIR}/include
)

add_definitions(HAVE_CONFIG_H)

add_library(
        redsocks
        STATIC
        ${redsocks_SRC_FILE}
)

target_link_libraries(
        redsocks
        libevent
)
