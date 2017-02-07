package fatfitandhealthy.ws;

public class LikeMessage {
	private int uid;
	private int postid;
	public LikeMessage() {
		
	}
	public LikeMessage(int uid, int postid) {
		this.uid = uid;
		this.postid = postid;
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
	
	
}
