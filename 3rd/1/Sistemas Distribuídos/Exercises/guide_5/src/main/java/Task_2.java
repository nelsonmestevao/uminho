public class Task_2 {
    public static void execute() {
        RWLock rwLock = new RWLock();

        Thread[] threads = new Thread[30];

        for (int i = 0; i < 30; i++) {
            if (i % 2 == 0) {
                threads[i] = new Thread(new Reader(rwLock));
            } else {
                threads[i] = new Thread(new Writer(rwLock));
            }
        }

        for (int i = 0; i < 30; i++) {
            threads[i].start();
        }

        try {
            for (int i = 0; i < 30; i++) {
                threads[i].join();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
