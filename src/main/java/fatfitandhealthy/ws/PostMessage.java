package fatfitandhealthy.ws;

public class PostMessage {
	private int uid;
	private String ptext;
	private String image;
	private String uname;
	public PostMessage() {
		
	}
	public PostMessage(int uid, String ptext, String image, String uname) {
		
		this.uid = uid;
		this.ptext = ptext;
		this.image = image;
		this.uname = uname;
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
