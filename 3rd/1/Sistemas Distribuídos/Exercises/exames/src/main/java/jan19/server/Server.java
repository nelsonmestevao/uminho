package jan19.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    private static final int TEMPO_VIAGEM = 5 * 500; // em minutos
    private static final int PORT = 12345;

    private ServerSocket socket;
    private Shuttle shuttle;

    public Server() {
        this.shuttle = new Shuttle();
    }

    public static void main(String[] args) {
        new Server().startUp();
    }

    public void startUp() {
        try {
            this.socket = new ServerSocket(PORT);

            System.out.println("Server is up at " + this.socket.getLocalSocketAddress());

            new Thread(new Motorista(this.shuttle)).start();

            for (int i = 0; i < 50; i++) {
                new Thread(new Viajante(this.shuttle, i % 5, (i + 3) % 5)).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
