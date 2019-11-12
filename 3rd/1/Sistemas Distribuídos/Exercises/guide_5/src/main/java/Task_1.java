public class Task_1 {
    public static void execute() {
        Warehouse wh = new Warehouse();

        Thread[] threads = new Thread[2];
        threads[0] = new Thread(new Producer(wh));
        threads[1] = new Thread(new Consumer(wh));

        for (int i = 0; i < 2; i++)
            threads[i].start();

        try {
            for (int i = 0; i < 2; i++)
                threads[i].join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
