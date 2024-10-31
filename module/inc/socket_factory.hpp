#ifndef SOCKET_FACTORY
#define SOCKET_FACTORY

#include "socket.hpp"

enum class SocketType {
    TCP,
    UDP_MULTICAST
};

class SocketFactory {
public:
    static Socket* createSocket(SocketType socketType, IsServer isServer);
};

#endif
