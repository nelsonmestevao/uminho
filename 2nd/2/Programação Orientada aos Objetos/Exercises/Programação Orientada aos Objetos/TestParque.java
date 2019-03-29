import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * The test class TestParque.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class TestParque {
    Parque p;

    /**
     * Default constructor for test class TestParque
     */
    public TestParque()
    {
    }

    /**
     * Sets up the test fixture.
     *
     * Called before every test case method.
     */
    @Before
    public void setUp()
    {
        p = new Parque(3);
    }

    /**
     * Tears down the test fixture.
     *
     * Called after every test case method.
     */
    @After
    public void tearDown()
    {
    }
    
    @Test
    public void testingValue() {
        assertEquals(3,p.getX());
    }
}
