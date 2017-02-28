package fatfitandhealthy.admincontrollers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Optional;
import java.util.Map.Entry;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import antlr.StringUtils;
import fatfitandhealthy.dao.Admin;
import fatfitandhealthy.dao.Breakfast;
import fatfitandhealthy.dao.Comment;
import fatfitandhealthy.dao.Dinner;
import fatfitandhealthy.dao.Exercise;
import fatfitandhealthy.dao.ExerciseLog;
import fatfitandhealthy.dao.FoodItems;
import fatfitandhealthy.dao.Lunch;
import fatfitandhealthy.dao.Post;
import fatfitandhealthy.dao.UserHealth;
import fatfitandhealthy.dao.UserLogin;
import fatfitandhealthy.dao.UsersPersonal;
import fatfitandhealthy.hibernate.Getdata;

@Controller
@RequestMapping(value="/admin")
public class adminlogin {
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(HttpSession session) {
		if(session.getAttribute("aname")==null)
		return "admin/signup";
		else
			return "redirect:/dashboard";
		
	}
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signup(HttpSession session,@ModelAttribute Admin a,@RequestParam(value="file") MultipartFile file,HttpServletResponse response) {
		a.setCreateTimestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		a.setEditTimestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		a.setRole("admin");
		
		
		Getdata.save(a);
		a.setImage(a.getId()+a.getImage().substring(a.getImage().lastIndexOf(".")));
		Getdata.update(a);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File("F:\\fatfitandhealthy\\fatfitandhealthy\\src\\main\\webapp\\resources\\image\\admin");
				//System.out.println("E:\\javapractise\\spring\\facebook\\src\\main\\webapp\\image");
				if (!dir.exists())
					dir.mkdirs();
				//System.out.println(dir.getAbsolutePath()+ File.separator + u.getImage());
				// Create the file on server
				
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + a.getId()+a.getImage().substring(a.getImage().lastIndexOf(".")));
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+serverFile.getAbsolutePath());

				//return "You successfully uploaded file=" + name; 
			} catch (Exception e) {
				System.out.println("You failed to upload " + a.getImage() + " => " + e.getMessage());
			}
		} else {
			System.out.println("You failed to upload " + a.getImage()
					+ " because the file was empty."); 
		}
		return "redirect:/admin/";
		
	}
	@RequestMapping(value={"/","/{error}"},method=RequestMethod.GET)
	public String login(@PathVariable Optional<String> error,Model model,HttpSession session) {
		if (session.getAttribute("aname")!=null) {
			return "redirect:/admin/dashboard";
		}
		
		if (error.isPresent()) {
			//System.out.println("attribute set"+error.get());
			
				model.addAttribute("error", error.get());
			
			
		}
		return "admin/login";
		
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(HttpSession session,@ModelAttribute Admin u) {
		Transaction t=null;
		int u2=0;
		try {
			/*t=s.beginTransaction();
			Query query=s.createQuery("from User");
			List result=query.list();*/
			List result=Getdata.getData("Admin");
			Iterator i=result.iterator();
			
			while (i.hasNext()) {
				System.out.println("saras");
				Admin u1 = (Admin) i.next();
				if (u1.getEmail().equals(u.getEmail())&&u1.getPassword().equals(u.getPassword())&&u1.getPermission()==1) {
					session.setAttribute("aname", u1.getFirstname()+" "+u1.getLastname());					
					session.setAttribute("role", u1.getRole());
					session.setAttribute("image", u1.getImage());
					session.setAttribute("uid", u1.getId());
					u2=1;
					System.out.println("saras");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
		}
		
		if (u2==0) {
			return "redirect:/admin/1";
		}
		else{
			return "redirect:/admin/dashboard";
		}
		
	}
	@RequestMapping(value="/dashboard",method=RequestMethod.GET)
	public String index(HttpSession session,Model model) throws ParseException {
		
		if(session.getAttribute("aname")!=null)
		{
		int nu=0;
		List<UserLogin> ul=Getdata.getData("UserLogin");
		ListIterator<UserLogin> u=ul.listIterator(ul.size());
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		Calendar cal = Calendar.getInstance();
		Date c=new Date();
		cal.setTime(c);
		cal.add(Calendar.DATE, -7);
		c=cal.getTime();
		//System.out.println(format.format(c));
		while (u.hasPrevious()) {
			
			UserLogin userLogin = (UserLogin) u.previous();
			
			Date d=format.parse(userLogin.getCreateTimestamp());
			/*cal.setTime(d);
			cal.set(Calendar.HOUR_OF_DAY, 0);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			cal.set(Calendar.MILLISECOND, 0);
			d = cal.getTime();*/
			
			
			
			/*cal.set(Calendar.HOUR_OF_DAY, 0);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			cal.set(Calendar.MILLISECOND, 0);
			c = cal.getTime();*/
			if (d.after(c)) {
				//System.out.println(format.format(d));
				nu++;
			}
		}
		model.addAttribute("nu",nu);
		int np=0;
		Iterator<Post> lp=Getdata.getData("Post").iterator();
		while (lp.hasNext()) {
			Post post = (Post) lp.next();
			Date d=format.parse(post.getCtime());
			if (d.after(c)) {
				np++;
			}
		}
		model.addAttribute("np", np);
		int nc=0;
		Iterator<Comment> lc=Getdata.getData("Comment").iterator();
		while (lc.hasNext()) {
			Comment comment = (Comment) lc.next();
			Date d=format.parse(comment.getCtime());
			if (d.after(c)) {
				nc++;
			}
		}
		model.addAttribute("nc",nc);
		Iterator<Breakfast> bf=Getdata.getData("Breakfast").iterator();
		HashMap<String, Integer> bhHashMap=new HashMap<String,Integer>();
		while (bf.hasNext()) {
			Breakfast breakfast = (Breakfast) bf.next();
			String name=breakfast.getFoodItems().getName();
			if (bhHashMap.containsKey(name)) {
				bhHashMap.put(name, bhHashMap.get(name)+1);
			}
			else{
				bhHashMap.put(name, 1);
			}
		}
		Iterator<Lunch> lu=Getdata.getData("Lunch").iterator();
		while (lu.hasNext()) {
			Lunch lunch = (Lunch) lu.next();
			String name=lunch.getFoodItems().getName();
			if (bhHashMap.containsKey(name)) {
				bhHashMap.put(name, bhHashMap.get(name)+1);
			}
			else{
				bhHashMap.put(name, 1);
			}
		}
		Iterator<Dinner> dn=Getdata.getData("Dinner").iterator();
		while (dn.hasNext()) {
			Dinner dinner = (Dinner) dn.next();
			String name=dinner.getFoodItems().getName();
			if (bhHashMap.containsKey(name)) {
				bhHashMap.put(name, bhHashMap.get(name)+1);
			} else {
				bhHashMap.put(name, 1);
			}
		}
		List<Entry<String, Integer>> tf=entriesSortedByValues(bhHashMap);
		int s=10;
		if (tf.size()<10) {
			s=tf.size();
		}
		model.addAttribute("tenfood",tf.subList(0,s));
		//System.out.println(bhHashMap);
		HashMap<String, Integer> eHashMap=new HashMap<String,Integer>();
		Iterator<ExerciseLog> ie=Getdata.getData("ExerciseLog").iterator();
		while (ie.hasNext()) {
			ExerciseLog exerciseLog = (ExerciseLog) ie.next();
			String name=((Exercise)Getdata.onecolumnvaluewhere("Exercise", "id", Integer.toString(exerciseLog.getExercise().getId())).iterator().next()).getName();
			if (eHashMap.containsKey(name)) {
				eHashMap.put(name, eHashMap.get(name)+1);
			}
			else{
				eHashMap.put(name, 1);
			}
		}
		List<Entry<String, Integer>> te=entriesSortedByValues(eHashMap);
		s=10;
		if (te.size()<10) {
			s=te.size();
		}
		model.addAttribute("tenexercise",te.subList(0,s));
		return "admin/index";
		}
		else
			return "redirect:/admin/";
		
	}
	@RequestMapping(value="/signout",method=RequestMethod.GET)
	public String signout(HttpSession session) {
		session.removeAttribute("uid");
		session.removeAttribute("aname");
		session.removeAttribute("image");
		session.removeAttribute("role");
		return "redirect:/admin/";
		
	}
	@RequestMapping(value="/manageadmin",method=RequestMethod.GET)
	public String manageadmin(HttpSession session,Model model) {
		List<Admin> l=Getdata.onecolumnvaluewhere("Admin", "role", "admin");
		System.out.println(l);
		model.addAttribute("admin", l);
		if(session.getAttribute("aname")!=null&&session.getAttribute("role").equals("superadmin"))
			return "admin/manageadmin";
			else
				return "redirect:/admin/";
		
	}
	@RequestMapping(value="/adminupdate/{id}",method=RequestMethod.GET)
	public String adminupdate(HttpSession session,Model model,@PathVariable int id)
	{
		Admin admin=(Admin)Getdata.onecolumnvaluewhere("Admin", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("admin", admin);
		if (session.getAttribute("aname")==null||session.getAttribute("role").equals("admin")) {
			return "redirect:/admin/";
		}
		return "admin/adminupdate";
		
	}
	@RequestMapping(value="/adminupdate",method=RequestMethod.POST)
	public String adminupdate(HttpSession session,@ModelAttribute("admin") Admin a,@RequestParam(value="file") MultipartFile file)
	{
		a.setEditTimestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		if (file.getOriginalFilename()!=null&&!file.getOriginalFilename().isEmpty()) {
			a.setImage(a.getId()+a.getImage());
			File file1=new File("F:\\fatfitandhealthy\\fatfitandhealthy\\src\\main\\webapp\\resources\\image\\admin"+File.separator+((Admin)Getdata.onecolumnvaluewhere("Admin", "id", a.getId().toString()).iterator().next()).getImage());
			file1.delete();
		}
		//System.out.println(a.getImage());
		Getdata.update(a);
		if (!file.getOriginalFilename().isEmpty()) {
			
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File("F:\\fatfitandhealthy\\fatfitandhealthy\\src\\main\\webapp\\resources\\image\\admin");
				//System.out.println("E:\\javapractise\\spring\\facebook\\src\\main\\webapp\\image");
				if (!dir.exists())
					dir.mkdirs();
				//System.out.println(dir.getAbsolutePath()+ File.separator + u.getImage());
				// Create the file on server
				
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + a.getId()+a.getImage().substring(a.getImage().lastIndexOf(".")));
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+serverFile.getAbsolutePath());

				//return "You successfully uploaded file=" + name; 
			} catch (Exception e) {
				System.out.println("You failed to upload " + a.getImage() + " => " + e.getMessage());
			}
		}
		
		return "redirect:/admin/manageadmin";
		
	}
	@RequestMapping(value="/manageusers",method=RequestMethod.GET)
	public String manageusers(HttpSession session,Model model) {
		
		List<UserLogin> l=Getdata.getData("UserLogin");
		model.addAttribute("user", l);
		if(session.getAttribute("aname")!=null)
			return "admin/manageusers";
			else
				return "redirect:/admin/";
		
	}
	@RequestMapping(value="/userupdate/{id}",method=RequestMethod.GET)
	public String userupdate(HttpSession session,ModelMap model,@PathVariable int id)
	{
		UserLogin ul=(UserLogin)Getdata.onecolumnvaluewhere("UserLogin", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("UserLogin", ul);
		UserHealth uh=(UserHealth)Getdata.onecolumnvaluewhere("UserHealth", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("UserHealth", uh);
		UsersPersonal up=(UsersPersonal)Getdata.onecolumnvaluewhere("UsersPersonal", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("UsersPersonal", up);
		if (session.getAttribute("aname")==null) {
			return "redirect:/admin/";
		}
		return "admin/userupdate";
		
	}
	@RequestMapping(value="/userupdate",method=RequestMethod.POST)
	public String userupdate(HttpSession session,@ModelAttribute("UserLogin") UserLogin ul,BindingResult resultUserLogin,@ModelAttribute("UsersPersonal") UsersPersonal up,BindingResult resultUsersPersonal,@ModelAttribute("UserHealth") UserHealth uh,BindingResult resultUserHealth,@RequestParam(value="file") MultipartFile file) {
		//System.out.println(ul.getEmail()+up.getMobNo()+uh.getActivityFactor());
		ul.setEditTimestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		//ul.setImage(ul.getId()+ul.getImage().substring(ul.getImage().lastIndexOf(".")));
		if (file.getOriginalFilename()!=null&&!file.getOriginalFilename().isEmpty()) {
			ul.setImage(ul.getId()+ul.getImage());
			File file1=new File("F:\\fatfitandhealthy\\fatfitandhealthy\\src\\main\\webapp\\resources\\image\\user"+File.separator+((UserLogin)Getdata.onecolumnvaluewhere("UserLogin", "id", ul.getId().toString()).iterator().next()).getImage());
			file1.delete();
		}
		Getdata.update(ul);
if (!file.getOriginalFilename().isEmpty()) {
			
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
		uh.setId(ul.getId());
		uh.setUno(ul.getId());
		Getdata.update(up);
		if (uh.getWeightGoal().equals("maintain weight")) {
			uh.setKgs("0");
		}
		double daily_cal_goal=Getdata.calcuatecalgoal(up.getDob(), up.getGender(), uh.getWeight(), uh.getHeight(), uh.getActivityFactor(), uh.getWeightGoal(), uh.getKgs());
		uh.setDailyCalGoal(Double.toString(Math.round(daily_cal_goal)));
		Getdata.update(uh);
		return "redirect:/admin/manageusers";
		
	}
	@RequestMapping(value="/userdetail/{id}",method=RequestMethod.GET)
	public String userdetail(HttpSession session,ModelMap model,@PathVariable int id) {
		UserLogin ul=(UserLogin)Getdata.onecolumnvaluewhere("UserLogin", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("UserLogin", ul);
		UserHealth uh=(UserHealth)Getdata.onecolumnvaluewhere("UserHealth", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("UserHealth", uh);
		UsersPersonal up=(UsersPersonal)Getdata.onecolumnvaluewhere("UsersPersonal", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("UsersPersonal", up);
		if (session.getAttribute("aname")==null) {
			return "redirect:/admin/";
		}
		return "admin/userdetail";
		
	}
	@RequestMapping(value="/managefooditems",method=RequestMethod.GET)
	public String managefooditems(HttpSession session,Model model) {
		List<FoodItems> l=Getdata.getData("FoodItems");
		model.addAttribute("FoodItems", l);
		if(session.getAttribute("aname")!=null)
			return "admin/managefooditems";
			else
				return "redirect:/admin/";
		
	}
	@RequestMapping(value="/managefooditems/newfooditem",method=RequestMethod.GET)
	public String addfooditem(HttpSession session) {
		
		if(session.getAttribute("aname")!=null)
			return "admin/addfooditem";
			else
				return "redirect:/admin/";
		
	}
	@RequestMapping(value="/addfooditem",method=RequestMethod.POST)
	public String addfooditem(HttpSession session,@ModelAttribute FoodItems fi) {
		Getdata.save(fi);
		return "redirect:/admin/managefooditems";
		
	}
	
	@RequestMapping(value="/foodupdate/{id}",method=RequestMethod.GET)
	public String foodupdate(HttpSession session,ModelMap model,@PathVariable int id)
	{
		FoodItems fi=(FoodItems)Getdata.onecolumnvaluewhere("FoodItems", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("FoodItems", fi);
		
		if (session.getAttribute("aname")==null) {
			return "redirect:/admin/";
		}
		return "admin/foodupdate";
		
	}
	@RequestMapping(value="/updatefooditem",method=RequestMethod.POST)
	public String foodupdate(HttpSession session,@ModelAttribute FoodItems fi) {
		Getdata.update(fi);
		return "redirect:/admin/managefooditems";
		
	}
	@RequestMapping(value="/fooddetails/{id}",method=RequestMethod.GET)
	public String fooddetails(HttpSession session,ModelMap model,@PathVariable int id) {
		FoodItems fi=(FoodItems)Getdata.onecolumnvaluewhere("FoodItems", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("FoodItems", fi);
		
		if (session.getAttribute("aname")==null) {
			return "redirect:/admin/";
		}
		return "admin/fooddetail";
		
	}
	@RequestMapping(value="/manageexerciseitems",method=RequestMethod.GET)
	public String manageexerciseitems(HttpSession session,Model model) {
		List<Exercise> l=Getdata.getData("Exercise");
		model.addAttribute("Exercise", l);
		if(session.getAttribute("aname")!=null)
			return "admin/manageexerciseitems";
			else
				return "redirect:/admin/";
		
	}
	@RequestMapping(value="/manageexerciseitems/newexerciseitem",method=RequestMethod.GET)
	public String addexerciseitem(HttpSession session) {
		
		if(session.getAttribute("aname")!=null)
			return "admin/addexerciseitem";
			else
				return "redirect:/admin/";
		
	}
	@RequestMapping(value="/addexerciseitem",method=RequestMethod.POST)
	public String addexerciseitem(HttpSession session,@ModelAttribute Exercise e) {
		Getdata.save(e);
		return "redirect:/admin/manageexerciseitems";
		
	}
	@RequestMapping(value="/updateexerciseitem",method=RequestMethod.POST)
	public String exerciseupdate(HttpSession session,@ModelAttribute Exercise e) {
		Getdata.update(e);
		return "redirect:/admin/manageexerciseitems";
		
	}
	@RequestMapping(value="/exerciseupdate/{id}",method=RequestMethod.GET)
	public String exerciseupdate(HttpSession session,ModelMap model,@PathVariable int id)
	{
		Exercise e=(Exercise)Getdata.onecolumnvaluewhere("Exercise", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("Exercise", e);
		
		if (session.getAttribute("aname")==null) {
			return "redirect:/admin/";
		}
		return "admin/exerciseupdate";
		
	}
	
	@RequestMapping(value="/managePostsAndComments",method=RequestMethod.GET)
	public String managePostsAndComments(HttpSession session,Model model) {
		List<Object> l=Getdata.getpostencoder();
		model.addAttribute("Post", l);
		if(session.getAttribute("aname")!=null)
			return "admin/managePostsAndComments";
			else
				return "redirect:/admin/";
		
	}
	
	@RequestMapping(value="/commentdetail/{id}",method=RequestMethod.GET)
	public String commentdetail(HttpSession session,ModelMap model,@PathVariable int id)
	{
		List<Object> l=Getdata.fetchcomments(id);
		model.addAttribute("Comment", l);
		
		if (session.getAttribute("aname")==null) {
			return "redirect:/admin/";
		}
		return "admin/commentdetail";
		
	}
	
	@RequestMapping(value="/adminprofile",method=RequestMethod.GET)
	public String adminprofile(HttpSession session,Model model) {
		
		
		if(session.getAttribute("aname")!=null&&!session.getAttribute("aname").equals(""))
		{
			Admin a=(Admin) Getdata.onecolumnvaluewhere("Admin", "id", session.getAttribute("uid").toString()).iterator().next();
			model.addAttribute("Admin", a);
			
			return "admin/adminprofile";
		}
			else
				return "redirect:/admin/";
	
		
		
	}
	
	@RequestMapping(value="/adminprofile",method=RequestMethod.POST)
	public String adminprofile(HttpSession session,HttpServletResponse response,HttpServletRequest request,@ModelAttribute("Admin") Admin a,@RequestParam(value="file") MultipartFile file) throws IOException {
		
		String path=request.getServletContext().getRealPath("/").replace("\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps", "")+"src\\main\\webapp\\resources\\image\\admin";
		session.setAttribute("image", a.getId()+a.getImage());
		
		
		//System.out.println(path);
		//System.out.println(ul.getEmail()+up.getMobNo()+uh.getActivityFactor());
		
		
		
		//ul.setImage(ul.getId()+ul.getImage().substring(ul.getImage().lastIndexOf(".")));
		if (file.getOriginalFilename()!=null&&!file.getOriginalFilename().isEmpty()) {
			a.setImage(a.getId()+a.getImage());
			File file1=new File(path+File.separator+((Admin)Getdata.onecolumnvaluewhere("Admin", "id", a.getId().toString()).iterator().next()).getImage());
			file1.delete();
		}
		Getdata.update(a);
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
						+ File.separator + a.getId()+a.getImage().substring(a.getImage().lastIndexOf(".")));
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+serverFile.getAbsolutePath());

				//return "You successfully uploaded file=" + name; 
			} catch (Exception e) {
				System.out.println("You failed to upload " + a.getImage() + " => " + e.getMessage());
			}
		}
		
		
		/*
		uh.setId(ul.getId());
		uh.setUno(ul.getId()); */
	  /*
		if (uh.getWeightGoal().equals("maintain weight")) {
			uh.setKgs("0");
		}*/
		
		  
		return "redirect:/admin/adminprofile";
		
	}
	
	static <K,V extends Comparable<? super V>> 
    List<Entry<K, V>> entriesSortedByValues(Map<K,V> map) {

List<Entry<K,V>> sortedEntries = new ArrayList<Entry<K,V>>(map.entrySet());

Collections.sort(sortedEntries, 
    new Comparator<Entry<K,V>>() {
        @Override
        public int compare(Entry<K,V> e1, Entry<K,V> e2) {
            return e2.getValue().compareTo(e1.getValue());
        }
    }
);

return sortedEntries;
}
}
