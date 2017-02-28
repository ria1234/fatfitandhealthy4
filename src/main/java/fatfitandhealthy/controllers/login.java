package fatfitandhealthy.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import fatfitandhealthy.dao.ActivityLog;
import fatfitandhealthy.dao.Admin;
import fatfitandhealthy.dao.Breakfast;
import fatfitandhealthy.dao.Comment;
import fatfitandhealthy.dao.Dinner;
import fatfitandhealthy.dao.Exercise;
import fatfitandhealthy.dao.FoodItems;
import fatfitandhealthy.dao.Like;
import fatfitandhealthy.dao.Lunch;
import fatfitandhealthy.dao.NutritionGoal;
import fatfitandhealthy.dao.PasswordResetToken;
import fatfitandhealthy.dao.Post;
import fatfitandhealthy.dao.UserHealth;
import fatfitandhealthy.dao.UserLogin;
import fatfitandhealthy.dao.UsersPersonal;
import fatfitandhealthy.dao.Weight;
import fatfitandhealthy.hibernate.Getdata;
import fatfitandhealthy.methods.sendemail;
import fatfitandhealthy.ws.CommentMessage;
import fatfitandhealthy.ws.CommentSending;
import fatfitandhealthy.ws.Greeting;
import fatfitandhealthy.ws.HelloMessage;
import fatfitandhealthy.ws.LikeMessage;
import fatfitandhealthy.ws.LikeSending;
import fatfitandhealthy.ws.PostMessage;
import fatfitandhealthy.ws.PostSending;

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
		Weight w=new Weight();
		w.setUserHealth(uh);
		w.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		w.setWeight(weight);
		Getdata.save(w);
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
	
	@RequestMapping(value="/nutritions",method=RequestMethod.GET)
	public String nutritions(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model) {
		Iterator<Breakfast> ib=Getdata.twocolumnvaluewhere("Breakfast", "uid", id, "date", new SimpleDateFormat("yyyy-MM-dd").format(new Date())).iterator();
		float fat=0;
		float cholesterol=0;
		float sodium=0;
		float potassium=0;
		float carbs=0;
		float fiber=0;
		float sugars=0;
		float protein=0;
		//System.out.println(ib.hasNext());
		while (ib.hasNext()) {
			//System.out.println("aavyu");
			Breakfast breakfast = (Breakfast) ib.next();
			fat=fat+(breakfast.getFoodItems().getFat()*breakfast.getServingNo());
			cholesterol=cholesterol+(breakfast.getFoodItems().getCholesterol()*breakfast.getServingNo());
			sodium=sodium+(breakfast.getFoodItems().getSodium()*breakfast.getServingNo());
			potassium=potassium+(breakfast.getFoodItems().getPotassium()*breakfast.getServingNo());
			carbs=carbs+(breakfast.getFoodItems().getCarbs()*breakfast.getServingNo());
			fiber=fiber+(breakfast.getFoodItems().getFiber()*breakfast.getServingNo());
			sugars=sugars+(breakfast.getFoodItems().getSugars()*breakfast.getServingNo());
			protein=protein+(breakfast.getFoodItems().getProtein()*breakfast.getServingNo());
		}
		
		Iterator<Lunch> il=Getdata.twocolumnvaluewhere("Lunch", "uid", id, "date", new SimpleDateFormat("yyyy-MM-dd").format(new Date())).iterator();
		
		//System.out.println(ib.hasNext());
		while (il.hasNext()) {
			//System.out.println("aavyu");
			Lunch lunch = (Lunch) il.next();
			fat=fat+(lunch.getFoodItems().getFat()*lunch.getServingNo());
			cholesterol=cholesterol+(lunch.getFoodItems().getCholesterol()*lunch.getServingNo());
			sodium=sodium+(lunch.getFoodItems().getSodium()*lunch.getServingNo());
			potassium=potassium+(lunch.getFoodItems().getPotassium()*lunch.getServingNo());
			carbs=carbs+(lunch.getFoodItems().getCarbs()*lunch.getServingNo());
			fiber=fiber+(lunch.getFoodItems().getFiber()*lunch.getServingNo());
			sugars=sugars+(lunch.getFoodItems().getSugars()*lunch.getServingNo());
			protein=protein+(lunch.getFoodItems().getProtein()*lunch.getServingNo());
		}
		Iterator<Dinner> itd=Getdata.twocolumnvaluewhere("Dinner", "uid", id, "date", new SimpleDateFormat("yyyy-MM-dd").format(new Date())).iterator();
		
		//System.out.println(ib.hasNext());
		while (itd.hasNext()) {
			//System.out.println("aavyu");
			Dinner dinner= (Dinner) itd.next();
			fat=fat+(dinner.getFoodItems().getFat()*dinner.getServingNo());
			cholesterol=cholesterol+(dinner.getFoodItems().getCholesterol()*dinner.getServingNo());
			sodium=sodium+(dinner.getFoodItems().getSodium()*dinner.getServingNo());
			potassium=potassium+(dinner.getFoodItems().getPotassium()*dinner.getServingNo());
			carbs=carbs+(dinner.getFoodItems().getCarbs()*dinner.getServingNo());
			fiber=fiber+(dinner.getFoodItems().getFiber()*dinner.getServingNo());
			sugars=sugars+(dinner.getFoodItems().getSugars()*dinner.getServingNo());
			protein=protein+(dinner.getFoodItems().getProtein()*dinner.getServingNo());
		}
		model.addAttribute("fat", fat);
		model.addAttribute("cholesterol", cholesterol);
		model.addAttribute("sodium", sodium);
		model.addAttribute("potassium", potassium);
		model.addAttribute("carbs", carbs);
		model.addAttribute("fiber", fiber);
		model.addAttribute("sugars", sugars);
		model.addAttribute("protein", protein);
		model.addAttribute("goal", Getdata.getData("NutritionGoal").iterator().next());
		if(!id.equals(""))
			return "nutritions";
			else
				return "redirect:/login";
	
		
		
	}
	
	@RequestMapping(value="/waterintake",method=RequestMethod.GET)
	public String waterintake(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model) {
		model.addAttribute("goal", ((NutritionGoal)Getdata.getData("NutritionGoal").iterator().next()).getWater());
		Iterator<ActivityLog> i=Getdata.twocolumnvaluewhere("ActivityLog", "uid", id, "date", new SimpleDateFormat("yyyy-MM-dd").format(new Date())).iterator();
		float water=0;
		while (i.hasNext()) {
			ActivityLog activityLog = (ActivityLog) i.next();
			water=activityLog.getWater();
		}
		
		model.addAttribute("water",water);
		if(!id.equals(""))
			return "waterintake";
			else
				return "redirect:/login";
	
		
		
	}
	
	@RequestMapping(value="/sleepcycle",method=RequestMethod.GET)
	public String sleepcycle(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model) {
		
	
		
		if(!id.equals(""))
			return "sleepcycle";
			else
				return "redirect:/login";
	
		
		
	}
	
	@RequestMapping(value="/caloriehistory",method=RequestMethod.GET)
	public String caloriehistory(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model) {
		UserHealth uh=(UserHealth) Getdata.onecolumnvaluewhere("UserHealth", "id", id).iterator().next();
		model.addAttribute("calGoal",uh.getDailyCalGoal());
		NutritionGoal ng=(NutritionGoal) Getdata.getData("NutritionGoal").iterator().next();
		model.addAttribute("watergoal", ng.getWater());
		List<ActivityLog> l=Getdata.lastnrecord(ActivityLog.class, "date", 10,"userHealth",uh,"date",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		model.addAttribute("activitylog", l);
		if(!id.equals(""))
			return "caloriehistory";
			else
				return "redirect:/login";
	
		
		
	}
	
	@RequestMapping(value="/nutrienthistory/{date}",method=RequestMethod.GET)
	public String nutrienthistory(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model,@PathVariable String date) {
		Iterator<Breakfast> ib=Getdata.twocolumnvaluewhere("Breakfast", "uid", id, "date", date).iterator();
		float fat=0;
		float cholesterol=0;
		float sodium=0;
		float potassium=0;
		float carbs=0;
		float fiber=0;
		float sugars=0;
		float protein=0;
		//System.out.println(ib.hasNext());
		while (ib.hasNext()) {
			//System.out.println("aavyu");
			Breakfast breakfast = (Breakfast) ib.next();
			fat=fat+(breakfast.getFoodItems().getFat()*breakfast.getServingNo());
			cholesterol=cholesterol+(breakfast.getFoodItems().getCholesterol()*breakfast.getServingNo());
			//System.out.println(fat+" "+breakfast.getFoodItems().getFat()*breakfast.getServingNo()+"\n");
			sodium=sodium+(breakfast.getFoodItems().getSodium()*breakfast.getServingNo());
			potassium=potassium+(breakfast.getFoodItems().getPotassium()*breakfast.getServingNo());
			carbs=carbs+(breakfast.getFoodItems().getCarbs()*breakfast.getServingNo());
			fiber=fiber+(breakfast.getFoodItems().getFiber()*breakfast.getServingNo());
			sugars=sugars+(breakfast.getFoodItems().getSugars()*breakfast.getServingNo());
			protein=protein+(breakfast.getFoodItems().getProtein()*breakfast.getServingNo());
		}
		
		Iterator<Lunch> il=Getdata.twocolumnvaluewhere("Lunch", "uid", id, "date", date).iterator();
		
		//System.out.println(ib.hasNext());
		while (il.hasNext()) {
			//System.out.println("aavyu");
			Lunch lunch = (Lunch) il.next();
			fat=fat+(lunch.getFoodItems().getFat()*lunch.getServingNo());
			cholesterol=cholesterol+(lunch.getFoodItems().getCholesterol()*lunch.getServingNo());
			sodium=sodium+(lunch.getFoodItems().getSodium()*lunch.getServingNo());
			potassium=potassium+(lunch.getFoodItems().getPotassium()*lunch.getServingNo());
			carbs=carbs+(lunch.getFoodItems().getCarbs()*lunch.getServingNo());
			fiber=fiber+(lunch.getFoodItems().getFiber()*lunch.getServingNo());
			sugars=sugars+(lunch.getFoodItems().getSugars()*lunch.getServingNo());
			protein=protein+(lunch.getFoodItems().getProtein()*lunch.getServingNo());
		}
		Iterator<Dinner> itd=Getdata.twocolumnvaluewhere("Dinner", "uid", id, "date", date).iterator();
		
		//System.out.println(ib.hasNext());
		while (itd.hasNext()) {
			//System.out.println("aavyu");
			Dinner dinner= (Dinner) itd.next();
			fat=fat+(dinner.getFoodItems().getFat()*dinner.getServingNo());
			cholesterol=cholesterol+(dinner.getFoodItems().getCholesterol()*dinner.getServingNo());
			sodium=sodium+(dinner.getFoodItems().getSodium()*dinner.getServingNo());
			potassium=potassium+(dinner.getFoodItems().getPotassium()*dinner.getServingNo());
			carbs=carbs+(dinner.getFoodItems().getCarbs()*dinner.getServingNo());
			fiber=fiber+(dinner.getFoodItems().getFiber()*dinner.getServingNo());
			sugars=sugars+(dinner.getFoodItems().getSugars()*dinner.getServingNo());
			protein=protein+(dinner.getFoodItems().getProtein()*dinner.getServingNo());
		}
		model.addAttribute("fat", fat);
		model.addAttribute("cholesterol", cholesterol);
		model.addAttribute("sodium", sodium);
		model.addAttribute("potassium", potassium);
		model.addAttribute("carbs", carbs);
		model.addAttribute("fiber", fiber);
		model.addAttribute("sugars", sugars);
		model.addAttribute("protein", protein);
		model.addAttribute("goal", Getdata.getData("NutritionGoal").iterator().next());
		if(!id.equals(""))
			return "nutrienthistory";
			else
				return "redirect:/login";
	
		
		
	}
	
	@RequestMapping(value="/editgoal",method=RequestMethod.GET)
	public String editgoal(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model) {
		UserHealth uh=(UserHealth) Getdata.onecolumnvaluewhere("UserHealth", "id", id).iterator().next();
		model.addAttribute("UserHealth", uh);
		if(!id.equals(""))
			return "editgoal";
			else
				return "redirect:/login";
	
		
		
	}
	
	@RequestMapping(value="/progress",method=RequestMethod.GET)
	public String progress(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model) {
		List<Weight> l=Getdata.onecolumnvaluewhere("Weight", "uid", id);
		
		JsonArray array = new JsonArray();
		for (Weight gi : l)
		{
		    JsonObject obj = new JsonObject();
		    obj.addProperty("date", gi.getDate());
		    obj.addProperty("weight", gi.getWeight());
		    array.add(obj);
		}
		model.addAttribute("weight", array);
		if(!id.equals(""))
			return "progress";
			else
				return "redirect:/login";
	
		
		
	}
	
	@RequestMapping(value="/shareideas",method=RequestMethod.GET)
	public String shareideas(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model) {
		
		if(!id.equals(""))
			return "shareideas";
			else
				return "redirect:/login";
	
		
		
	}
	
	@MessageMapping("/shareideas")
    @SendTo("/topic/post")
    public PostSending addpost(PostMessage message) throws Exception {
        
        //System.out.println(message.getUid()+" "+message.getImage()+" "+message.getPtext());
        Post post=new Post();
        String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        post.setCtime(time);
        post.setLikes(0);
        post.setPtext(message.getPtext());
        post.setUid(message.getUid());
        post.setUtime(time);
        Getdata.save(post);
        //System.out.println(post.getId());
        Thread.sleep(1000); // simulated delay
        PostSending ps=new PostSending(post.getId(), post.getUid(), post.getPtext(), post.getLikes(), post.getCtime(), post.getUtime(), message.getUname(), message.getImage());
        return ps;
    }
	
	@MessageMapping("/shareideas/comment")
    @SendTo("/topic/comment")
    public CommentSending addcomment(CommentMessage message) throws Exception {
        
        //System.out.println(message.getUid()+" "+message.getImage()+" "+message.getCtext()+" "+message.getPostid()+" "+message.getUname());
		String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Comment c=new Comment();
		c.setCtext(message.getCtext());
		c.setCtime(time);
		Post p=new Post();
		p.setId(message.getPostid());
		c.setPost(p);
		c.setUid(message.getUid());
		c.setUtime(time);
		Getdata.save(c);
        //System.out.println(post.getId());
        Thread.sleep(1000); // simulated delay
        
        return new CommentSending(c.getId(), c.getUid(), c.getCtext(), c.getCtime(), c.getUtime(), message.getUname(), message.getImage(), message.getPostid());
    }
	
	@MessageMapping("/shareideas/like")
    @SendTo("/topic/like")
    public LikeSending addlike(LikeMessage message) throws Exception {
        
        //System.out.println(message.getUid()+" "+message.getPostid());
		Post post=(Post) Getdata.onecolumnvaluewhere("Post", "id", Integer.toString(message.getPostid())).iterator().next();
		List m=Getdata.twocolumnvaluewhere("Like", "uid", Integer.toString(message.getUid()), "postid", Integer.toString(message.getPostid()));
		Like l;
		String action;
		if (m.isEmpty()) {
			
		
		l=new Like();
		
		post.setLikes(post.getLikes()+1);
		Getdata.update(post);
		l.setPost(post);
		l.setUid(message.getUid());
		Getdata.save(l);
		action="add";
		}
		else {
			l=(Like) m.iterator().next();
			Getdata.delete("Like", "id", l.getId());
			post.setLikes(post.getLikes()-1);
			Getdata.update(post);
			action="delete";
			
		}
        //System.out.println(post.getId());
        Thread.sleep(1000); // simulated delay
        
        return new LikeSending(l.getId(), l.getUid(), post.getId(),action);
    }
	
	@RequestMapping(value={"/resetform","/resetform/{error}"},method=RequestMethod.GET)
	public String resetform(@PathVariable Optional<String> error,Model model,@CookieValue(value="uname",defaultValue="") String uname)
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
		return "resetform";
	}
	
	@RequestMapping(value={"/resetform","/resetform/{error}"},method=RequestMethod.POST)
	public String resetform(HttpSession session,@RequestParam(value="email") String email,HttpServletResponse response,HttpServletRequest request)
	{
		int u2=0;
		int id=0;
		
		try {
			/*t=s.beginTransaction();
			Query query=s.createQuery("from User");
			List result=query.list();*/
			List result=Getdata.getData("UserLogin");
			Iterator i=result.iterator();
			
			while (i.hasNext()) {
				//System.out.println("saras");
				UserLogin u1 = (UserLogin) i.next();
				if (u1.getEmail().equals(email)&&u1.getStatus().equals("varified")) {
					id=u1.getId();
					u2=1;
					
					//System.out.println("saras");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		if (u2==0) {
			return "redirect:/resetform/1";
		}
		else{
			String token=UUID.randomUUID().toString();
			//String path=request.getContextPath();
			String url=request.getRequestURL().toString();
			String path=url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
			System.out.println(path);
			Calendar c=Calendar.getInstance();
			c.setTime(new Date());
			c.add(Calendar.DATE, 2);
			//String expiryDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(c.getTime());
			UserHealth uh=new UserHealth();
			uh.setId(id);
			PasswordResetToken prt=new PasswordResetToken(uh, token, c.getTime());
			Getdata.save(prt);
			String to=email;
			String from="snehamerchant1@gmail.com";
			String host="smtp.gmail.com";
			Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			
		      // Setup mail server
		      properties.setProperty("mail.smtp.host", host);
		      properties.setProperty("mail.smtp.socketFactory.fallback", "false");
		      properties.setProperty("mail.smtp.port", "465");
		      properties.setProperty("mail.smtp.socketFactory.port", "465");
		      properties.put("mail.smtp.auth", "true");
		      properties.put("mail.debug", "true");
		      properties.put("mail.store.protocol", "pop3");
		      properties.put("mail.transport.protocol", "smtp");
		      final String username = "snehamerchant1@gmail.com";//
		      final String password = "sneha@123";
		      
			try {
				Session session1 = Session.getDefaultInstance(properties,new Authenticator(){
		            protected PasswordAuthentication getPasswordAuthentication() {
		                return new PasswordAuthentication(username, password);
		             }}); 
				// Create a default MimeMessage object.
		         MimeMessage message = new MimeMessage(session1);

		         // Set From: header field of the header.
		         message.setFrom(new InternetAddress(from));

		         // Set To: header field of the header.
		         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		         // Set Subject: header field
		         message.setSubject("Fatfitandhealthy Reset Password Link");

		         // Now set the actual message
		         //message.setText("Name: "+name+"\nemail: "+email+"\nmessage: "+msg);
		         String content="<div style='padding: 10px; background-color: lightgray; display: block;'>";
		         content+="<h1>Fatfitandhealthy</h1>";
				content+="</div>";
				content+="<p>Hello User !</p>";
				content+="<p>Use the link below to reset your password. This link will expire in 2 days. Thank you.</p>";
				content+="<a href='"+path+"changePassword/"+token+"'>Reset your password</a>";
				content+="<p>A message from Fatfitandhealthy.</p>";
				content+="<div style='padding: 0.5px; background-color: lightgray; display: block;'>";
				content+="<h4>Message generated from : "+path+"</h4>";
				content+="</div>";
		         message.setContent(content, "text/html");

		         // Send message
		         Transport.send(message);
		         System.out.println("Sent message successfully....");
		         //return true;
		      }catch (MessagingException mex) {
		         mex.printStackTrace();
		         //return false;
		      }
			return "redirect:/resetform/2";
		}
		
	}
	
	@RequestMapping(value="/changePassword/{token}",method=RequestMethod.GET)
	public String changePassword(@PathVariable String token,Model model,@CookieValue(value="uname",defaultValue="") String uname)
	{
		PasswordResetToken passToken=null;
		List l=Getdata.onecolumnvaluewhere("PasswordResetToken", "token", token);
		//System.out.println(passToken.getId());
		if (!uname.equals("")) {
			//System.out.println("abc");
			return "redirect:/home";
		}
		if (l.isEmpty()) {
		        return "redirect:/tokenValidationError/1";
		    }
		else if (((PasswordResetToken) l.iterator().next()).getExpiryDate().before(new Date())) {
			return "redirect:/tokenValidationError/2";
		}
		else{
			passToken=(PasswordResetToken) l.iterator().next();
			return "redirect:/newPasswordReset/"+token;
		}
		
		
	}
	
	@RequestMapping(value="/newPasswordReset/{token}",method=RequestMethod.GET)
	public String newPasswordReset(@PathVariable String token,Model model,@CookieValue(value="uname",defaultValue="") String uname)
	{
		System.out.println(uname);
		if (!uname.equals("")) {
			//System.out.println("abc");
			return "redirect:/home";
		}
		
			
			//System.out.println("attribute set"+error.get());
			
				model.addAttribute("token", token);
			
			
		
		return "newPasswordReset";
	}
	
	@RequestMapping(value={"/tokenValidationError","/tokenValidationError/{error}"},method=RequestMethod.GET)
	public String tokenValidationError(@PathVariable Optional<String> error,Model model,@CookieValue(value="uname",defaultValue="") String uname)
	{
		//System.out.println(uname);
		if (!uname.equals("")) {
			//System.out.println("abc");
			return "redirect:/home";
		}
		
		if (error.isPresent()) {
			//System.out.println("attribute set"+error.get());
			
				model.addAttribute("error", error.get());
			
			
		}
		return "tokenValidationError";
	}
	
	@RequestMapping(value="/profile",method=RequestMethod.GET)
	public String profile(HttpSession session,@CookieValue(value="id",defaultValue="") String id,Model model) {
		
		
		if(!id.equals(""))
		{
			UserHealth uh=(UserHealth) Getdata.onecolumnvaluewhere("UserHealth", "id", id).iterator().next();
			model.addAttribute("UserHealth", uh);
			UserLogin ul=(UserLogin) Getdata.onecolumnvaluewhere("UserLogin", "id", id).iterator().next();
			model.addAttribute("UserLogin", ul);
			UsersPersonal up=(UsersPersonal) Getdata.onecolumnvaluewhere("UsersPersonal", "id", id).iterator().next();
			model.addAttribute("UsersPersonal", up);
			return "profile";
		}
			else
				return "redirect:/login";
	
		
		
	}
	
	@RequestMapping(value="/userupdate",method=RequestMethod.POST)
	public String userupdate(HttpSession session,HttpServletResponse response,HttpServletRequest request,@ModelAttribute("UserLogin") UserLogin ul,BindingResult resultUserLogin,@ModelAttribute("UsersPersonal") UsersPersonal up,BindingResult resultUsersPersonal,@ModelAttribute("UserHealth") UserHealth uh,BindingResult resultUserHealth,@RequestParam(value="file") MultipartFile file) throws IOException {
		
		String path=request.getServletContext().getRealPath("/").replace("\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps", "")+"src\\main\\webapp\\resources\\image\\user";
		UserHealth uhr=(UserHealth) Getdata.onecolumnvaluewhere("UserHealth", "id", Integer.toString(ul.getId())).iterator().next();
		UserLogin ulr=(UserLogin) Getdata.onecolumnvaluewhere("UserLogin", "id", Integer.toString(ul.getId())).iterator().next();
		Cookie uimage=WebUtils.getCookie(request, "uimage");
		uimage.setValue(ul.getId()+ul.getImage());
		response.addCookie(uimage);
		//System.out.println(path);
		//System.out.println(ul.getEmail()+up.getMobNo()+uh.getActivityFactor());
		ul.setEditTimestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		ul.setStatus(ulr.getStatus());
		ul.setCreateTimestamp(ulr.getCreateTimestamp());
		//ul.setImage(ul.getId()+ul.getImage().substring(ul.getImage().lastIndexOf(".")));
		if (file.getOriginalFilename()!=null&&!file.getOriginalFilename().isEmpty()) {
			ul.setImage(ul.getId()+ul.getImage());
			File file1=new File(path+File.separator+((UserLogin)Getdata.onecolumnvaluewhere("UserLogin", "id", ul.getId().toString()).iterator().next()).getImage());
			file1.delete();
		}
		Getdata.update(ul);
if (!file.getOriginalFilename().isEmpty()) {
			
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(path);
				//System.out.println("E:\\javapractise\\spring\\facebook\\src\\main\\webapp\\image");
				if (!dir.exists())
					dir.mkdirs();
				//System.out.println(dir.getAbsolutePath()+ File.separator + u.getImage());
				// Create the file on server
				
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + ul.getId()+ul.getImage().substring(ul.getImage().lastIndexOf(".")));
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+serverFile.getAbsolutePath());

				//return "You successfully uploaded file=" + name; 
			} catch (Exception e) {
				System.out.println("You failed to upload " + ul.getImage() + " => " + e.getMessage());
			}
		}
		
		up.setId(ul.getId());
		/*
		uh.setId(ul.getId());
		uh.setUno(ul.getId()); */
		uhr.setHeight(uh.getHeight());
		Getdata.update(up);  /*
		if (uh.getWeightGoal().equals("maintain weight")) {
			uh.setKgs("0");
		}*/
		double daily_cal_goal=Getdata.calcuatecalgoal(up.getDob(), up.getGender(), uhr.getWeight(), uhr.getHeight(), uhr.getActivityFactor(), uhr.getWeightGoal(), uhr.getKgs());
		uhr.setDailyCalGoal(Double.toString(Math.round(daily_cal_goal)));
		Getdata.update(uhr);  
		return "redirect:/profile";
		
	}
	
}
