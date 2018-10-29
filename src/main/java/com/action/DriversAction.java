package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.DriversDAO;
import com.entity.Drivers;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/drivers")
public class DriversAction extends BaseAction {
	@Autowired
	private DriversDAO driversDAO;

	// 准备添加数据
	@RequestMapping("createDrivers.action")
	public String createDrivers(Map<String, Object> map) {
		return "admin/adddrivers";
	}

	// 添加数据
	@RequestMapping("addDrivers.action")
	public String addDrivers(Drivers drivers) {
		drivers.setDriversid(VeDate.getStringDatex());
		this.driversDAO.insertDrivers(drivers);
		return "redirect:/drivers/createDrivers.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteDrivers.action")
	public String deleteDrivers(String id) {
		this.driversDAO.deleteDrivers(id);
		return "redirect:/drivers/getAllDrivers.action";
	}

	// 更新数据
	@RequestMapping("updateDrivers.action")
	public String updateDrivers(Drivers drivers) {
		this.driversDAO.updateDrivers(drivers);
		return "redirect:/drivers/getAllDrivers.action";
	}

	// 按主键查询数据
	@RequestMapping("status.action")
	public String status(String id, Map<String, Object> map) {
		Drivers drivers = this.driversDAO.getDriversById(id);
		String status = "锁定";
		if ("锁定".equals(drivers.getStatus())) {
			status = "解锁";
		} else {
			status = "锁定";
		}
		drivers.setStatus(status);
		this.driversDAO.updateDrivers(drivers);
		return "redirect:/drivers/getAllDrivers.action";
	}

	// 显示全部数据
	@RequestMapping("getAllDrivers.action")
	public String getAllDrivers(String number, Map<String, Object> map) {
		List<Drivers> driversList = new ArrayList<Drivers>();
		List<Drivers> tempList = new ArrayList<Drivers>();
		tempList = this.driversDAO.getAllDrivers();
		int pageNumber = tempList.size();
		int maxPage = pageNumber;
		if (maxPage % 10 == 0) {
			maxPage = maxPage / 10;
		} else {
			maxPage = maxPage / 10 + 1;
		}
		if (number == null) {
			number = "0";
		}
		int start = Integer.parseInt(number) * 10;
		int over = (Integer.parseInt(number) + 1) * 10;
		int count = pageNumber - over;
		if (count <= 0) {
			over = pageNumber;
		}
		for (int i = start; i < over; i++) {
			Drivers drivers = tempList.get(i);
			driversList.add(drivers);
		}
		String html = "";
		StringBuffer buffer = new StringBuffer();
		buffer.append("&nbsp;&nbsp;共为");
		buffer.append(maxPage);
		buffer.append("页&nbsp; 共有");
		buffer.append(pageNumber);
		buffer.append("条&nbsp; 当前为第");
		buffer.append((Integer.parseInt(number) + 1));
		buffer.append("页 &nbsp;");
		if ((Integer.parseInt(number) + 1) == 1) {
			buffer.append("首页");
		} else {
			buffer.append("<a href=\"drivers/getAllDrivers.action?number=0\">首页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(number) + 1) == 1) {
			buffer.append("上一页");
		} else {
			buffer.append(
					"<a href=\"drivers/getAllDrivers.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("下一页");
		} else {
			buffer.append(
					"<a href=\"drivers/getAllDrivers.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("尾页");
		} else {
			buffer.append("<a href=\"drivers/getAllDrivers.action?number=" + (maxPage - 1) + "\">尾页</a>");
		}
		html = buffer.toString();
		map.put("html", html);
		map.put("driversList", driversList);
		return "admin/listdrivers";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryDriversByCond.action")
	public String queryDriversByCond(String cond, String name, Map<String, Object> map) {
		List<Drivers> driversList = new ArrayList<Drivers>();
		Drivers drivers = new Drivers();
		if (cond != null) {
			if ("username".equals(cond)) {
				drivers.setUsername(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("password".equals(cond)) {
				drivers.setPassword(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("realname".equals(cond)) {
				drivers.setRealname(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("sex".equals(cond)) {
				drivers.setSex(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("birthday".equals(cond)) {
				drivers.setBirthday(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("idcard".equals(cond)) {
				drivers.setIdcard(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("contact".equals(cond)) {
				drivers.setContact(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("num".equals(cond)) {
				drivers.setNum(Integer.parseInt(name));
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("status".equals(cond)) {
				drivers.setStatus(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("image".equals(cond)) {
				drivers.setImage(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
			if ("regdate".equals(cond)) {
				drivers.setRegdate(name);
				driversList = this.driversDAO.getDriversByLike(drivers);
			}
		}
		map.put("driversList", driversList);
		return "admin/querydrivers";
	}

	// 按主键查询数据
	@RequestMapping("getDriversById.action")
	public String getDriversById(String id, Map<String, Object> map) {
		Drivers drivers = this.driversDAO.getDriversById(id);
		map.put("drivers", drivers);
		return "admin/editdrivers";
	}
}
