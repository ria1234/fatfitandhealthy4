package fatfitandhealthy.admincontrollers;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.faces.bean.ViewScoped;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import fatfitandhealthy.dao.Admin;
import fatfitandhealthy.hibernate.Getdata;
import fatfitandhealthy.jsonview.Views;

@RestController
public class ajaxcontroller {
	@JsonView(Views.Public.class)
	@RequestMapping(value="/admin/editadmin",method=RequestMethod.POST)
	public void permission(@RequestParam int id,@RequestParam int permission)
	{
		//System.out.println(id+" "+permission);
		Admin admin=(Admin) Getdata.onecolumnvaluewhere("Admin", "id", String.valueOf(id)).iterator().next();
		admin.setPermission(permission);
		admin.setEditTimestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		Getdata.update(admin);
		
	}
	@JsonView(Views.Public.class)
	@RequestMapping(value="/admin/admindelete",method=RequestMethod.POST)
	public void admindelete(@RequestParam int id,@RequestParam String image)
	{
		Getdata.delete("Admin", "id", id);
		File file=new File("F:\\fatfitandhealthy\\fatfitandhealthy\\src\\main\\webapp\\resources\\image\\admin"+File.separator+image);
		file.delete();
		
	}
}
	