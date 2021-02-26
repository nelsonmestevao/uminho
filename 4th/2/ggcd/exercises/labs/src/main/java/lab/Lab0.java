package lab;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.compress.compressors.CompressorException;
import org.apache.commons.compress.compressors.CompressorStreamFactory;

public class Lab0 {
    public static void getTopTenPopularGenres(final String data)
            throws IOException, CompressorException {
        var stream = new BufferedInputStream(new FileInputStream(data));
        var input = new CompressorStreamFactory().createCompressorInputStream(stream);
        var file = new BufferedReader(new InputStreamReader(input));
        Map<String, Long> ranking = new HashMap<>();

        String line = file.readLine(); // ignore first line (heading)

        while ((line = file.readLine()) != null) {
            var columns = line.split("\t");
            var genres = columns[8].split(",");
            for (var genre : genres) {
                ranking.putIfAbsent(genre, 0L);
                var count = ranking.get(genre);
                count++;
                ranking.put(genre, count);
            }
        }

        printEntry("Null Values", ranking.get("\\N"));
        System.out.print("\n");
        ranking.remove("\\N");

        ranking.entrySet().stream()
                .sorted((k1, k2) -> -k1.getValue().compareTo(k2.getValue()))
                .limit(10)
                .forEach(entry -> printEntry(entry.getKey(), entry.getValue()));
    }

    public static void printEntry(final String key, final Long value) {
        System.out.printf("%15s : %8d\n", key, value);
    }
}
