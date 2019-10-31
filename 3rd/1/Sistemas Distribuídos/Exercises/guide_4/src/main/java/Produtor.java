public class Produtor implements Runnable {
  private BoundedBuffer bf;
  private int tp;
  private int numOps;

  public Produtor(BoundedBuffer bf, int tp, int numOps) {
    this.bf = bf;
    this.tp = tp;
    this.numOps = numOps;
  }

  public void run() {
    int r = 1;
    for (int i = 0; i < numOps; i++) {
      try {
        bf.put(r++);
        Thread.sleep(this.tp);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
  }
}
