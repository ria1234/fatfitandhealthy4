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

import antlr.StringUtils;
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
		session.removeAttribute("image");
		return "redirect:/admin/";
		
	}
	@RequestMapping(value="/manageadmin",method=RequestMethod.GET)
	public String manageadmin(HttpSession session,Model model) {
		List<Admin> l=Getdata.onecolumnvaluewhere("Admin", "role", "admin");
		System.out.println(l);
		model.addAttribute("admin", l);
		if(session.getAttribute("aname")!=null)
			return "admin/manageadmin";
			else
				return "redirect:/admin/";
		
	}
	@RequestMapping(value="/adminupdate/{id}",method=RequestMethod.GET)
	public String adminupdate(HttpSession session,Model model,@PathVariable int id)
	{
		Admin admin=(Admin)Getdata.onecolumnvaluewhere("Admin", "id", String.valueOf(id)).iterator().next();
		model.addAttribute("admin", admin);
		if (session.getAttribute("aname")==null) {
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
}
