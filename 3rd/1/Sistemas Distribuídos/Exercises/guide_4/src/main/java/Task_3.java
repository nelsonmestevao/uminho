public class Task_3 {
  private static int NUM_THREADS = 10;

  public static void execute() throws InterruptedException {
    Barreira b = new Barreira(NUM_THREADS);
    Thread[] threads = new Thread[NUM_THREADS];

    for (int i = 0; i < NUM_THREADS; i++) {
      threads[i] = new Thread(new MyThread(b));
    }

    for (int i = 0; i < NUM_THREADS; i++) {
      threads[i].start();
    }

    for (int i = 0; i < NUM_THREADS; i++) {
      threads[i].join();
    }

    System.out.println("Cheguei ao fim!");
  }
}
