import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class Item {
    int quantity;
    ReentrantLock lock;
    Condition isEmpty;

    public Item() {
        this.quantity = 0;
        this.lock = new ReentrantLock();
        this.isEmpty = this.lock.newCondition();
    }

    public void supply(int quantity) {
        this.lock.lock();
        this.quantity += quantity;
        this.isEmpty.signalAll();
        this.lock.unlock();
    }

    public void consume() {
        this.lock.lock();
        try {
            if (this.quantity == 0) {
                System.out.println("Consumer: Não há unidades");
                this.isEmpty.await();
            }
            this.quantity--;
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            this.lock.unlock();
        }
    }
}
