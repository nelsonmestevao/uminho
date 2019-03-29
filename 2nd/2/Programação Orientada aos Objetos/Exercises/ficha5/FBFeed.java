import java.util.stream.Collectors;

public class FBFeed {
    private List<FBPost> posts;

    public FBFeed() {
        this.timeline = new ArrayList<Post>();
    }

    public FBFeed(FBFeed feed) {
        this.posts = feed.getPosts();
    }

    public FBFeed(List<Post> posts) {
        this.setPosts(posts);
    }

    public List<FBPost> getPosts() {
        ArrayList<FBPost> res = new ArrayList<FBPost>();

        for (FBPost p : this.posts) {
            res.add(p.clone());
        }

        return res;
    }

    public void setPosts(List<FBPost> posts) {
        this.posts = new ArrayList<FBPost>();
        posts.forEach(p -> this.posts.add(p.clone()));
    }

    public void nrPosts(String user) {
        return (int) posts.stream()
                .filter(p -> p.getUsername().equals(user))
                .count();
    }

    public List<FBPost> postOf(String user) {
        return posts.stream()
                .filter(p->p.getUsername().equals(user))
                .map(p->p.clone())
                .collect(Collectors.toList());
    }

    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;

        FBFeed fbFeed = (FBFeed) object;

        return this.getPosts().equals(fbFeed.getPosts());
    }

    public FBFeed clone() {
        return FBFeed(this.getPosts());
    }

    public int hashCode() {
        return Objects.hash(super.hashCode(), posts);
    }
}
