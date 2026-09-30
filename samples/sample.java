// Java sample
/* block comment */
package samples;

import java.util.ArrayList;
import java.util.List;

public final class Inventory<T extends Comparable<T>> {
    private static final int LIMIT = 1_000;
    private final List<T> items = new ArrayList<>();

    @Override
    public String toString() {
        return "Inventory(" + items.size() + ")";
    }

    public boolean add(T item) throws IllegalStateException {
        if (item == null || items.size() >= LIMIT) {
            throw new IllegalStateException("full");
        }
        return items.add(item);
    }

    public static void main(String[] args) {
        Inventory<String> inv = new Inventory<>();
        char mark = '!';
        double ratio = 2.5f + 0xFF;
        for (String arg : args) {
            inv.add(arg);
        }
        System.out.println(inv.toString() + mark + ratio);
    }
}
