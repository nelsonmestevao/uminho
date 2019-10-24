public class BoundedBuffer {
  private final int MAXVALUE;
  private int[] values;
  private int poswrite;

  public BoundedBuffer(int size) {
    this.MAXVALUE = size;
    this.values = new int[this.MAXVALUE];
    this.poswrite = 0;
  }

  public synchronized void put(int v) throws InterruptedException {
    while (this.poswrite == MAXVALUE) {
      this.wait();
    }
    this.values[this.poswrite++] = v;
    this.notifyAll();
  }

  public synchronized int get() throws InterruptedException {
    while (this.poswrite == 0) {
      this.wait();
    }
    int r = this.values[--this.poswrite];
    this.notifyAll();
    return r;
  }
}
