package jan19.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Session implements Runnable {
    private Socket client;
    private BufferedReader in;
    private PrintWriter out;

    private Shuttle shuttle;

    public Session(Shuttle shuttle, Socket client) throws IOException {
        this.shuttle = shuttle;
        this.client = client;
        this.in = new BufferedReader(new InputStreamReader(this.client.getInputStream()));
        this.out = new PrintWriter(this.client.getOutputStream(), true);
    }

    public void run() {
        System.out.println("Connected at " + client.getLocalSocketAddress());

        try {
            this.parse();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void parse() throws IOException {
        String message;
        while ((message = this.in.readLine()) != null) {
            String[] content = message.split(" ");

            switch (content[0]) {
                case "requisita_viagem":
                    this.shuttle.requisita_viagem(Integer.parseInt(content[1]), Integer.parseInt(content[2]));
                    break;
                case "espera":
                    this.shuttle.espera(Integer.parseInt(content[1]));
                    break;
                default:
                    out.println("Commando não supportado");
            }
        }
    }
}
