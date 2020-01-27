package jan19.server;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Shuttle implements Controlador {
    private static final int CAPACIDADE = 30;
    private static final int LIMITE_MINIMO_PASSAGEIROS = 10;
    private static final int NUM_TERMINAIS = 5;

    private Lock lock;
    private Condition aEntrar;
    private Condition aSair;
    private Condition isEnough;

    private int lugaresOcupados;
    private int terminalAtual;
    private boolean emCurso;

    public Shuttle() {
        this.lock = new ReentrantLock(true);
        this.aEntrar = this.lock.newCondition();
        this.aSair = this.lock.newCondition();
        this.isEnough = this.lock.newCondition();
        this.lugaresOcupados = 0;
        this.terminalAtual = 1;
        this.emCurso = false;
    }

    public void start() {
        this.lock.lock();
        try {
            while (this.lugaresOcupados < LIMITE_MINIMO_PASSAGEIROS) {
                System.out.println("À espera de ter 10 clientes em " + this.terminalAtual + "(" + this.lugaresOcupados + ")");
                isEnough.await();
            }

            System.out.println("Viagem iniciada em " + this.terminalAtual);
            this.emCurso = true;

        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            this.lock.unlock();
        }
    }

    public void stop() {
        this.lock.lock();
        this.terminalAtual = (this.terminalAtual + 1) % NUM_TERMINAIS;
        System.out.println("Parado em " + this.terminalAtual);
        this.emCurso = false;
        this.aSair.signalAll();
        this.lock.unlock();
    }

    public void requisita_viagem(int origem, int destino) {
        this.lock.lock();
        try {
            while (origem != this.terminalAtual || (CAPACIDADE - this.lugaresOcupados) == 0 || this.emCurso) {
                System.out.println("À espera para entrar em " + origem);
                this.aEntrar.await();
            }
            this.lugaresOcupados++;
            System.out.println("Entrei em " + origem + " e vou sair em " + destino);
            this.isEnough.signal();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            this.lock.unlock();
        }
    }

    public void espera(int destino) {
        this.lock.lock();
        try {
            while (destino != this.terminalAtual || this.emCurso) {
                System.out.println("Estou à espera para sair em " + destino);
                this.aSair.await();
            }
            this.lugaresOcupados--;
            System.out.println("Saí em " + destino);
            this.aEntrar.signalAll();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            this.lock.unlock();
        }
    }
}
