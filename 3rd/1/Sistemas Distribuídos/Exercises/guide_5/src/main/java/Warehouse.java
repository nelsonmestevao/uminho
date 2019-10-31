import java.util.HashMap;

public class Warehouse {
    private HashMap<String, Item> stock;

    public Warehouse() {
        this.stock = new HashMap<>();
        this.stock.put("item_1", new Item());
        this.stock.put("item_2", new Item());
        this.stock.put("item_3", new Item());
    }

    public void supply(String item, int quantity) {
        this.stock.get(item).supply(quantity);
        System.out.println("Supply: " + item + ", qtd: " + quantity);
    }

    public void consume(String[] items) {
        for(int i = 0; i < items.length; i++) {
            this.stock.get(items[i]).consume();
            System.out.println("Consume: " + items[i]);
        }
    }
}
