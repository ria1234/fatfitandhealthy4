package fatfitandhealthy.ws;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonView;

import fatfitandhealthy.jsonview.Views;

public class PostAjaxResponseBody {
	@JsonView(Views.Public.class)
	String msg;
	@JsonView(Views.Public.class)
	String code;
	@JsonView(Views.Public.class)
	List<Object> post;
	public PostAjaxResponseBody(String msg, String code, List<Object> post) {
		super();
		this.msg = msg;
		this.code = code;
		this.post = post;
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
	public List<Object> getPost() {
		return post;
	}
	public void setPost(List<Object> post) {
		this.post = post;
	}
	@Override
	public String toString() {
		return "PostAjaxResponseBody [msg=" + msg + ", code=" + code + ", post=" + post + "]";
	}
	
}
