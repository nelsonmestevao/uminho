public abstract class Hotel implements Comparable<Hotel> {
    // Um Hotel é a entidade base da aplicação, que contém um codigo de identicação, um nome, uma localidade, uma
    // categoria (normalmente expressa em estrelas), um número de quartos disponíveis e um preço por quarto.
    String codigo;
    String nome;
    String localidade;
    int categoria; // número de estrelas (1..5)
    int numeroQuartos;
    int preco;

    public Hotel() {
        this.codigo = "";
        this.nome = "";
        this.localidade = "";
        this.categoria = 0;
        this.numeroQuartos = 0;
        this.preco = 0;
    }

    public Hotel(String codigo, String nome, String localidade, int categoria, int numeroQuartos, int preco) {
        this.codigo = codigo;
        this.nome = nome;
        this.localidade = localidade;
        this.categoria = categoria;
        this.numeroQuartos = numeroQuartos;
        this.preco = preco;
    }

    public Hotel(Hotel h) {
        this.codigo = h.getCodigo();
        this.nome = h.getNome();
        this.localidade = h.getLocalidade();
        this.categoria = h.getCategoria();
        this.numeroQuartos = h.getNumeroQuartos();
        this.preco = h.getPreco();
    }

    public String getCodigo() {
        return this.codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLocalidade() {
        return this.localidade;
    }

    public void setLocalidade(String localidade) {
        this.localidade = localidade;
    }

    public int getCategoria() {
        return this.categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public int getNumeroQuartos() {
        return this.numeroQuartos;
    }

    public void setNumeroQuartos(int numeroQuartos) {
        this.numeroQuartos = numeroQuartos;
    }

    public int getPreco() {
        return this.preco;
    }

    public void setPreco(int preco) {
        this.preco = preco;
    }

    public abstract double precoNoite();

    public abstract Hotel clone();

    @Override
    public int compareTo(Hotel h) {
        return this.nome.compareTo(h.getNome());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Hotel hotel = (Hotel) o;

        return (this.categoria == hotel.getCategoria() && this.numeroQuartos == hotel.getNumeroQuartos() &&
                this.preco == hotel.getPreco() && this.codigo.equals(hotel.getCodigo()) &&
                this.nome.equals(hotel.getNome()) && this.localidade.equals(hotel.getLocalidade()));
    }

    @Override
    public int hashCode() {
        int result = this.getCodigo().hashCode();
        result = 31 * result + this.getNome().hashCode();
        result = 31 * result + this.getLocalidade().hashCode();
        result = 31 * result + this.getCategoria();
        result = 31 * result + this.getNumeroQuartos();
        result = 31 * result + this.getPreco();
        return result;
    }

    @Override
    public String toString() {
        return "codigo='" + codigo + '\'' +
                ", nome='" + nome + '\'' +
                ", localidade='" + localidade + '\'' +
                ", categoria=" + categoria +
                ", numeroQuartos=" + numeroQuartos +
                ", preco=" + preco;
    }
}
