public class Task_2 {

    public static void execute() throws InterruptedException {
        BoundedBuffer bb = new BoundedBuffer(10);

        int tc = 50;
        int tp = 100;
        int totalOps = 100;

        int N = 10;
        int P;
        int C;

        for (P = 1; P <= 9; P++) {
            C = N - P;

            Thread[] prods = new Thread[P];
            Thread[] consm = new Thread[C];

            for (int i = 0; i < P; i++) {
                int operacoes = totalOps / P;
                if (i == 0) {
                    operacoes += totalOps % P;
                }
                prods[i] = new Thread(new Produtor(bb, tp, operacoes));
            }

            for (int i = 0; i < C; i++) {
                int operacoes = totalOps / C;
                if (i == 0) {
                    operacoes += totalOps % C;
                }
                consm[i] = new Thread(new Consumidor(bb, tc, operacoes));
            }

            long start = System.currentTimeMillis();

            for (int i = 0; i < P; i++) {
                prods[i].start();
            }

            for (int i = 0; i < C; i++) {
                consm[i].start();
            }

            for (int i = 0; i < P; i++) {
                prods[i].join();
            }

            for (int i = 0; i < C; i++) {
                consm[i].join();
            }

            long end = System.currentTimeMillis();

            double time = (end - start) / 1000;

            System.out.println("P=" + P + " | C=" + C + ": " + time + " segundos");
        }
    }
}
