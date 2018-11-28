
cmake_minimum_required(VERSION 3.4.1)
project(event C)

set(CMAKE_C_STANDARD 11)

set(
        libevent_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../libevent
)

include_directories(
        ${libevent_ROOT_DIR}
        ${libevent_ROOT_DIR}/include
)

set(
        libevent_SRC_FILE
        ${libevent_ROOT_DIR}/buffer.c
        ${libevent_ROOT_DIR}/bufferevent.c
        ${libevent_ROOT_DIR}/bufferevent_filter.c
        ${libevent_ROOT_DIR}/bufferevent_pair.c
        ${libevent_ROOT_DIR}/bufferevent_ratelim.c
        ${libevent_ROOT_DIR}/bufferevent_sock.c
        ${libevent_ROOT_DIR}/epoll.c
        ${libevent_ROOT_DIR}/epoll_sub.c
        ${libevent_ROOT_DIR}/evdns.c
        ${libevent_ROOT_DIR}/event.c
        ${libevent_ROOT_DIR}/event_tagging.c
        ${libevent_ROOT_DIR}/evmap.c
        ${libevent_ROOT_DIR}/evrpc.c
        ${libevent_ROOT_DIR}/evthread.c
        ${libevent_ROOT_DIR}/evthread_pthread.c
        ${libevent_ROOT_DIR}/evutil.c
        ${libevent_ROOT_DIR}/evutil_rand.c
        ${libevent_ROOT_DIR}/http.c
        ${libevent_ROOT_DIR}/listener.c
        ${libevent_ROOT_DIR}/log.c
        ${libevent_ROOT_DIR}/poll.c
        ${libevent_ROOT_DIR}/select.c
        ${libevent_ROOT_DIR}/signal.c
        ${libevent_ROOT_DIR}/strlcpy.c
)


add_library(
        libevent
        STATIC
        ${libevent_SRC_FILE}
)
