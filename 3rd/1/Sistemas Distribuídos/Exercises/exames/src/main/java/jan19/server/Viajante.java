package jan19.server;

public class Viajante implements Runnable {
    private Shuttle shuttle;

    private int origem;
    private int destino;

    public Viajante(Shuttle shuttle, int origem, int destino) {
        this.shuttle = shuttle;
        this.origem = origem;
        this.destino = destino;
    }

    @Override
    public void run() {
        this.shuttle.requisita_viagem(this.origem, this.destino);
        this.shuttle.espera(this.destino);
    }
}
