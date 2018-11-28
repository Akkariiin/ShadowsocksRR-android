
cmake_minimum_required(VERSION 3.4.1)
project(tun2socks C)

set(CMAKE_C_STANDARD 99)

set(
        badvpn_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../badvpn
)
set(
        libancillary_ROOT_DIR
        ${CMAKE_CURRENT_LIST_DIR}/../libancillary
)

add_definitions(-DBADVPN_BREACTOR_BADVPN)
add_definitions(-DBADVPN_LINUX)
add_definitions(-DBADVPN_THREADWORK_USE_PTHREAD)
add_definitions(-DBADVPN_USE_SELFPIPE)
add_definitions(-DBADVPN_USE_EPOLL)
add_definitions(-DBADVPN_LITTLE_ENDIAN)
add_definitions(-DBADVPN_THREAD_SAFE)
add_definitions(-DNDEBUG)
add_definitions(-DANDROID)

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
        ${badvpn_ROOT_DIR}/base/BLog_syslog.c
        ${badvpn_ROOT_DIR}/system/BReactor_badvpn.c
        ${badvpn_ROOT_DIR}/system/BSignal.c
        ${badvpn_ROOT_DIR}/system/BConnection_common.c
        ${badvpn_ROOT_DIR}/system/BConnection_unix.c
        ${badvpn_ROOT_DIR}/system/BTime.c
        ${badvpn_ROOT_DIR}/system/BUnixSignal.c
        ${badvpn_ROOT_DIR}/system/BNetwork.c
        ${badvpn_ROOT_DIR}/flow/StreamRecvInterface.c
        ${badvpn_ROOT_DIR}/flow/PacketRecvInterface.c
        ${badvpn_ROOT_DIR}/flow/PacketPassInterface.c
        ${badvpn_ROOT_DIR}/flow/StreamPassInterface.c
        ${badvpn_ROOT_DIR}/flow/SinglePacketBuffer.c
        ${badvpn_ROOT_DIR}/flow/BufferWriter.c
        ${badvpn_ROOT_DIR}/flow/PacketBuffer.c
        ${badvpn_ROOT_DIR}/flow/PacketStreamSender.c
        ${badvpn_ROOT_DIR}/flow/PacketPassConnector.c
        ${badvpn_ROOT_DIR}/flow/PacketProtoFlow.c
        ${badvpn_ROOT_DIR}/flow/PacketPassFairQueue.c
        ${badvpn_ROOT_DIR}/flow/PacketProtoEncoder.c
        ${badvpn_ROOT_DIR}/flow/PacketProtoDecoder.c
        ${badvpn_ROOT_DIR}/socksclient/BSocksClient.c
        ${badvpn_ROOT_DIR}/tuntap/BTap.c
        ${badvpn_ROOT_DIR}/lwip/src/core/timers.c
        ${badvpn_ROOT_DIR}/lwip/src/core/udp.c
        ${badvpn_ROOT_DIR}/lwip/src/core/memp.c
        ${badvpn_ROOT_DIR}/lwip/src/core/init.c
        ${badvpn_ROOT_DIR}/lwip/src/core/pbuf.c
        ${badvpn_ROOT_DIR}/lwip/src/core/tcp.c
        ${badvpn_ROOT_DIR}/lwip/src/core/tcp_out.c
        ${badvpn_ROOT_DIR}/lwip/src/core/netif.c
        ${badvpn_ROOT_DIR}/lwip/src/core/def.c
        ${badvpn_ROOT_DIR}/lwip/src/core/mem.c
        ${badvpn_ROOT_DIR}/lwip/src/core/tcp_in.c
        ${badvpn_ROOT_DIR}/lwip/src/core/stats.c
        ${badvpn_ROOT_DIR}/lwip/src/core/inet_chksum.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv4/icmp.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv4/igmp.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv4/ip4_addr.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv4/ip_frag.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv4/ip4.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv4/autoip.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv6/ethip6.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv6/inet6.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv6/ip6_addr.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv6/mld6.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv6/dhcp6.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv6/icmp6.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv6/ip6.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv6/ip6_frag.c
        ${badvpn_ROOT_DIR}/lwip/src/core/ipv6/nd6.c
        ${badvpn_ROOT_DIR}/lwip/custom/sys.c
        ${badvpn_ROOT_DIR}/tun2socks/tun2socks.c
        ${badvpn_ROOT_DIR}/base/DebugObject.c
        ${badvpn_ROOT_DIR}/base/BLog.c
        ${badvpn_ROOT_DIR}/base/BPending.c
        ${badvpn_ROOT_DIR}/system/BDatagram_unix.c
        ${badvpn_ROOT_DIR}/flowextra/PacketPassInactivityMonitor.c
        ${badvpn_ROOT_DIR}/tun2socks/SocksUdpGwClient.c
        ${badvpn_ROOT_DIR}/udpgw_client/UdpGwClient.c
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
