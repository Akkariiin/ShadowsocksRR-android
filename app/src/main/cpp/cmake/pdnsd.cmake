
cmake_minimum_required(VERSION 3.4.1)
project(pdnsd C)

set(CMAKE_C_STANDARD 11)

set(
        pdnsd_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../pdnsd
)
set(
        libancillary_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../libancillary
)

# https://stackoverflow.com/questions/3201154/automatically-add-all-files-in-a-folder-to-a-target-using-cmake
file(
        GLOB pdnsd_SRC_FILE
        "${pdnsd_ROOT_DIR}/src/*.c"
        "${pdnsd_ROOT_DIR}/src/*.h"
)
#set(
#        pdnsd_SRC_FILE
#        #${pdnsd_ROOT_DIR}/src/*.c
#        ${pdnsd_ROOT_DIR}/src/cache.c
#        ${pdnsd_ROOT_DIR}/src/conff.c
#        ${pdnsd_ROOT_DIR}/src/conf-parser.c
#        ${pdnsd_ROOT_DIR}/src/consts.c
#        ${pdnsd_ROOT_DIR}/src/debug.c
#        ${pdnsd_ROOT_DIR}/src/dns.c
#        ${pdnsd_ROOT_DIR}/src/dns_answer.c
#        ${pdnsd_ROOT_DIR}/src/dns_query.c
#        ${pdnsd_ROOT_DIR}/src/error.c
#        ${pdnsd_ROOT_DIR}/src/hash.c
#        ${pdnsd_ROOT_DIR}/src/helpers.c
#        ${pdnsd_ROOT_DIR}/src/icmp.c
#        ${pdnsd_ROOT_DIR}/src/list.c
#        ${pdnsd_ROOT_DIR}/src/main.c
#        ${pdnsd_ROOT_DIR}/src/netdev.c
#        ${pdnsd_ROOT_DIR}/src/rr_types.c
#        ${pdnsd_ROOT_DIR}/src/servers.c
#        ${pdnsd_ROOT_DIR}/src/status.c
#        ${pdnsd_ROOT_DIR}/src/thread.c
#        ${pdnsd_ROOT_DIR}/src/cache.h
#        ${pdnsd_ROOT_DIR}/src/conff.h
#        ${pdnsd_ROOT_DIR}/src/conf-keywords.h
#        ${pdnsd_ROOT_DIR}/src/conf-parser.h
#        ${pdnsd_ROOT_DIR}/src/consts.h
#        ${pdnsd_ROOT_DIR}/src/debug.h
#        ${pdnsd_ROOT_DIR}/src/dns.h
#        ${pdnsd_ROOT_DIR}/src/dns_answer.h
#        ${pdnsd_ROOT_DIR}/src/dns_query.h
#        ${pdnsd_ROOT_DIR}/src/error.h
#        ${pdnsd_ROOT_DIR}/src/freebsd_netinet_ip_icmp.h
#        ${pdnsd_ROOT_DIR}/src/hash.h
#        ${pdnsd_ROOT_DIR}/src/helpers.h
#        ${pdnsd_ROOT_DIR}/src/icmp.h
#        ${pdnsd_ROOT_DIR}/src/ipvers.h
#        ${pdnsd_ROOT_DIR}/src/list.h
#        ${pdnsd_ROOT_DIR}/src/netdev.h
#        ${pdnsd_ROOT_DIR}/src/pdnsd_assert.h
#        ${pdnsd_ROOT_DIR}/src/rr_types.h
#        ${pdnsd_ROOT_DIR}/src/servers.h
#        ${pdnsd_ROOT_DIR}/src/status.h
#        ${pdnsd_ROOT_DIR}/src/thread.h
#)

include_directories(
        ${pdnsd_ROOT_DIR}
        ${libancillary_ROOT_DIR}
        ${CMAKE_CURRENT_LIST_DIR}/../include/pdnsd
)

add_definitions(-DANDROID)

add_executable(
        pdnsd
        ${pdnsd_SRC_FILE}
)

find_library(
        log-lib
        log
)

target_link_libraries(
        pdnsd
        libancillary
        ${log-lib}
)
