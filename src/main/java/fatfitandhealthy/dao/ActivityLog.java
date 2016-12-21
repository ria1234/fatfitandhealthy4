package fatfitandhealthy.dao;

// default package
// Generated 19 Dec, 2016 5:55:57 PM by Hibernate Tools 5.1.0.Beta1

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
 * ActivityLog generated by hbm2java
 */
@Entity
@Table(name = "activity_log", catalog = "fatfitandhealthy")
public class ActivityLog implements java.io.Serializable {

	private Integer id;
	private UserHealth userHealth;
	private String date;
	private String breakfast;
	private String lunch;
	private String dinner;
	private String exercise;
	private int water;
	private int sleep;

	public ActivityLog() {
	}

	public ActivityLog(UserHealth userHealth, String date, String breakfast, String lunch, String dinner,
			String exercise, int water, int sleep) {
		this.userHealth = userHealth;
		this.date = date;
		this.breakfast = breakfast;
		this.lunch = lunch;
		this.dinner = dinner;
		this.exercise = exercise;
		this.water = water;
		this.sleep = sleep;
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

	@Column(name = "breakfast", nullable = false)
	public String getBreakfast() {
		return this.breakfast;
	}

	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}

	@Column(name = "lunch", nullable = false)
	public String getLunch() {
		return this.lunch;
	}

	public void setLunch(String lunch) {
		this.lunch = lunch;
	}

	@Column(name = "dinner", nullable = false)
	public String getDinner() {
		return this.dinner;
	}

	public void setDinner(String dinner) {
		this.dinner = dinner;
	}

	@Column(name = "exercise", nullable = false)
	public String getExercise() {
		return this.exercise;
	}

	public void setExercise(String exercise) {
		this.exercise = exercise;
	}

	@Column(name = "water", nullable = false)
	public int getWater() {
		return this.water;
	}

	public void setWater(int water) {
		this.water = water;
	}

	@Column(name = "sleep", nullable = false)
	public int getSleep() {
		return this.sleep;
	}

	public void setSleep(int sleep) {
		this.sleep = sleep;
	}

}
