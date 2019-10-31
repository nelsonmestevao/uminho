import static java.lang.Thread.sleep;

public class Producer implements Runnable {
    private Warehouse wh;

    public Producer(Warehouse wh) {
        this.wh = wh;
    }

    @Override
    public void run() {
        try {
            this.wh.supply("item_1", 1);
            sleep(2000);
            this.wh.supply("item_2", 1);
            sleep(1000);
            this.wh.supply("item_3", 1);
            this.wh.supply("item_1", 1);

        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
