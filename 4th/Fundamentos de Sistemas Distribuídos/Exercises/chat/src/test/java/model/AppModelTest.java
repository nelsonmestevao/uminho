package model;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class AppModelTest {
    private AppModel model;

    @Before
    public void setUp() {
        this.model = new AppModel(42);
    }

    @Test
    public void getX() {
        assertEquals(42, this.model.getX());
    }

    @Test
    public void setX() {
        this.model.setX(90);
        assertEquals(90, this.model.getX());
    }
}
