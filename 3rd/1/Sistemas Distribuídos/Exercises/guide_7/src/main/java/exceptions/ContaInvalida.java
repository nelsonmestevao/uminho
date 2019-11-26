package exceptions;

public class ContaInvalida extends Exception {
    public ContaInvalida() {
        super();
    }

    public ContaInvalida(int id) {
        super("A Conta " + id + " é inválida!");
    }
}
