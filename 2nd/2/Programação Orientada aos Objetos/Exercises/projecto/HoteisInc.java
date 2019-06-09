import java.util.*;

// Actualmente a cadeia de hotéis faz equipamentos homogéneos a nível de quarto, pelo que todos os quartos de um
// hotel são do mesmo tipo (previsivelmente esta situação mudará num futuro próximo).
public class HoteisInc {

    /**
     * Variáveis de instância
     */
    private String nomeCadeia;
    private Map<String, Hotel> hoteis;

    /**
     * Permite obter o nome da cadeia de hoteis
     *
     * @return String com o nome da cadeia de hóteis
     */
    public String getNomeCadeia() {
        return nomeCadeia;
    }

    /**
     * Permite definir o nome da cadeia de hóteis
     *
     * @param nomeCadeia Nome da cadeia de hóteis
     */
    public void setNomeCadeia(String nomeCadeia) {
        this.nomeCadeia = nomeCadeia;
    }

    /**
     * Permite obter o Map entre chaves e hóteis
     *
     * @return Correspondência entre códigos e hóteis
    public Map<String, Hotel> getHoteis() {
    return hoteis;
    }
     */

    /**
     * Permite definir o Map entre chaves e hóteis
     *
     * @param hoteis Map entre chaves e hóteis
    public void setHoteis(Map<String, Hotel> hoteis) {
    this.hoteis = hoteis;
    }
     */

    /**
     * Permite saber se um hotel com uma determinada chave existe
     *
     * @param cod Chave que identifica o hotel
     * @return 'True' caso o hotel exista ou 'False' caso contrário
     */
    public boolean existeHotel(String cod) {
        return this.hoteis.containsKey(cod);
    }

    /**
     * Permite saber quantos hoteis possui a cadeia
     *
     * @return Número de hoteis que a cadeia contem
     */
    public int quantos() {
        return this.hoteis.size();
    }

    /**
     * Permite saber o número de hóteis que existem dentro de uma localidade
     *
     * @param localidade Localidade desejada
     * @return Número de hoteis que existem numa determinada localidade
     */
    public int quantos(String localidade) {
        return (int) this.hoteis.values().stream().filter(h -> h.getLocalidade().equals(localidade)).count();
    }

    /**
     * Permite obter um hotel ao qual corresponde um determinado código
     *
     * @param cod Código de correspondência ao hotel
     * @return Hotel corresponde à chave
     */
    public Hotel getHotel(String cod) {
        return this.hoteis.get(cod).clone();
    }

    /**
     * Permite adicionar um hotel ao map
     *
     * @param t Hotel a adicionar
     */
    public void add(Hotel t) {
        this.hoteis.put(t.getCodigo(), t.clone());
    }

    /**
     * Permite obter a lista de hóteis contidos no map
     *
     * @return Lista de hoteis
     */
    public List<Hotel> getHoteisList() {
        List<Hotel> ret = new ArrayList<>();
        this.hoteis.values().stream().map(p -> ret.add(p.clone()));
        return ret;
    }

    /**
     * Permite adicionar um Set de hoteis
     *
     * @param hs Set de hoteis a adicionar
     */
    public void addAll(Set<Hotel> hs) {
        for (Hotel h : hs)
            this.add(h.clone());
    }

    public TreeSet<Hotel> ordenaHoteis() {
        TreeSet<Hotel> r = new TreeSet<>();

        for (Hotel h : hoteis.values()) {
            r.add(h.clone());
        }

        return r;
    }

    public TreeSet<Hotel> ordenaHoteis(Comparator<Hotel> c) {
        TreeSet<Hotel> r = new TreeSet<>(c);

        for (Hotel h : hoteis.values()) {
            r.add(h.clone());
        }

        return r;
    }
}