
cmake_minimum_required(VERSION 3.4.1)
project(pcre C)

set(CMAKE_C_STANDARD 11)

set(
        pcre_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../pcre
)


set(
        pcre_SRC_FILE
        ${pcre_ROOT_DIR}/pcre_chartables.c
        ${pcre_ROOT_DIR}/dist/pcre_byte_order.c
        ${pcre_ROOT_DIR}/dist/pcre_compile.c
        ${pcre_ROOT_DIR}/dist/pcre_config.c
        ${pcre_ROOT_DIR}/dist/pcre_dfa_exec.c
        ${pcre_ROOT_DIR}/dist/pcre_exec.c
        ${pcre_ROOT_DIR}/dist/pcre_fullinfo.c
        ${pcre_ROOT_DIR}/dist/pcre_get.c
        ${pcre_ROOT_DIR}/dist/pcre_globals.c
        ${pcre_ROOT_DIR}/dist/pcre_jit_compile.c
        ${pcre_ROOT_DIR}/dist/pcre_maketables.c
        ${pcre_ROOT_DIR}/dist/pcre_newline.c
        ${pcre_ROOT_DIR}/dist/pcre_ord2utf8.c
        ${pcre_ROOT_DIR}/dist/pcre_refcount.c
        ${pcre_ROOT_DIR}/dist/pcre_string_utils.c
        ${pcre_ROOT_DIR}/dist/pcre_study.c
        ${pcre_ROOT_DIR}/dist/pcre_tables.c
        ${pcre_ROOT_DIR}/dist/pcre_ucd.c
        ${pcre_ROOT_DIR}/dist/pcre_valid_utf8.c
        ${pcre_ROOT_DIR}/dist/pcre_version.c
        ${pcre_ROOT_DIR}/dist/pcre_xclass.c
)

include_directories(
        ${pcre_ROOT_DIR}
        ${pcre_ROOT_DIR}/dist
)

add_definitions(HAVE_CONFIG_H)

add_library(
        pcre
        STATIC
        ${pcre_SRC_FILE}
)

