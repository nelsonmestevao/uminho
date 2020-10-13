import java.util.ArrayList;
import java.util.List;

import com.beust.jcommander.JCommander;
import com.beust.jcommander.Parameter;
import com.beust.jcommander.ParameterException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import util.Parser;

public final class App {
    private static Logger log = LogManager.getLogger(App.class);

    private static final String PROGRAM_NAME = "java-tmpl";

    @Parameter(
            names = {"-h", "--help"},
            help = true,
            description = "Displays help information")
    private boolean help;

    @Parameter(
            names = {"--length", "-l"},
            required = true)
    private int length;

    @Parameter(names = {"--pattern", "-p"})
    private int pattern = 0;

    @Parameter(
            names = {"--users", "-u"},
            variableArity = true,
            description = "List of users whose home directories will be archived as per profile.")
    private List<String> users = new ArrayList<>();

    private App() {}

    public static void main(final String[] args) {
        new App().start(args);
    }

    public void start(final String[] args) {
        this.parseArguments(args);

        log.info("Application started successfully");
        Parser.readFile("target/classes" + "/art/logo.ascii").stream().forEach(System.out::println);

        System.out.println("length: " + this.length);
        System.out.println("pattern: " + this.pattern);
        System.out.println("users: " + this.users);
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
