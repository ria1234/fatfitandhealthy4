package fatfitandhealthy.ws;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonView;

import fatfitandhealthy.dao.Like;
import fatfitandhealthy.jsonview.Views;

public class LikeAjaxResponseBody {
	@JsonView(Views.Public.class)
	String msg;
	@JsonView(Views.Public.class)
	String code;
	@JsonView(Views.Public.class)
	List<Like> like;
	public LikeAjaxResponseBody(String msg, String code, List<Like> like) {
		super();
		this.msg = msg;
		this.code = code;
		this.like = like;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<Like> getLike() {
		return like;
	}
	public void setLike(List<Like> like) {
		this.like = like;
	}
	@Override
	public String toString() {
		return "LikeAjaxResponseBody [msg=" + msg + ", code=" + code + ", like=" + like + "]";
	}
	
}
