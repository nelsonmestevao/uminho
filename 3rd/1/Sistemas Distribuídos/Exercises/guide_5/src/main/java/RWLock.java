import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class RWLock {
    private ReentrantLock lock;
    private Condition writeWait;
    private Condition readWait;
    private int readers;
    private int writers;

    public RWLock() {
        this.lock = new ReentrantLock();
        this.readWait = this.lock.newCondition();
        this.writeWait = this.lock.newCondition();
        int readers = 0;
        int writers = 0;
    }

    public void readLock() throws InterruptedException {
        this.lock.lock();

        while (this.writers > 0) {
            this.readWait.await();
        }

        this.readers++;

        this.lock.unlock();
    }

    public void readUnLock() {
        this.lock.lock();

        this.readers--;

        if(readers == 0) {
            this.writeWait.signal();
        }

        this.lock.unlock();
    }

    public void writeLock() throws InterruptedException {
        this.lock.lock();

        while (readers > 0 || writers > 0) {
            this.writeWait.await();
        }

        this.writers = 1;

        this.lock.unlock();
    }

    public void writeUnLock() {
        this.lock.lock();

        this.writers = 0;
        this.readWait.signalAll();
        this.writeWait.signal();

        this.lock.unlock();
    }

}
