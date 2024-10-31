#include "channel_factory.hpp"

int main() {
    // Create a Client Channel with a TCP Socket
    std::cout<<"------------------------------\n";
    std::cout<<"|            CLIENT          |\n";
    std::cout<<"------------------------------\n";
    Channel* tcpClientChannel = ChannelFactory::createChannel(ChannelType::Client, SocketType::TCP);
    if (tcpClientChannel) {
        tcpClientChannel->start();
        tcpClientChannel->receive();
        sleep(2);
        tcpClientChannel->send("Hello from the TCP Client Channel!");
        tcpClientChannel->stop();
        delete tcpClientChannel;
    }
    }