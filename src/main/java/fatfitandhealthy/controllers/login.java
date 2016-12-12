package fatfitandhealthy.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fatfitandhealthy.dao.UserHealth;
import fatfitandhealthy.dao.UserLogin;
import fatfitandhealthy.dao.UsersPersonal;
import fatfitandhealthy.hibernate.Getdata;
import fatfitandhealthy.methods.sendemail;

@Controller

public class login {
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index()
	{
		return "index";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login()
	{
		return "login";
	}
	@RequestMapping(value="/contact",method=RequestMethod.POST)
	public String contact(@RequestParam(value="name") String name,@RequestParam(value="mail") String mail,@RequestParam(value="subject") String subject,@RequestParam(value="message") String message)
	{
		if (sendemail.email(name, mail, subject, message)) {
			return "redirect:/";
		} else {
			return "redirect:/";	
		}
		
		
	}
	@RequestMapping(value="/signup",method=RequestMethod.GET)
	public String signup(HttpSession session) {
		return "signup";
		
	}
	
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signup(HttpSession session,@RequestParam(value="kg") String kgs,@RequestParam(value="email") String email,@RequestParam(value="password") String password,@RequestParam(value="firstname") String firstname,@RequestParam(value="lastname") String lastname,@RequestParam(value="gender") String gender,@RequestParam(value="image") String image,@RequestParam(value="dob") String dob,@RequestParam(value="mobile") String mobile,@RequestParam(value="weight") String weight,@RequestParam(value="height") String height,@RequestParam(value="activity_factor") String activity_factor,@RequestParam(value="weight_goal") String weight_goal,@RequestParam(value="file") MultipartFile file) {
		UserLogin ul=new UserLogin();
		ul.setEmail(email);
		ul.setPassword(password);
		ul.setStatus("not varified");
		ul.setImage("");
		ul.setEditTimestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		ul.setCreateTimestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		Getdata.save(ul);
		ul.setImage(ul.getId()+image.substring(image.lastIndexOf(".")));
		Getdata.update(ul);
		UserHealth uh=new UserHealth();
		uh.setId(ul.getId());
		uh.setUno(ul.getId());
		//System.out.println(ul.getId());
		uh.setHeight(height);
		uh.setWeight(weight);
		uh.setActivityFactor(activity_factor);
		uh.setWeightGoal(weight_goal);
		uh.setKgs(kgs);
		
		UsersPersonal up=new UsersPersonal();
		up.setId(ul.getId());
		up.setFname(firstname);
		up.setLname(lastname);
		up.setDob(dob);
		up.setMobNo(mobile);
		
		up.setGender(gender);
		Getdata.save(up);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File("F:\\fatfitandhealthy\\fatfitandhealthy\\src\\main\\webapp\\resources\\image\\user");
				//System.out.println("E:\\javapractise\\spring\\facebook\\src\\main\\webapp\\image");
				if (!dir.exists())
					dir.mkdirs();
				//System.out.println(dir.getAbsolutePath()+ File.separator + u.getImage());
				// Create the file on server
				
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + ul.getId()+image.substring(image.lastIndexOf(".")));
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+serverFile.getAbsolutePath());

				//return "You successfully uploaded file=" + name; 
			} catch (Exception e) {
				System.out.println("You failed to upload " + image+ " => " + e.getMessage());
			}
		} else {
			System.out.println("You failed to upload " + image
					+ " because the file was empty."); 
		}
		//calculating daily cal goal
		float age=Float.valueOf(new SimpleDateFormat("yyyy").format(new Date()))-Float.valueOf(dob.substring(6));
		double bmr,daily_cal_goal;
		if (gender.equals("male")) {
			bmr=(10*Float.valueOf(weight))+(6.25*Float.valueOf(height))-5*age+5;
			//System.out.println(bmr);
		} else {
			bmr=(10*Float.valueOf(weight))+(6.25*Float.valueOf(height))-5*age-161;
			//System.out.println(bmr);
		}
		if (activity_factor.equals("sedentary")) {
			daily_cal_goal=bmr*1.2;
			//System.out.println(daily_cal_goal);
		} else if (activity_factor.equals("lightly active")) {
			daily_cal_goal=bmr*1.375;
		}else if (activity_factor.equals("moderetly active")) {
			daily_cal_goal=bmr*1.55;
		}else if (activity_factor.equals("very active")) {
			daily_cal_goal=bmr*1.725;
		}else {
			daily_cal_goal=bmr*1.9;
		}
		//System.out.println(daily_cal_goal);
		if (weight_goal.equals("gain weight")) {
			if (kgs.equals("0.5")) {
				daily_cal_goal=daily_cal_goal+550;
			}
			else {
				daily_cal_goal=daily_cal_goal+300;
			}
		}
		else if (weight_goal.equals("loose weight")) {
			if (kgs.equals("0.5")) {
				daily_cal_goal=daily_cal_goal-550;
			}
			else {
				daily_cal_goal=daily_cal_goal-300;
			}
		}
		uh.setDailyCalGoal(Double.toString(Math.round(daily_cal_goal)));
		Getdata.save(uh);
		return "redirect:/login";
		
	}
}
