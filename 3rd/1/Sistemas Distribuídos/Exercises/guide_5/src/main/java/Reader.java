import static java.lang.Thread.sleep;

public class Reader implements Runnable {
    private RWLock rwLock;

    public Reader(RWLock rwLock) {
        this.rwLock = rwLock;
    }

    @Override
    public void run() {
        try {
            rwLock.readLock();
            sleep(1000);
            rwLock.readUnLock();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
