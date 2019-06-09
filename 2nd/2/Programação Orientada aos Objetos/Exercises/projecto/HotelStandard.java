public class HotelStandard extends Hotel implements CartaoHoteis {
    private boolean epocaAlta;
    private int pontos;

    public HotelStandard() {
        super();
        this.epocaAlta = false;
        pontos = 0;
    }

    public HotelStandard(String codigo, String nome, String localidade, int categoria, int numeroQuartos, int preco, boolean epocaAlta, int pontos) {
        super(codigo, nome, localidade, categoria, numeroQuartos, preco);
        this.epocaAlta = epocaAlta;
        this.pontos = pontos;
    }

    public HotelStandard(HotelStandard h) {
        super(h);
        this.epocaAlta = h.isEpocaAlta();
        this.pontos = h.getPontos();
    }

    public boolean isEpocaAlta() {
        return this.epocaAlta;
    }

    public void setEpocaAlta(boolean epocaAlta) {
        this.epocaAlta = epocaAlta;
    }

    public int getPontos() {
        return this.pontos;
    }

    public void setPontos(int pontos) {
        this.pontos = pontos;
    }

    @Override
    public double precoNoite() {
        return this.isEpocaAlta() ? (super.getPreco() + 20) : super.getPreco();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        HotelStandard that = (HotelStandard) o;

        return isEpocaAlta() == that.isEpocaAlta();
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (isEpocaAlta() ? 1 : 0);
        return result;
    }

    @Override
    public HotelStandard clone() {
        return new HotelStandard(this);
    }

    @Override
    public String toString() {
        return "Hotel Standard {" +
                super.toString() +
                ", epocaAlta=" + this.epocaAlta +
                ", pontos=" + this.pontos +
                '}';
    }
}
