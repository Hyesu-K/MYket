package model;

public class Member {
	private String id;
	private String pass;
	private String nickname;
	private String birth;
	private String email;
	private String picture;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", nickname=" + nickname + ", birth=" + birth + ", email="
				+ email + ", picture=" + picture +  "]";
	}
} 
