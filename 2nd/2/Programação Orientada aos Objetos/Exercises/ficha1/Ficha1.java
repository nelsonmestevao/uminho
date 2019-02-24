package ficha1;

public class Ficha1 {

  /**
   * Converte celcius para farenheit
   * @param graus valor em graus
   * @return valor convertido
   */
  public double celsiusParaFarenheit(double graus) {
    return graus * 1.8 + 32;
  }

  public int maximoNumeros(int a, int b) {
    int r = a > b ? a : b;
    return r;
  }

  public String criaDescricaoConta(String nome, double saldo) {
    return nome + " " + saldo;
  }

  public double eurosParaLibras(double valor, double taxaConversao) {
    return valor * taxaConversao;
  }

  public long factorial(int num) {
    long r = 1;
    for(int i = 1; i <= num; i++) r *= i;
    return r;
  }

}
