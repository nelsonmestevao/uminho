public class HotelPremium extends Hotel implements CartaoHoteis {
    private double taxa;
    private int pontos;

    public HotelPremium() {
        super();
        this.taxa = 20;
        pontos = 0;
    }

    public HotelPremium(String codigo, String nome, String localidade, int categoria, int numeroQuartos, int preco, double taxa, int pontos) {
        super(codigo, nome, localidade, categoria, numeroQuartos, preco);
        this.taxa = taxa;
        this.pontos = pontos;
    }

    public HotelPremium(HotelPremium h) {
        super(h);
        this.taxa = h.getTaxa();
        this.pontos = h.getPontos();
    }

    public double getTaxa() {
        return this.taxa;
    }

    public void setTaxa(double taxa) {
        this.taxa = taxa;
    }

    public int getPontos() {
        return this.pontos;
    }

    public void setPontos(int pontos) {
        this.pontos = pontos;
    }

    @Override
    public double precoNoite() {
        return super.getPreco() + taxa;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        HotelPremium that = (HotelPremium) o;

        return this.taxa == that.getTaxa();
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (int) this.taxa;
        return result;
    }

    @Override
    public HotelPremium clone() {
        return new HotelPremium(this);
    }

    @Override
    public String toString() {
        return "Hotel Standard {" +
                super.toString() +
                ", taxa=" + this.taxa +
                ", pontos=" + this.pontos +
                '}';
    }
}
