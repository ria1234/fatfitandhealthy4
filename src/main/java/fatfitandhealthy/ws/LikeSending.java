package fatfitandhealthy.ws;

public class LikeSending {
	private int id;
	private int uid;
	private int postid;
	private String action;
	public LikeSending() {
		
	}
	public LikeSending(int id, int uid, int postid, String action) {
		
		this.id = id;
		this.uid = uid;
		this.postid = postid;
		this.action = action;
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
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	
	
	
	
	
}
