package fatfitandhealthy.dao;

// default package
// Generated 21 Dec, 2016 4:53:43 PM by Hibernate Tools 5.1.0.Beta1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * SleepLog generated by hbm2java
 */
@Entity
@Table(name = "sleep_log", catalog = "fatfitandhealthy")
public class SleepLog implements java.io.Serializable {

	private Integer id;
	private UserHealth userHealth;
	private String date;
	private String from;
	private String to;
	private String cycle1;
	private String cycle2;
	private String cycle3;
	private String cycle4;
	private String cycle5;
	private String cycle6;

	public SleepLog() {
	}

	public SleepLog(UserHealth userHealth, String date, String from, String to, String cycle1, String cycle2,
			String cycle3, String cycle4, String cycle5, String cycle6) {
		this.userHealth = userHealth;
		this.date = date;
		this.from = from;
		this.to = to;
		this.cycle1 = cycle1;
		this.cycle2 = cycle2;
		this.cycle3 = cycle3;
		this.cycle4 = cycle4;
		this.cycle5 = cycle5;
		this.cycle6 = cycle6;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "uid", nullable = false)
	public UserHealth getUserHealth() {
		return this.userHealth;
	}

	public void setUserHealth(UserHealth userHealth) {
		this.userHealth = userHealth;
	}

	@Column(name = "date", nullable = false)
	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Column(name = "from", nullable = false)
	public String getFrom() {
		return this.from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	@Column(name = "to", nullable = false)
	public String getTo() {
		return this.to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	@Column(name = "cycle 1", nullable = false)
	public String getCycle1() {
		return this.cycle1;
	}

	public void setCycle1(String cycle1) {
		this.cycle1 = cycle1;
	}

	@Column(name = "cycle2", nullable = false)
	public String getCycle2() {
		return this.cycle2;
	}

	public void setCycle2(String cycle2) {
		this.cycle2 = cycle2;
	}

	@Column(name = "cycle3", nullable = false)
	public String getCycle3() {
		return this.cycle3;
	}

	public void setCycle3(String cycle3) {
		this.cycle3 = cycle3;
	}

	@Column(name = "cycle4", nullable = false)
	public String getCycle4() {
		return this.cycle4;
	}

	public void setCycle4(String cycle4) {
		this.cycle4 = cycle4;
	}

	@Column(name = "cycle5", nullable = false)
	public String getCycle5() {
		return this.cycle5;
	}

	public void setCycle5(String cycle5) {
		this.cycle5 = cycle5;
	}

	@Column(name = "cycle6", nullable = false)
	public String getCycle6() {
		return this.cycle6;
	}

	public void setCycle6(String cycle6) {
		this.cycle6 = cycle6;
	}

}
