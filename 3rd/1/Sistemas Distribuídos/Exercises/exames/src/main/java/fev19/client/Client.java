package fev19.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client {
    private static final String HOSTNAME = "127.0.0.1";
    private static final int PORT = 12345;

    private Socket socket;
    private BufferedReader input;
    private BufferedReader in;
    private PrintWriter out;

    public Client() {
    }

    public static void main(String[] args) {
        new Client().startUp();
    }

    public void startUp() {
        try {
            this.socket = new Socket(HOSTNAME, PORT);
            this.in = new BufferedReader(new InputStreamReader(this.socket.getInputStream()));
            this.out = new PrintWriter(this.socket.getOutputStream(), true);
            this.input = new BufferedReader(new InputStreamReader(System.in));

            String command;
            while ((command = this.input.readLine()) != null || command.equalsIgnoreCase("quit")) {
                this.out.println(command);
            }

            this.socket.shutdownOutput();
            this.socket.shutdownInput();
            this.socket.close();

            System.out.println("Bye");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
