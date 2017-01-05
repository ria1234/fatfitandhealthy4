package fatfitandhealthy.dao;

// default package
// Generated 3 Jan, 2017 3:36:01 PM by Hibernate Tools 5.1.0.Beta1

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
 * ExerciseLog generated by hbm2java
 */
@Entity
@Table(name = "exercise_log", catalog = "fatfitandhealthy")
public class ExerciseLog implements java.io.Serializable {

	private Integer id;
	private Exercise exercise;
	private UserHealth userHealth;
	private String date;
	private float minutes;

	public ExerciseLog() {
	}

	public ExerciseLog(Exercise exercise, UserHealth userHealth, String date, float minutes) {
		this.exercise = exercise;
		this.userHealth = userHealth;
		this.date = date;
		this.minutes = minutes;
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
	@JoinColumn(name = "exercise_id", nullable = false)
	public Exercise getExercise() {
		return this.exercise;
	}

	public void setExercise(Exercise exercise) {
		this.exercise = exercise;
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

	@Column(name = "minutes", nullable = false, precision = 12, scale = 0)
	public float getMinutes() {
		return this.minutes;
	}

	public void setMinutes(float minutes) {
		this.minutes = minutes;
	}

}
