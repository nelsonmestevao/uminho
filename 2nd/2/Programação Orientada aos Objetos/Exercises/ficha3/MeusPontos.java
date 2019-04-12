package ficha3;

import java.util.List;
import java.util.ArrayList;

/**
 * Write a description of class MeusPontos here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class MeusPontos {
    // instance variables - replace the example below with your own
    private List<Ponto> pontos;

    /**
     * Constructor for objects of class MeusPontos
     */
    public MeusPontos() {
        this.pontos = new ArrayList<>();
    }
    
    public void adicionaPonto(Ponto p) {
        this.pontos.add(p.clone());
    }
    
    public int somaX() {
        int sum = 0;
        for(Ponto p : this.pontos) {
            sum += p.getX();
        }
        
        return sum;
    }

}
