package ficha3;


/**
 * Write a description of class Ponto3D here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Ponto3D extends Ponto {
    private int z;

    /**
     * Constructor for objects of class Ponto3D
     */
    public Ponto3D() {
        super();
        this.z = 0;
    }
    
    public Ponto3D(Ponto3D ponto) {
        super(ponto);
        this.z = ponto.getZ();
    }
    
    public int getZ() {
        return this.z;
    }
    
    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        
        if(o == null || o.getClass() != this.getClass())
            return false;
        
        Ponto3D p = (Ponto3D) o;
        
        return super.equals(p) && p.getZ() == this.z;
    }
    
    @Override
    public String toString() {
        return super.toString() + " z = " + this.z;
    }
    
    public void movePonto(int x, int y, int z) {
        super.movePonto(x, y);
        this.z = z;
    }
    
}
