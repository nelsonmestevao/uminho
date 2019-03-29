
/**
 * Write a description of class Parque here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Parque
{
    // instance variables - replace the example below with your own
    private int x;
    

    /**
     * Constructor for objects of class Parque
     */
    public Parque()
    {
        // initialise instance variables
        x = 0;
    }
    
    public Parque(int x) {
        this.x = x;
    }

    /**
     * An example of a method - replace this comment with your own
     *
     * @param  y  a sample parameter for a method
     * @return    the sum of x and y
     */
    public int sampleMethod(int y)
    {
        // put your code here
        return x + y;
    }
    
    public int getX()  {
        return this.x;
    }
}
