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
 * Lunch generated by hbm2java
 */
@Entity
@Table(name = "lunch", catalog = "fatfitandhealthy")
public class Lunch implements java.io.Serializable {

	private Integer id;
	private FoodItems foodItems;
	private UserHealth userHealth;
	private String date;
	private float servingNo;

	public Lunch() {
	}

	public Lunch(FoodItems foodItems, UserHealth userHealth, String date, float servingNo) {
		this.foodItems = foodItems;
		this.userHealth = userHealth;
		this.date = date;
		this.servingNo = servingNo;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "food_id", nullable = false)
	public FoodItems getFoodItems() {
		return this.foodItems;
	}

	public void setFoodItems(FoodItems foodItems) {
		this.foodItems = foodItems;
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

	@Column(name = "serving_no", nullable = false, precision = 12, scale = 0)
	public float getServingNo() {
		return this.servingNo;
	}

	public void setServingNo(float servingNo) {
		this.servingNo = servingNo;
	}

}
