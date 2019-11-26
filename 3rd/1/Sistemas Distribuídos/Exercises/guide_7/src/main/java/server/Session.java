package server;

import exceptions.ContaInvalida;
import model.Banco;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Session implements Runnable {
    public static int port = 12345;
    public static String hostname = "127.0.0.1";
    private int id;
    private Socket socket;
    private Banco banco;

    public Session(Socket socket, int id, Banco banco) {
        this.socket = socket;
        this.id = id;
        this.banco = banco;
    }

    public void run() {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(this.socket.getInputStream()));
            PrintWriter out = new PrintWriter(this.socket.getOutputStream());
            String message;

            while ((message = in.readLine()) != null && !message.equals("quit")) {
                String[] cmd = message.split(" ");
                switch (cmd[0]) {
                    case "criar_conta":
                        int id = this.banco.criarConta(Integer.parseInt(cmd[1]));
                        out.println("Conta " + id + " criada");
                        break;
                    case "fechar_conta":
                        try {
                            double saldo = this.banco.fecharConta(Integer.parseInt(cmd[1]));
                            out.println("Saldo levantado: " + saldo);

                        } catch (ContaInvalida e) {
                            out.println(e.toString());
                        }
                        break;
                    case "consultar_conta":
                        try {
                            double saldo = this.banco.consultar(Integer.parseInt(cmd[1]));
                            out.println("Saldo: " + saldo);
                        } catch (ContaInvalida e) {
                            out.println(e.toString());
                        }
                        break;
                    case "levantar":
                        try {
                            double valor = Double.parseDouble(cmd[2]);
                            int conta = Integer.parseInt(cmd[1]);
                            this.banco.levantar(conta, valor);
                            out.println("Levantado " + valor + " da conta " + conta);
                        } catch (ContaInvalida e) {
                            out.println(e.toString());
                        }
                        break;
                    case "depositar":
                        break;
                    case "transferir":
                    default:
                        out.println("Operação não suportada!");
                }
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
