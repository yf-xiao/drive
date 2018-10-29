package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.DriversDAO;
import com.dao.UsersDAO;
import com.entity.Drivers;
import com.entity.Users;
import com.util.VeDate;

//定义为控制器
@Controller
//设置路径
@RequestMapping("/text")
public class TextAction extends BaseAction {
	@Autowired
	private UsersDAO usersDAO;
	@Autowired
	private DriversDAO driversDAO;
	// 用户名重复检测
	@RequestMapping("textUserName.action")
	@ResponseBody
	public Map<String,String> textUserName(String username) throws IOException{
		Map<String,String> map = new HashMap<String, String>();
		Users u = new Users();
		u.setUsername(username);
		List<Users> usersList = this.usersDAO.getUsersByCond(u);
		if(username.trim().equals("")){
			map.put("msg", "该项为必填项");
		}else if(usersList.size()>=1){
			map.put("msg", "用户名已存在");
		}else if(!username.matches("^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$")){
	    	map.put("msg", "用户名需3-16位（数字、字母（大小写）、下划线）");
	    }else{
			map.put("msg", "");
		}
		return map;
	}

	//司机账号重复性检测
	@RequestMapping("textDriversName.action")
	@ResponseBody
	public Map<String,String> textDriversName(String username) throws IOException{
		Map<String,String> map = new HashMap<String, String>();
		Drivers drivers = new Drivers();
		drivers.setUsername(username);
		List<Drivers> list = this.driversDAO.getDriversByCond(drivers);
		if(username.trim().equals("")){
			map.put("msg", "该项为必填项");
		}else if(list.size()>=1){
			map.put("msg", "用户名已存在");
		}else if(!username.matches("^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$")){
	    	map.put("msg", "用户名需3-16位（数字、字母（大小写）、下划线）");
	    }else{
			map.put("msg", "");
		}
		return map;
	}
}
