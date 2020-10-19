package chat.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.List;

import chat.util.Parser;
import chat.view.Color;
import chat.view.Terminal;

public final class Client {
    private static final String HOSTNAME = System.getenv("APP_SERVER_HOSTNAME");
    private static final int PORT = Integer.parseInt(System.getenv("APP_SERVER_PORT"));

    private Socket socket;
    private BufferedReader in;
    private PrintWriter out;

    public Client() {}

    public static void main(final String[] args) {
        Client.welcome();
        new Client().startUp();
    }

    public void startUp() {
        try {
            this.connect();
            this.parse();
            this.disconnect();
        } catch (IOException e) {
            Terminal.error(e.getMessage());
            System.exit(1);
        }
    }

    public void parse() throws IOException {
        String message;
        while ((message = Terminal.input()) != null) {
            @SuppressWarnings("checkstyle:AvoidInlineConditionals")
            String command = message.contains(" ") ? message.split(" ")[0] : message;

            switch (command) {
                case "exit":
                case "quit":
                    this.disconnect();
                    System.exit(0);
                    break;
                default:
                    this.out.println(message);
            }
        }
    }

    public void connect() throws IOException {
        this.socket = new Socket(HOSTNAME, PORT);

        this.in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        this.out = new PrintWriter(socket.getOutputStream(), true);

        new Thread(
                        () -> {
                            try {
                                String message;
                                while ((message = in.readLine()) != null) {
                                    Terminal.show(message, Color.ANSI_BLUE);
                                }
                            } catch (NullPointerException e) {
                                Terminal.info("Server closed!");
                                System.exit(0);
                            } catch (IOException e) {
                                Terminal.error(e.getMessage());
                                System.exit(1);
                            }
                        })
                .start();

        Terminal.info("Client is up at " + socket.getLocalSocketAddress());
        Terminal.info("Session established with chat.server on " + socket.getRemoteSocketAddress());
    }

    public void disconnect() throws IOException {
        this.socket.shutdownOutput();
        this.socket.shutdownInput();
        this.socket.close();
    }

    public static void welcome() {
        Terminal.clear();
        List<String> logo =
                Parser.readFile(
                        Client.class.getResource("../../art/client.ascii").toString().split(":")[1]);
        Terminal.welcome(logo);
    }
}
