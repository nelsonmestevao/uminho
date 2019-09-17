public class Task_2 implements Runnable {
    private Counter counter;

    public Task_2() {
        this.counter = new Counter();
    }

    public void run() {
        this.counter.increment();
    }

    public void show() {
        System.out.println(this.counter);
    }

    public static void execute() {
        int N = 50;
        Task_2 task = new Task_2();

        Thread[] array = new Thread[N];

        for (int i = 0; i < N; i++) {
            array[i] = new Thread(task);
        }

        for (int i = 0; i < N; i++) {
            array[i].start();
        }

        try {
            for (int i = 0; i < N; i++) {
                array[i].join();
            }
        } catch (InterruptedException exc) {
            exc.printStackTrace();
        }

        task.show();
    }
}
