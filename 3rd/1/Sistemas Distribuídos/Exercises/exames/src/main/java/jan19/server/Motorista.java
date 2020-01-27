package jan19.server;

public class Motorista implements Runnable {
    private Shuttle shuttle;

    public Motorista(Shuttle shuttle) {
        this.shuttle = shuttle;
    }

    @Override
    public void run() {
        while (true) {
            this.shuttle.start();
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.shuttle.stop();
        }
    }
}
