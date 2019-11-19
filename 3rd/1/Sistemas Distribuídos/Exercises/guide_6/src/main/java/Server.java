import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    private static ServerSocket socket;

    public static void main(String[] args) {
        try {
            Server.socket = new ServerSocket(Connection.port);
            System.out.println("$> Server on port: " + Connection.port);

        } catch (IOException e) {
            e.printStackTrace();
        }

        int i = 1;
        while (true) {
            try {
                System.out.println("$> Waiting for connection...");
                Socket clientServer = Server.socket.accept();
                System.out.println("$> Connection " + i + " established!");
                new Thread(new Connection(clientServer, i)).start();
            } catch (IOException e) {
                e.printStackTrace();
            }
            i++;
        }
    }


}
