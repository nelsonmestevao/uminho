package chat.server;

import java.net.InetSocketAddress;
import java.nio.channels.AsynchronousChannelGroup;
import java.nio.channels.AsynchronousServerSocketChannel;
import java.nio.channels.CompletionHandler;
import java.util.concurrent.TimeUnit;

import static java.util.concurrent.Executors.defaultThreadFactory;

public class Echo {

    private static final CompletionHandler<AsynchronousServerSocketChannel, AsynchronousServerSocketChannel> handler = new CompletionHandler<AsynchronousServerSocketChannel, AsynchronousServerSocketChannel>() {

        @Override
        public void completed(AsynchronousServerSocketChannel asynchronousServerSocketChannel, AsynchronousServerSocketChannel server) {
            System.out.println("Connection Accepted");

            acceptConnections(server);
        }

        @Override
        public void failed(Throwable throwable, AsynchronousServerSocketChannel server) {
        }
    };

    public static void acceptConnections(AsynchronousServerSocketChannel server) {
        server.accept(server, handler);
    }

    public static void main(String[] args) throws Exception {
        AsynchronousChannelGroup pool = AsynchronousChannelGroup.withFixedThreadPool(1, defaultThreadFactory());
        AsynchronousServerSocketChannel server = AsynchronousServerSocketChannel.open(pool);

        server.bind(new InetSocketAddress(12345));

        acceptConnections(server);

        pool.awaitTermination(Long.MAX_VALUE, TimeUnit.DAYS);

        System.out.println("Done");
    }
}
