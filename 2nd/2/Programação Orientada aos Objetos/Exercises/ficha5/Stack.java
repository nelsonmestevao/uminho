package ficha5;

public class Stack {
    private List<String> stack;

    public Stack() {
        this.stack = new ArrayList<String>();
    }

    public Stack(List<String> stack) {
        setStack(stack);
    }

    public Stack(Stack stack) {
        this.stack = stack.getStack();
    }

    public Stack(int size) {
        this.stack = new ArrayList<String>(size);
    }

    public List<String> getStack() {
        List<String> r = new ArrayList<String>();
        stack.stream().forEach(s -> r.add(s));
        return r;
    }

    public void setStack(List<String> stack) {
        this.stack = new ArrayList<>();
        for (String s : stack) this.stack.add(s);
    }

    public void push(String s) {
        this.stack.add(0, s);
    }

    public void pop() {
        if (!this.stack.isEmpty()) this.stack.remove(0);
    }

    public String top() {
        String s = "";
        if (this.stack.isEmpty()) s = this.elems.get(0);
        return s;
    }

    boolean isEmpty() {
        return this.stack.size() == 0;
    }

    public String toString() {
        return this.stack.toString();
    }

    public boolean equals(Object o) {
        if (o == this) return true;
        if (o == null || o.getClass() != this.getClass()) return false;
        Stack s = (Stack) o;
        return this.stack.equals(s.getStack());
    }

}
