package fatfitandhealthy.admincontrollers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fatfitandhealthy.dao.Admin;
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
		a.setCreateTimestamp(new SimpleDateFormat("E MMM dd yyyy HH:mm:ss").format(new Date()));
		a.setEditTimestamp(new SimpleDateFormat("E MMM dd yyyy HH:mm:ss").format(new Date()));
		a.setRole("admin");
		System.out.println(a.toString());
		Getdata.save(a);
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
		return null;
		
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
				Admin u1 = (Admin) i.next();
				if (u1.getEmail().equals(u.getEmail())&&u1.getPassword().equals(u.getPassword())&&u1.getPermission()==1) {
					session.setAttribute("aname", u1.getFirstname()+" "+u1.getLastname());					
					session.setAttribute("uid", u1.getId());					
					u2=1;
					
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
	public String index(HttpSession session) {
		if(session.getAttribute("aname")!=null)
		return "admin/index";
		else
			return "redirect:/admin/";
		
	}
	@RequestMapping(value="/signout",method=RequestMethod.GET)
	public String signout(HttpSession session) {
		session.removeAttribute("uid");
		session.removeAttribute("aname");
		return "redirect:/admin/";
		
	}
	@RequestMapping(value="/manageadmin",method=RequestMethod.GET)
	public String manageadmin(HttpSession session,Model model) {
		List<Admin> l=Getdata.onecolumnvaluewhere("Admin", "role", "admin");
		model.addAttribute("admin", l);
		if(session.getAttribute("aname")!=null)
			return "admin/manageadmin";
			else
				return "redirect:/admin/";
		
	}
}
