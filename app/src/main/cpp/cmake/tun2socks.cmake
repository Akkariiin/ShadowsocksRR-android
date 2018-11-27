
cmake_minimum_required(VERSION 3.4.1)
project(tun2socks C)

set(CMAKE_C_STANDARD 99)

set(
        tun2socks_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../tun2socks
)
set(
        badvpn_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../badvpn
)
set(
        libancillary_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../libancillary
)

add_definitions(BADVPN_BREACTOR_BADVPN)
add_definitions(BADVPN_LINUX)
add_definitions(BADVPN_THREADWORK_USE_PTHREAD)
add_definitions(BADVPN_USE_SELFPIPE)
add_definitions(BADVPN_USE_EPOLL)
add_definitions(BADVPN_LITTLE_ENDIAN)
add_definitions(BADVPN_THREAD_SAFE)
add_definitions(NDEBUG)
add_definitions(ANDROID)

include_directories(
        ${libancillary_ROOT_DIR}
        ${badvpn_ROOT_DIR}
        ${badvpn_ROOT_DIR}/lwip/src/include/ipv4
        ${badvpn_ROOT_DIR}/lwip/src/include/ipv6
        ${badvpn_ROOT_DIR}/lwip/src/include
        ${badvpn_ROOT_DIR}/lwip/custom
)

set(
        tun2socks_SRC_FILE
        ${tun2socks_ROOT_DIR}/base/BLog_syslog.c
        ${tun2socks_ROOT_DIR}/system/BReactor_badvpn.c
        ${tun2socks_ROOT_DIR}/system/BSignal.c
        ${tun2socks_ROOT_DIR}/system/BConnection_common.c
        ${tun2socks_ROOT_DIR}/system/BConnection_unix.c
        ${tun2socks_ROOT_DIR}/system/BTime.c
        ${tun2socks_ROOT_DIR}/system/BUnixSignal.c
        ${tun2socks_ROOT_DIR}/system/BNetwork.c
        ${tun2socks_ROOT_DIR}/flow/StreamRecvInterface.c
        ${tun2socks_ROOT_DIR}/flow/PacketRecvInterface.c
        ${tun2socks_ROOT_DIR}/flow/PacketPassInterface.c
        ${tun2socks_ROOT_DIR}/flow/StreamPassInterface.c
        ${tun2socks_ROOT_DIR}/flow/SinglePacketBuffer.c
        ${tun2socks_ROOT_DIR}/flow/BufferWriter.c
        ${tun2socks_ROOT_DIR}/flow/PacketBuffer.c
        ${tun2socks_ROOT_DIR}/flow/PacketStreamSender.c
        ${tun2socks_ROOT_DIR}/flow/PacketPassConnector.c
        ${tun2socks_ROOT_DIR}/flow/PacketProtoFlow.c
        ${tun2socks_ROOT_DIR}/flow/PacketPassFairQueue.c
        ${tun2socks_ROOT_DIR}/flow/PacketProtoEncoder.c
        ${tun2socks_ROOT_DIR}/flow/PacketProtoDecoder.c
        ${tun2socks_ROOT_DIR}/socksclient/BSocksClient.c
        ${tun2socks_ROOT_DIR}/tuntap/BTap.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/timers.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/udp.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/memp.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/init.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/pbuf.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/tcp.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/tcp_out.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/netif.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/def.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/mem.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/tcp_in.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/stats.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/inet_chksum.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv4/icmp.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv4/igmp.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv4/ip4_addr.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv4/ip_frag.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv4/ip4.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv4/autoip.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv6/ethip6.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv6/inet6.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv6/ip6_addr.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv6/mld6.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv6/dhcp6.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv6/icmp6.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv6/ip6.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv6/ip6_frag.c
        ${tun2socks_ROOT_DIR}/lwip/src/core/ipv6/nd6.c
        ${tun2socks_ROOT_DIR}/lwip/custom/sys.c
        ${tun2socks_ROOT_DIR}/tun2socks/tun2socks.c
        ${tun2socks_ROOT_DIR}/base/DebugObject.c
        ${tun2socks_ROOT_DIR}/base/BLog.c
        ${tun2socks_ROOT_DIR}/base/BPending.c
        ${tun2socks_ROOT_DIR}/system/BDatagram_unix.c
        ${tun2socks_ROOT_DIR}/flowextra/PacketPassInactivityMonitor.c
        ${tun2socks_ROOT_DIR}/tun2socks/SocksUdpGwClient.c
        ${tun2socks_ROOT_DIR}/udpgw_client/UdpGwClient.c
)


add_executable(
        tun2socks
        ${tun2socks_SRC_FILE}
)

find_library(
        log-lib
        log
)

target_link_libraries(
        tun2socks
        libancillary
        ${log-lib}
)
