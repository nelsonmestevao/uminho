public class Consumidor implements Runnable {
  private BoundedBuffer bf;
  private int tc;
  private int numOps;

  public Consumidor(BoundedBuffer bf, int tc, int numOps) {
    this.bf = bf;
    this.tc = tc;
    this.numOps = numOps;
  }

  public void run() {
    int r;
    for (int i = 0; i < numOps; i++) {
      try {
        r = bf.get();
        Thread.sleep(tc);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
  }
}
