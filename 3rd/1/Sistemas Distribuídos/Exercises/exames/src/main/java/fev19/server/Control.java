package fev19.server;

public interface Control {
    void entra_carro() throws InterruptedException;
    void sai_carro();
    void entra_barco();
    void sai_barco();
}
