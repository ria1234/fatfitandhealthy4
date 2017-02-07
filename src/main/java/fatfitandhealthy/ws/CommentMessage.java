package fatfitandhealthy.ws;

public class CommentMessage {
	private int uid;
	private int postid;
	private String ctext;
	private String image;
	private String uname;
	public CommentMessage() {
		
	}
	public CommentMessage(int uid, int postid, String ctext, String image, String uname) {
		this.uid = uid;
		this.postid = postid;
		this.ctext = ctext;
		this.image = image;
		this.uname = uname;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getCtext() {
		return ctext;
	}
	public void setCtext(String ctext) {
		this.ctext = ctext;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	
}
