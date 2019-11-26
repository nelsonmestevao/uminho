package model;

public class Movimento {
    int id_operacao;
    String descritivo;
    double valor;
    double saldo;

    public Movimento(int id_operacao, String descritivo, double valor, double saldo) {
        this.id_operacao = id_operacao;
        this.descritivo = descritivo;
        this.valor = valor;
        this.saldo = saldo;
    }

    public int getId_operacao() {
        return id_operacao;
    }

    public void setId_operacao(int id_operacao) {
        this.id_operacao = id_operacao;
    }

    public String getDescritivo() {
        return descritivo;
    }

    public void setDescritivo(String descritivo) {
        this.descritivo = descritivo;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
}
