import static java.lang.Thread.sleep;

public class Writer implements Runnable {
    RWLock rwLock;

    public Writer(RWLock rwLock) {
        this.rwLock = rwLock;
    }

    @Override
    public void run() {
        try {
            rwLock.writeLock();
            sleep(1000);
            rwLock.writeUnLock();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
