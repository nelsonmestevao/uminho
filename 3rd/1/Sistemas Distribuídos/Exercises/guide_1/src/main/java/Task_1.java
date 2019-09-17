public class Task_1 implements Runnable {
    int id;
    int I = 500;

    public Task_1(int id) {
        this.id = id;
    }

    public void run() {
        for (int i = 0; i < I; i++) {
            System.out.println("Thread " + this.id + ": " + i);
        }

    }

    public static void execute() {
        int N = 5;

        Thread[] array = new Thread[N];

        for (int i = 0; i < N; i++) {
            array[i] = new Thread(new Task_1(i));
        }

        for(int i = 0; i < N; i++) {
            array[i].start();
        }

        for (int i = 0; i < N; i++) {
            try {
                array[i].join();
            } catch (InterruptedException exc) {
                exc.printStackTrace();
            }
        }
    }
}
