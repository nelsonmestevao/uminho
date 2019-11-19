import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Connection implements Runnable {
    public static int port = 12345;
    public static String hostname = "127.0.0.1";
    private int id;
    private Socket socket;

    public Connection(Socket socket, int id) {
        this.socket = socket;
        this.id = id;
    }

    public void run() {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(this.socket.getInputStream()));
            PrintWriter out = new PrintWriter(this.socket.getOutputStream());
            String message;

            while ((message = in.readLine()) != null && !message.equals("quit")) {
                out.println("Reply from server: " + message);
                out.flush();
            }

            this.socket.shutdownOutput();
            this.socket.shutdownInput();
            this.socket.close();
            System.out.println("$> Connection " + this.id + " finished!");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
