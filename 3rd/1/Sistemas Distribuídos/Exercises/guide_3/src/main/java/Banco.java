import java.util.HashMap;
import java.util.concurrent.locks.ReentrantLock;

public class Banco {
  private HashMap<Integer, Conta> contas;
  private ReentrantLock lockBanco;

  public Banco() {
    this.contas = new HashMap<>();
    this.lockBanco = new ReentrantLock();
  }

  public double consultarConta(int id) throws ContaInvalida {
    if (!contas.containsKey(id)) {
      throw new ContaInvalida(id);
    }
    return contas.get(id).consultar();
  }

  public void levantarConta(int id, double valor) throws ContaInvalida {
    if (!contas.containsKey(id)) {
      throw new ContaInvalida(id);
    }
    this.contas.get(id).levantar(valor);
  }
}
