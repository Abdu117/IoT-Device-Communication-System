#include "channel_factory.hpp"

int main() {
    // Create a Server Channel with a udp Socket
    std::cout<<"------------------------------\n";
    std::cout<<"|            SERVER          |\n";
    std::cout<<"------------------------------\n";
    Channel* udpServerChannel = ChannelFactory::createChannel(ChannelType::Server, SocketType::UDP_MULTICAST);
    if (udpServerChannel) {
        udpServerChannel->start();
        for(int i=0;i<10;i++){
        udpServerChannel->send("Hello from the UDP Server Channel!");
        sleep(5);
        }
        //udpServerChannel->receive();
        udpServerChannel->stop();
        delete udpServerChannel;
    }
    }