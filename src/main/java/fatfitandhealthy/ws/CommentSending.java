package fatfitandhealthy.ws;

public class CommentSending {
	private int id;
	private int uid;
	private String ctext;
	private String ctime;
	private String utime;
	private String uname;
	private String image;
	private int postid;
	public CommentSending() {
		
	}
	public CommentSending(int id, int uid, String ctext, String ctime, String utime, String uname, String image,
			int postid) {
		
		this.id = id;
		this.uid = uid;
		this.ctext = ctext;
		this.ctime = ctime;
		this.utime = utime;
		this.uname = uname;
		this.image = image;
		this.postid = postid;
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
	public String getCtext() {
		return ctext;
	}
	public void setCtext(String ctext) {
		this.ctext = ctext;
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
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	
	
}
