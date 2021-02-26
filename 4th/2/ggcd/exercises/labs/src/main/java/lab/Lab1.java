package lab;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

import java.io.IOException;

public class Lab1 {
    // numero da linha, linha em si, chave resultado, valor resultado
    public static class TopPopularGenresWrapper
        extends Mapper<LongWritable, Text, Text, LongWritable> {
        @Override
        protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
            var columns = value.toString().split("\t");
            var genres = columns[8].split(",");

            for (var genre : genres) {
                context.write(new Text(genre), new LongWritable(1));
            }
        }
    }

    // os dois primeiros tem de ser chave valor do wrapper, segundos são o formato que queremos no output (ambos em texto já)
    public static class TopPopularGenresReducer extends Reducer<Text, LongWritable, Text, Text> {
        @Override
        protected void reduce(Text key, Iterable<LongWritable> values, Context context) throws IOException, InterruptedException {
            long count = 0;
            for (LongWritable value : values) {
                count += value.get();
            }
            context.write(key, new Text(Long.toString(count)));
        }
    }

    public static void getTopTenPopularGenres(final String data) throws IOException, ClassNotFoundException, InterruptedException {
        Job job = Job.getInstance(new Configuration(), "TopPopularGenres");

        job.setJarByClass(Lab1.class);
        job.setMapperClass(TopPopularGenresWrapper.class);
        job.setReducerClass(TopPopularGenresReducer.class);

        job.setInputFormatClass(TextInputFormat.class);
        TextInputFormat.setInputPaths(job, new Path(data));

        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(LongWritable.class);

        job.setOutputFormatClass(TextOutputFormat.class);
        TextOutputFormat.setOutputPath(job, new Path("data/out"));
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);

        job.waitForCompletion(true);
    }
}
