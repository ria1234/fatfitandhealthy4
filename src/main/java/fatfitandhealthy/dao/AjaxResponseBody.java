package fatfitandhealthy.dao;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonView;

import fatfitandhealthy.jsonview.Views;

public class AjaxResponseBody {
	@JsonView(Views.Public.class)
	String msg;
	@JsonView(Views.Public.class)
	String code;
	@JsonView(Views.Public.class)
	float result;
	public AjaxResponseBody(String msg, String code, float result) {
		super();
		this.msg = msg;
		this.code = code;
		this.result = result;
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
	public float getResult() {
		return result;
	}
	public void setResult(float result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "AjaxResponseBody [msg=" + msg + ", code=" + code + ", result=" + result + "]";
	}
	
	
}
