package ficha3;

public class Circulo {
    private double x;
    private double y;
    private double raio;

    public Circulo() {
        this.x = 0;
        this.y = 0;
        this.raio = 1;
    }

    public Circulo(double x, double y, double raio) {
        this.x = x;
        this.y = y;
        this.raio = raio;
    }

    public Circulo(Circulo circle) {
        this.x = circle.getX();
        this.y = circle.getY();
        this.raio = circle.getRaio();
    }

    public double getX() {
        return this.x;
    }

    public double getY() {
        return this.y;
    }

    public double getRaio() {
        return this.raio;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setRaio(double raio) {
        this.raio = raio;
    }

    public void alteraCentro(double x, double y) {
        this.setX(x);
        this.setY(y);
    }

    public double area() {
        return Math.PI * Math.pow(raio, 2);
    }

    public double perimetro() {
        return 2 * Math.PI * raio;
    }

    public Circulo clone() {
        return new Circulo(this);
    }

    public boolean equals(Object o) {
       if (this == o) {
           return true;
        }

       if ( o == null || this.getClass() != o.getClass()) {
           return false;
       }

       Circulo c = (Circulo) o;
       return this.getX() == c.getX() && this.getY() == c.getY() && this.getRaio() == c.getRaio();
    }

    public String toString() {
        return "X="+this.x+" Y="+this.y+" r="+this.raio;
    }
}