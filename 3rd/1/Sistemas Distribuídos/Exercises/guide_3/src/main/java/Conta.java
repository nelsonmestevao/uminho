import java.util.concurrent.locks.ReentrantLock;

public class Conta {
  private int id;
  private double saldo;
  private ReentrantLock lockConta;

  public Conta(int id, double saldo) {
    this.id = id;
    this.saldo = saldo;
    this.lockConta = new ReentrantLock();
  }

  public double consultar() {
    return this.saldo;
  }

  public void depositar(double valor) {
    this.saldo += valor;
  }

  public void levantar(double valor) {
    if (valor < this.saldo) {
      this.saldo -= valor;
    }
  }

  public int getID() {
    return this.id;
  }

  public void lock() {
    this.lockConta.lock();
  }

  public void unlock() {
    this.lockConta.unlock();
  }
}
