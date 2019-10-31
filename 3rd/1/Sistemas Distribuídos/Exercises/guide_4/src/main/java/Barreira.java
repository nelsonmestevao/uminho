public class Barreira {
    private int n;
    private int c;

    public Barreira(int n) {
        this.n = n;
        this.c = 0;
    }

    public synchronized void esperar() throws InterruptedException {
        this.c++;
        while (c != n) {
            this.wait();
        }
        if (c == n)
            this.notifyAll();
    }
}
