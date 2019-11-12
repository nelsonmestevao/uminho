import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {
  private static int port = 12345;
  private static String address = "127.0.0.1";

  public static void main(String[] args) {
    try {
      Socket socket = new Socket(address, port);

      BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
      PrintWriter out = new PrintWriter(socket.getOutputStream());

      BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

      String message;

      do {
        message = input.readLine();
        out.println(message);
        out.flush();
      } while (message != null);

    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
