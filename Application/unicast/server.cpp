#include "channel_factory.hpp"

int main() {
    // Create a Server Channel with a TCP Socket
    std::cout<<"------------------------------\n";
    std::cout<<"|            SERVER          |\n";
    std::cout<<"------------------------------\n";
    Channel* tcpServerChannel = ChannelFactory::createChannel(ChannelType::Server, SocketType::TCP);
    if (tcpServerChannel) {
        tcpServerChannel->start();
        tcpServerChannel->send("Hello from the TCP Server Channel!");
        tcpServerChannel->receive();
        tcpServerChannel->stop();
        delete tcpServerChannel;
    }
    }