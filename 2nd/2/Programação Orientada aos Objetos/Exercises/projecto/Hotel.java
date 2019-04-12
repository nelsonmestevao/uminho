/**
 * Write a description of class Hotel here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Hotel {
    private String codigo;
    private String name;
    private String localidade;
    private int categoria; // 1 a 5
    private int numQuartos;
    private float preco;

    public Hotel(String codigo, String name, String localidade, int categoria, int numQuartos, float preco) {
        this.codigo = codigo;
        this.name = name;
        this.localidade = localidade;
        this.categoria = categoria;
        this.numQuartos = numQuartos;
        this.preco = preco;
    }

    public Hotel(Hotel h) {
        this.codigo = h.getCodigo();
        this.name = h.getName();
        this.localidade = h.getLocalidade();
        this.categoria = h.getCategoria();
        this.numQuartos = h.getCategoria();
        this.preco = h.getPreco();
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocalidade() {
        return localidade;
    }

    public void setLocalidade(String localidade) {
        this.localidade = localidade;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public int getNumQuartos() {
        return numQuartos;
    }

    public void setNumQuartos(int numQuartos) {
        this.numQuartos = numQuartos;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public Hotel clone() {
        return new Hotel(this);
    }

    @Override
    public java.lang.String toString() {
        return "Hotel{" +
                "codigo='" + codigo + '\'' +
                ", name='" + name + '\'' +
                ", localidade='" + localidade + '\'' +
                ", categoria=" + categoria +
                ", numQuartos=" + numQuartos +
                ", preco=" + preco +
                '}';
    }
}
