package server;

import model.Banco;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    private static ServerSocket socket;
    private static Banco banco;

    public static void main(String[] args) {

        Server.banco = new Banco();

        try {
            Server.socket = new ServerSocket(Session.port);
            System.out.println("$> server.Server on port: " + Session.port);
        } catch (IOException e) {
            e.printStackTrace();
        }

        int i = 1;
        while (true) {
            try {
                System.out.println("$> Waiting for connection...");
                Socket clientServer = Server.socket.accept();
                System.out.println("$> Connection " + i + " established!");
                new Thread(new Session(clientServer, i, banco)).start();
            } catch (IOException e) {
                e.printStackTrace();
            }
            i++;
        }
    }


}
