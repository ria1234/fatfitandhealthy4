package fatfitandhealthy.ws;

public class PostSending {
	private int id;
	private int uid;
	private String ptext;
	private int likes;
	private String ctime;
	private String utime;
	private String uname;
	private String image;
	public PostSending() {
		
	}
	public PostSending(int id, int uid, String ptext, int likes, String ctime, String utime, String uname,
			String image) {
		
		this.id = id;
		this.uid = uid;
		this.ptext = ptext;
		this.likes = likes;
		this.ctime = ctime;
		this.utime = utime;
		this.uname = uname;
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getPtext() {
		return ptext;
	}
	public void setPtext(String ptext) {
		this.ptext = ptext;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public String getUtime() {
		return utime;
	}
	public void setUtime(String utime) {
		this.utime = utime;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
