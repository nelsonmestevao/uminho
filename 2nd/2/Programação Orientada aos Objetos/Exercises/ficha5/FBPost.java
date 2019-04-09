package ficha5;

import java.util.List;
import java.util.ArrayList;
import java.time.LocalDateTime;

/**
 * Classe que representa um post do facebook
 *
 * @author MaterialPOO
 * @version 20180312
 */
public class FBPost {
    /**
     * ID do post
     */
    private int id;
    /**
     * Username do autor
     */
    private String username;
    /**
     * Instante de criaÃ§Ã£o
     */
    private LocalDateTime data;
    /**
     * ConteÃºdo do post
     */
    private String post;
    /**
     * NÃºmero de likes
     */
    private int likes;
    /**
     * Lista de comentÃ¡rios
     */
    private List<String> comentarios;

    /**
     * Construtor por omissÃ£o
     */
    public FBPost() {
        this.id = 0;
        this.username = "n/a";
        this.data = LocalDateTime.now();
        this.post = "n/a";
        this.likes = 0;
        this.comentarios = new ArrayList<>();
    }

    /**
     * Construtor por cÃ³pia
     *
     * @param post Post original
     */
    public FBPost(FBPost post) {
        this.id = post.getId();
        this.username = post.getUsername();
        this.data = post.getData();
        this.post = post.getPost();
        this.likes = post.getLikes();
        this.comentarios = post.getComentarios();
    }

    /**
     * Construtor por parametro
     *
     * @param id
     * @param username
     * @param data
     * @param post
     * @param likes
     * @param comentarios
     */
    public FBPost(int id, String username, LocalDateTime data, String post, int likes, List<String> comentarios) {
        this.id = id;
        this.username = username;
        this.data = data;
        this.post = post;
        this.likes = likes;
        setComentarios(comentarios);
    }

    /**
     * Devolve o ID do post
     *
     * @return
     */
    public int getId() {
        return id;
    }

    /**
     * Define o ID do post
     *
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Devolve o username do autor
     *
     * @return
     */
    public String getUsername() {
        return username;
    }

    /**
     * Define o username do autor
     *
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Devolve a data
     *
     * @return
     */
    public LocalDateTime getData() {
        return this.data;
    }

    /**
     * Define a data
     *
     * @param data
     */
    public void setData(LocalDateTime data) {
        this.data = data;
    }

    /**
     * Devolve o conteÃºdo
     *
     * @return
     */
    public String getPost() {
        return post;
    }

    /**
     * Define o conteÃºdo
     *
     * @param post
     */
    public void setPost(String post) {
        this.post = post;
    }

    /**
     * Devolve o nÃºmero de likes
     *
     * @return
     */
    public int getLikes() {
        return likes;
    }

    /**
     * Define o nÃºmero de likes
     *
     * @param likes
     */
    public void setLikes(int likes) {
        this.likes = likes;
    }

    /**
     * Devolve a lista de comentÃ¡rios
     *
     * @return
     */
    public List<String> getComentarios() {
        List<String> res = new ArrayList<>();
        for (String s : comentarios) {
            res.add(s);
        }
        return res;
    }

    /**
     * Define a lista de comentÃ¡rios
     *
     * @param comentarios
     */
    public void setComentarios(List<String> comentarios) {
        this.comentarios = new ArrayList<>();
        comentarios.forEach(s -> {
            this.comentarios.add(s);
        });
    }

    /**
     * Cria uma cÃ³pia do objecto
     *
     * @return
     */
    protected FBPost clone() {
        return new FBPost(this);
    }

    /**
     * Verifica a igualdade de dois objectos
     *
     * @param obj
     * @return
     */
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (obj == null || obj.getClass() != this.getClass()) return false;
        FBPost p = (FBPost) obj;
        return this.id == p.getId() && this.username.equals(p.getUsername()) &&
                this.getPost().equals(p.getPost()) && this.likes == likes &&
                this.comentarios.equals(p.getComentarios()) && this.data.equals(p.getData());
    }

    /**
     * Retorna uma representaÃ§Ã£o textual do objecto
     *
     * @return
     */
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ID: ").append(id).append("\nUsername: ").append(username)
                .append("\nData: ").append(data).append("\nPost: ").append(post)
                .append("\nLikes: ").append(likes)
                .append("\nComentarios: ").append(comentarios.toString());
        return sb.toString();
    }

}
