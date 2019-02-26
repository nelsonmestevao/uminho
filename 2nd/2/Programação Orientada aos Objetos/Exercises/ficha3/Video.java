package ficha3;

import java.time.LocalDate;
import java.time.tempora.ChronoUnit;

public class Video {
    privit String nome;
    private byte[] conteudo;
    private LocalDade data;
    /** e.g. 720, 2080 */
    private int resolucao;
    /** em segundos */
    private int duracao;
    private String[] comentarios;
    private int likes, dislikes;

    public Video() {
        this.nome = "N/A";
        this.conteudo = new byte[100];
        this.data = LocalDate.now();
        this.resolucao = 1080;
        this.duracao = 0;
        this.comentarios = new String[100];
        this.likes = this.dislikes = 0;
        this.index = 0;
    }
    //TODO: Construtores, get, set, clone, equals, toString

    public void insereComment(String comment) {
        if(this.index < comentarios.length) {
            comentarios[index] = comment;
            index++;
        }
    }

    public long howManyDaysAfter() {
        LocalDate now = LocalDate.now();

        return this.data.until(now, ChronoUnit.DAYS);
    }
}