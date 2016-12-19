package fatfitandhealthy.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fatfitandhealthy.dao.ActivityLog;
import fatfitandhealthy.dao.Admin;
import fatfitandhealthy.dao.Exercise;
import fatfitandhealthy.dao.FoodItems;
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
	@RequestMapping(value={"/login","/login/{error}"},method=RequestMethod.GET)
	public String login1(@PathVariable Optional<String> error,Model model,@CookieValue(value="uname",defaultValue="") String uname)
	{
		System.out.println(uname);
		if (!uname.equals("")) {
			//System.out.println("abc");
			return "redirect:/home";
		}
		
		if (error.isPresent()) {
			//System.out.println("attribute set"+error.get());
			
				model.addAttribute("error", error.get());
			
			
		}
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
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(HttpSession session,@RequestParam(value="username") String username,@RequestParam(value="password") String password,HttpServletResponse response)
	{
		int u2=0;
		try {
			/*t=s.beginTransaction();
			Query query=s.createQuery("from User");
			List result=query.list();*/
			List result=Getdata.getData("UserLogin");
			Iterator i=result.iterator();
			
			while (i.hasNext()) {
				System.out.println("saras");
				UserLogin u1 = (UserLogin) i.next();
				if (u1.getEmail().equals(username)&&u1.getPassword().equals(password)&&u1.getStatus().equals("varified")) {
					UsersPersonal up=(UsersPersonal)(Getdata.onecolumnvaluewhere("UsersPersonal", "id", u1.getId().toString()).iterator().next());
					//session.setAttribute("uname", up.getFname()+" "+up.getLname());					
					//session.setAttribute("uimage", u1.getImage());
					Cookie cookie1=new Cookie("uname",up.getFname()+" "+up.getLname() );
					response.addCookie(cookie1);
					Cookie cookie2=new Cookie("uimage", u1.getImage());
					response.addCookie(cookie2);
					Cookie cookie3=new Cookie("id", u1.getId().toString());
					response.addCookie(cookie3);
					u2=1;
					//System.out.println("saras");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		if (u2==0) {
			return "redirect:/login/1";
		}
		else{
			return "redirect:/home";
		}
		
	}
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String home(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model) {
		float foodcal=0;
		float execal=0;
		List<FoodItems> l=Getdata.getData("FoodItems");
		model.addAttribute("FoodItems", l);
		List<Exercise> l2=Getdata.getData("Exercise");
		model.addAttribute("Exercise", l2);
		UserHealth uh=(UserHealth)Getdata.onecolumnvaluewhere("UserHealth", "id", id.toString()).iterator().next();
		model.addAttribute("calgoal",Float.parseFloat(uh.getDailyCalGoal()));
		Iterator<ActivityLog> i=uh.getActivityLogs().iterator();
		while (i.hasNext()) {
			ActivityLog activityLog = (ActivityLog) i.next();
			if (activityLog.getDate().equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
				foodcal=Float.parseFloat(activityLog.getBreakfast())+Float.parseFloat(activityLog.getLunch())+Float.parseFloat(activityLog.getDinner());
				execal=Float.parseFloat(activityLog.getExercise());
			}
		}
		model.addAttribute("foodcal", foodcal);
		model.addAttribute("execal", execal);
		if(!id.equals(""))
			return "home";
			else
				return "redirect:/login";
	
		
		
	}
	
	@RequestMapping(value="/signout",method=RequestMethod.GET)
	public String signout(HttpServletResponse response) {
		Cookie uname=new Cookie("uname", "");
		uname.setMaxAge(0);
		response.addCookie(uname);
		Cookie uimage=new Cookie("uimage", "");
		uimage.setMaxAge(0);
		response.addCookie(uimage);
		Cookie id=new Cookie("id", "");
		id.setMaxAge(0);
		response.addCookie(id);
		return "redirect:/login";
		
	}
	
}
