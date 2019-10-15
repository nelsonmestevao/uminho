public class ContaInvalida extends Exception {
  public ContaInvalida() {
    super();
  }
  public ContaInvalida(int error) {
    super("Erro conta: " + error);
  }
}
