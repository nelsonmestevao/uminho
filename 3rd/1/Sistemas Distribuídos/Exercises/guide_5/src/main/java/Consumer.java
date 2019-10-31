public class Consumer implements Runnable {
    private Warehouse wh;

    public Consumer(Warehouse wh) {
        this.wh = wh;
    }

    @Override
    public void run() {
        String[] items = new String[3];
        items[0] = "item_1";
        items[1] = "item_2";
        items[2] = "item_3";
        this.wh.consume(items);
    }
}
