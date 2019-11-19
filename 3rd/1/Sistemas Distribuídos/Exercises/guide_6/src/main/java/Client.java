import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client {

    public static void main(String[] args) {
        try {
            Socket socket = new Socket(Connection.hostname, Connection.port);

            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream());

            BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

            String message;

            while ((message = input.readLine()) != null && !message.equals("quit")) {
                out.println(message);
                out.flush();
                System.out.println(in.readLine());
            }

            socket.shutdownOutput();
            socket.shutdownInput();
            socket.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
