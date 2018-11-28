
cmake_minimum_required(VERSION 3.4.1)
project(mbedtls C)

set(CMAKE_C_STANDARD 11)

set(
        mbedtls_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../mbedtls
)
set(
        libancillary_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../libancillary
)


include_directories(
        ${mbedtls_ROOT_DIR}/include
)

# https://stackoverflow.com/questions/3201154/automatically-add-all-files-in-a-folder-to-a-target-using-cmake
file(
        GLOB mbedtls_SRC_FILE
        "${mbedtls_ROOT_DIR}/library/*.h"
        "${mbedtls_ROOT_DIR}/library/*.c"
)
#set(
#        mbedtls_SRC_FILE
#        #${mbedtls_ROOT_DIR}/library/*.c
#        ${mbedtls_ROOT_DIR}/library/aes.c
#        ${mbedtls_ROOT_DIR}/library/aesni.c
#        ${mbedtls_ROOT_DIR}/library/arc4.c
#        ${mbedtls_ROOT_DIR}/library/aria.c
#        ${mbedtls_ROOT_DIR}/library/asn1parse.c
#        ${mbedtls_ROOT_DIR}/library/asn1write.c
#        ${mbedtls_ROOT_DIR}/library/base64.c
#        ${mbedtls_ROOT_DIR}/library/bignum.c
#        ${mbedtls_ROOT_DIR}/library/blowfish.c
#        ${mbedtls_ROOT_DIR}/library/camellia.c
#        ${mbedtls_ROOT_DIR}/library/ccm.c
#        ${mbedtls_ROOT_DIR}/library/certs.c
#        ${mbedtls_ROOT_DIR}/library/chacha20.c
#        ${mbedtls_ROOT_DIR}/library/chachapoly.c
#        ${mbedtls_ROOT_DIR}/library/cipher.c
#        ${mbedtls_ROOT_DIR}/library/cipher_wrap.c
#        ${mbedtls_ROOT_DIR}/library/cmac.c
#        ${mbedtls_ROOT_DIR}/library/ctr_drbg.c
#        ${mbedtls_ROOT_DIR}/library/debug.c
#        ${mbedtls_ROOT_DIR}/library/des.c
#        ${mbedtls_ROOT_DIR}/library/dhm.c
#        ${mbedtls_ROOT_DIR}/library/ecdh.c
#        ${mbedtls_ROOT_DIR}/library/ecdsa.c
#        ${mbedtls_ROOT_DIR}/library/ecjpake.c
#        ${mbedtls_ROOT_DIR}/library/ecp.c
#        ${mbedtls_ROOT_DIR}/library/ecp_curves.c
#        ${mbedtls_ROOT_DIR}/library/entropy.c
#        ${mbedtls_ROOT_DIR}/library/entropy_poll.c
#        ${mbedtls_ROOT_DIR}/library/error.c
#        ${mbedtls_ROOT_DIR}/library/gcm.c
#        ${mbedtls_ROOT_DIR}/library/havege.c
#        ${mbedtls_ROOT_DIR}/library/hkdf.c
#        ${mbedtls_ROOT_DIR}/library/hmac_drbg.c
#        ${mbedtls_ROOT_DIR}/library/md.c
#        ${mbedtls_ROOT_DIR}/library/md_wrap.c
#        ${mbedtls_ROOT_DIR}/library/md2.c
#        ${mbedtls_ROOT_DIR}/library/md4.c
#        ${mbedtls_ROOT_DIR}/library/md5.c
#        ${mbedtls_ROOT_DIR}/library/memory_buffer_alloc.c
#        ${mbedtls_ROOT_DIR}/library/net_sockets.c
#        ${mbedtls_ROOT_DIR}/library/nist_kw.c
#        ${mbedtls_ROOT_DIR}/library/oid.c
#        ${mbedtls_ROOT_DIR}/library/padlock.c
#        ${mbedtls_ROOT_DIR}/library/pem.c
#        ${mbedtls_ROOT_DIR}/library/pk.c
#        ${mbedtls_ROOT_DIR}/library/pk_wrap.c
#        ${mbedtls_ROOT_DIR}/library/pkcs11.c
#        ${mbedtls_ROOT_DIR}/library/pkcs12.c
#        ${mbedtls_ROOT_DIR}/library/pkcs5.c
#        ${mbedtls_ROOT_DIR}/library/pkparse.c
#        ${mbedtls_ROOT_DIR}/library/pkwrite.c
#        ${mbedtls_ROOT_DIR}/library/platform.c
#        ${mbedtls_ROOT_DIR}/library/platform_util.c
#        ${mbedtls_ROOT_DIR}/library/poly1305.c
#        ${mbedtls_ROOT_DIR}/library/ripemd160.c
#        ${mbedtls_ROOT_DIR}/library/rsa.c
#        ${mbedtls_ROOT_DIR}/library/rsa_internal.c
#        ${mbedtls_ROOT_DIR}/library/sha1.c
#        ${mbedtls_ROOT_DIR}/library/sha256.c
#        ${mbedtls_ROOT_DIR}/library/sha512.c
#        ${mbedtls_ROOT_DIR}/library/ssl_cache.c
#        ${mbedtls_ROOT_DIR}/library/ssl_ciphersuites.c
#        ${mbedtls_ROOT_DIR}/library/ssl_cli.c
#        ${mbedtls_ROOT_DIR}/library/ssl_cookie.c
#        ${mbedtls_ROOT_DIR}/library/ssl_srv.c
#        ${mbedtls_ROOT_DIR}/library/ssl_ticket.c
#        ${mbedtls_ROOT_DIR}/library/ssl_tls.c
#        ${mbedtls_ROOT_DIR}/library/threading.c
#        ${mbedtls_ROOT_DIR}/library/timing.c
#        ${mbedtls_ROOT_DIR}/library/version.c
#        ${mbedtls_ROOT_DIR}/library/version_features.c
#        ${mbedtls_ROOT_DIR}/library/x509.c
#        ${mbedtls_ROOT_DIR}/library/x509_create.c
#        ${mbedtls_ROOT_DIR}/library/x509_crl.c
#        ${mbedtls_ROOT_DIR}/library/x509_crt.c
#        ${mbedtls_ROOT_DIR}/library/x509_csr.c
#        ${mbedtls_ROOT_DIR}/library/x509write_crt.c
#        ${mbedtls_ROOT_DIR}/library/x509write_csr.c
#        ${mbedtls_ROOT_DIR}/library/xtea.c
#)


add_library(
        mbedtls
        STATIC
        ${mbedtls_SRC_FILE}
)


