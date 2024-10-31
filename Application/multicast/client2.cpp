#include "channel_factory.hpp"

int main() {
    // Create a Client Channel with a udp Socket
    std::cout<<"------------------------------\n";
    std::cout<<"|           CLIENT 2         |\n";
    std::cout<<"------------------------------\n";
    Channel* udpClientChannel = ChannelFactory::createChannel(ChannelType::Client, SocketType::UDP_MULTICAST);
    if (udpClientChannel) {
        udpClientChannel->start();
        while(1){
        udpClientChannel->receive();
        }
        udpClientChannel->stop();
        delete udpClientChannel;
    }
    }