package ficha5;

/**
 * Representacao de Linha de Encomendas
 *
 * @author MaterialPOO
 * @version 20180312
 */
public class LinhaEncomenda {
    private String referencia;
    private String descricao;
    private double preco;
    private int quantidade;
    private double imposto;
    private double desconto;

    public LinhaEncomenda() {
        this.referencia = "n/a";
        this.descricao = "n/a";
        this.preco = 0;
        this.quantidade = 0;
        this.imposto = 0;
        this.desconto = 0;
    }

    public LinhaEncomenda(String referencia, String descricao, double preco,
                int quantidade, double imposto, double desconto) {
        this.referencia = referencia;
        this.descricao = descricao;
        this.preco = preco;
        this.quantidade = quantidade;
        this.imposto = imposto;
        this.desconto = desconto;
    }

    public LinhaEncomenda(LinhaEncomenda linha) {
        this.referencia = linha.getReferencia();
        this.descricao = linha.getDescricao();
        this.preco = linha.getPreco();
        this.quantidade = linha.getQuantidade();
        this.imposto = linha.getImposto();
        this.desconto = linha.getDesconto();
    }

    /**
     * B)
     */
    public double calculaValorLinhaEnc() {
        double valor = quantidade * preco;
        valor -= valor*desconto;
        valor *= 1+imposto;
        return valor;
    }

    /**
     * C)
     */
    public double calculaValorDesconto() {
        double valor = quantidade * preco;
        valor *= imposto; //e.g. imposto = 1.06
        return this.calculaValorLinhaEnc()-valor;
    }

    public String getReferencia() {
        return this.referencia;
    }

     public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getDescricao() {
        return this.descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getPreco() {
        return this.preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getQuantidade() {
        return this.quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getImposto() {
        return this.imposto;
    }

    public void setImposto(double imposto) {
        this.imposto = imposto;
    }

    public double getDesconto() {
        return this.desconto;
    }

    public void setDesconto(double desconto) {
        this.desconto = desconto;
    }

    public LinhaEncomenda clone() {
        return new LinhaEncomenda(this);
    }

    public boolean equals(Object obj) {
        if(obj==this) return true;
        if(obj==null || obj.getClass() != this.getClass()) return false;
        LinhaEncomenda le = (LinhaEncomenda) obj;
        return le.getReferencia().equals(this.referencia) &&
              le.getDescricao().equals(this.descricao) &&
              le.getPreco() == this.preco;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Referencia: ").append(this.referencia);
        //..
        return sb.toString();
    }

}
