package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.ApplysDAO;
import com.dao.DriversDAO;
import com.entity.Applys;
import com.entity.Drivers;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/applys")
public class ApplysAction extends BaseAction {
	@Autowired
	private ApplysDAO applysDAO;
	@Autowired
	private DriversDAO driversDAO;

	// 准备添加数据
	@RequestMapping("createApplys.action")
	public String createApplys(Map<String, Object> map) {
		return "admin/addapplys";
	}

	// 添加数据
	@RequestMapping("addApplys.action")
	public String addApplys(Applys applys) {
		applys.setApplysid(VeDate.getStringDatex());
		this.applysDAO.insertApplys(applys);
		return "redirect:/applys/createApplys.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteApplys.action")
	public String deleteApplys(String id) {
		this.applysDAO.deleteApplys(id);
		return "redirect:/applys/getAllApplys.action";
	}

	// 通过审批
	@RequestMapping("over.action")
	public String over(String id) {
		Applys applys = this.applysDAO.getApplysById(id);
		applys.setStatus("已审批");
		Drivers drivers = this.driversDAO.getDriversById(applys.getDriversid());
		double money = applys.getMoney();
		double dmoney =drivers.getMoney();
		if (money > dmoney) {
			this.getRequest().setAttribute("message", "账户余额不足");
			this.applysDAO.updateApplys(applys);
		} else {
			this.applysDAO.updateApplys(applys);
			dmoney = dmoney - money;
			drivers.setMoney(dmoney);
			this.driversDAO.updateDrivers(drivers);
		}
		return "redirect:/applys/getAllApplys.action";
	}

	// 更新数据
	@RequestMapping("updateApplys.action")
	public String updateApplys(Applys applys) {
		this.applysDAO.updateApplys(applys);
		return "redirect:/applys/getAllApplys.action";
	}

	// 显示全部数据
	@RequestMapping("getAllApplys.action")
	public String getAllApplys(String number, Map<String, Object> map) {
		List<Applys> applysList = new ArrayList<Applys>();
		List<Applys> tempList = new ArrayList<Applys>();
		tempList = this.applysDAO.getAllApplys();
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
			Applys applys = tempList.get(i);
			applysList.add(applys);
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
			buffer.append("<a href=\"applys/getAllApplys.action?number=0\">首页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(number) + 1) == 1) {
			buffer.append("上一页");
		} else {
			buffer.append(
					"<a href=\"applys/getAllApplys.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("下一页");
		} else {
			buffer.append(
					"<a href=\"applys/getAllApplys.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("尾页");
		} else {
			buffer.append("<a href=\"applys/getAllApplys.action?number=" + (maxPage - 1) + "\">尾页</a>");
		}
		html = buffer.toString();
		map.put("html", html);
		map.put("applysList", applysList);
		return "admin/listapplys";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryApplysByCond.action")
	public String queryApplysByCond(String cond, String name, Map<String, Object> map) {
		List<Applys> applysList = new ArrayList<Applys>();
		Applys applys = new Applys();
		if (cond != null) {
			if ("driversid".equals(cond)) {
				applys.setDriversid(name);
				applysList = this.applysDAO.getApplysByLike(applys);
			}
			if ("money".equals(cond)) {
				applys.setMoney(Double.parseDouble(name));
				applysList = this.applysDAO.getApplysByLike(applys);
			}
			if ("addtime".equals(cond)) {
				applys.setAddtime(name);
				applysList = this.applysDAO.getApplysByLike(applys);
			}
			if ("status".equals(cond)) {
				applys.setStatus(name);
				applysList = this.applysDAO.getApplysByLike(applys);
			}
		}
		map.put("applysList", applysList);
		return "admin/queryapplys";
	}

	// 按主键查询数据
	@RequestMapping("getApplysById.action")
	public String getApplysById(String id, Map<String, Object> map) {
		Applys applys = this.applysDAO.getApplysById(id);
		map.put("applys", applys);
		return "admin/editapplys";
	}
}
