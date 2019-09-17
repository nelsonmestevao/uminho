public class Counter {
    private int n;

    public Counter() {
        this.n = 0;
    }

    public void increment() {
        this.n++;
    }

    public String toString() {
        return "Value: " + this.n;
    }
}
