public class MyThread implements Runnable {
  private Barreira barreira;

  public MyThread(Barreira barreira) {
    this.barreira = barreira;
  }

  @Override
  public void run() {
    try {
      this.barreira.esperar();
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
  }
}
