import java.util.Map;

public class HoteisInc {
    private String nomeCadeia;
    /**
     * Codigo Hotel -> Hotel
     */
    private Map<String, Hotel> hoteis;

    public HoteisInc() {
        this.nomeCadeia = "";
        this.hoteis = new HashMap<>();
    }

    public HoteisInc(String nomeCadeia, Map<String, Hotel> hoteis) {
        this.nomeCadeia = nomeCadeia;
        this.hoteis = hoteis;
    }

    public String getNomeCadeia() {
        return nomeCadeia;
    }

    public void setNomeCadeia(String nomeCadeia) {
        this.nomeCadeia = nomeCadeia;
    }

    public boolean existeHote(String codigo) {
        return this.hoteis.containsKey(cod);
    }

    public int quantos() {
        return this.hoteis.size();
    }

    public int quantos(String loc) {
        return this.hoteis.values().stream().filter(h -> h.getLocalidade().equals(loc))
                .count();
    }

    public Hotel getHotel(String cod) {
        return this.hoteis.get(cod).clone();
    }
}