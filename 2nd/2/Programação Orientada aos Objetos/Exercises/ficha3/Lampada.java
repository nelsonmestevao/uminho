package ficha3;

import java.time.LocalDate;

public class Lampada {
    enum Mode {
        ON, ECO, OFF;
    }

    private Mode mode;
    private LocalDate date;
    private int consumo;

    public Lampada() {
        this.mode = OFF;
        this.date = LocalDate.now();
        this.consumo = 0;
    }

    public Mode getMode() {
        return mode;
    }

    public LocalDate getDate() {
        return date;
    }

    public int getConsumo() {
        return consumo;
    }

    public void setMode(Mode mode) {
        this.mode = mode;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setConsumo(int consumo) {
        this.consumo = consumo;
    }
}