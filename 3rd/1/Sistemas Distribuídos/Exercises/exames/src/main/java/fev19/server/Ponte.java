package fev19.server;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Ponte implements Control {
    private static final int TEMPO_DE_ESPERA = 5000;

    private Lock lock;
    private Condition rio_livre;
    private Condition ponte_em_baixo;

    private int num_carros;
    private int pedidos_barcos;
    private boolean barco_a_passar;

    public Ponte() {
        this.lock = new ReentrantLock(true);
        this.rio_livre = this.lock.newCondition();
        this.ponte_em_baixo = this.lock.newCondition();

        this.num_carros = 0;
        this.pedidos_barcos = 0;
        this.barco_a_passar = false;
    }

    @Override
    public void entra_carro() throws InterruptedException {
        this.lock.lock();

        while (barco_a_passar || pedidos_barcos > 0) {
            this.ponte_em_baixo.await();
        }

        this.lock.unlock();
    }

    @Override
    public void sai_carro() {

    }

    @Override
    public void entra_barco() {
        try {
            Thread.sleep(TEMPO_DE_ESPERA);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void sai_barco() {

    }
}
