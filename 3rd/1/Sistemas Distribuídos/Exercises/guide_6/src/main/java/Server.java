import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    private static int port = 12345;
    private static ServerSocket socket;

    public static void main(String[] args) {
        try {
            Server.socket = new ServerSocket(Server.port);

        } catch (IOException e) {
            e.printStackTrace();
        }

        while (true) {
            try {
                Socket clientServer = Server.socket.accept();
                BufferedReader in = new BufferedReader(new InputStreamReader(clientServer.getInputStream()));
                PrintWriter out = new PrintWriter(clientServer.getOutputStream());
                String message;

                do {
                    message = in.readLine();
                    out.println(message);
                    out.flush();
                } while (message != null);

                clientServer.shutdownOutput();
                clientServer.shutdownInput();
                clientServer.close();

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
