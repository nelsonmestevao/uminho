package lab;

import com.beust.jcommander.JCommander;
import com.beust.jcommander.Parameter;
import com.beust.jcommander.ParameterException;

public final class App {
    private static final String PROGRAM_NAME = "labs";

    @Parameter(
            names = {"-h", "--help"},
            help = true,
            description = "Displays help information")
    private boolean help = false;

    @Parameter(
            names = {"-f", "--file"},
            description = "The dataset file",
            required = true)
    private String file;

    public static void main(final String[] args) {
        new App().start(args);
    }

    public void start(final String[] args) {
        this.parseArguments(args);

        try {
            Lab0.getTopTenPopularGenres(this.file);
            Lab1.getTopTenPopularGenres(this.file);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void parseArguments(final String[] args) {
        JCommander commands = new JCommander(this);
        commands.setProgramName(PROGRAM_NAME);

        try {
            commands.parse(args);
        } catch (ParameterException exception) {
            System.err.println(exception.getMessage());
            commands.usage();
            System.exit(1);
        }

        if (this.help) {
            commands.usage();
            System.exit(0);
        }
    }
}
