package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.DetailsDAO;
import com.dao.DriversDAO;
import com.entity.Details;
import com.entity.Drivers;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/details")
public class DetailsAction extends BaseAction {
	@Autowired
	private DetailsDAO detailsDAO;
	@Autowired
	private DriversDAO driversDAO;

	// 准备添加数据
	@RequestMapping("createDetails.action")
	public String createDetails(Map<String, Object> map) {
		List<Drivers> driversList = this.driversDAO.getAllDrivers();
		map.put("driversList", driversList);
		return "admin/adddetails";
	}

	// 添加数据
	@RequestMapping("addDetails.action")
	public String addDetails(Details details) {
		details.setDetailsid(VeDate.getStringDatex());
		this.detailsDAO.insertDetails(details);
		return "redirect:/details/createDetails.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteDetails.action")
	public String deleteDetails(String id) {
		this.detailsDAO.deleteDetails(id);
		return "redirect:/details/getAllDetails.action";
	}

	// 更新数据
	@RequestMapping("updateDetails.action")
	public String updateDetails(Details details) {
		this.detailsDAO.updateDetails(details);
		return "redirect:/details/getAllDetails.action";
	}

	// 显示全部数据
	@RequestMapping("getAllDetails.action")
	public String getAllDetails(String number, Map<String, Object> map) {
		List<Details> detailsList = new ArrayList<Details>();
		List<Details> tempList = new ArrayList<Details>();
		tempList = this.detailsDAO.getAllDetails();
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
			Details details = tempList.get(i);
			detailsList.add(details);
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
			buffer.append("<a href=\"details/getAllDetails.action?number=0\">首页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(number) + 1) == 1) {
			buffer.append("上一页");
		} else {
			buffer.append(
					"<a href=\"details/getAllDetails.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("下一页");
		} else {
			buffer.append(
					"<a href=\"details/getAllDetails.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("尾页");
		} else {
			buffer.append("<a href=\"details/getAllDetails.action?number=" + (maxPage - 1) + "\">尾页</a>");
		}
		html = buffer.toString();
		map.put("html", html);
		map.put("detailsList", detailsList);
		return "admin/listdetails";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryDetailsByCond.action")
	public String queryDetailsByCond(String cond, String name, Map<String, Object> map) {
		List<Details> detailsList = new ArrayList<Details>();
		Details details = new Details();
		if (cond != null) {
			if ("ordercode".equals(cond)) {
				details.setOrdercode(name);
				detailsList = this.detailsDAO.getDetailsByLike(details);
			}
			if ("driversid".equals(cond)) {
				details.setDriversid(name);
				detailsList = this.detailsDAO.getDetailsByLike(details);
			}
			if ("status".equals(cond)) {
				details.setStatus(name);
				detailsList = this.detailsDAO.getDetailsByLike(details);
			}
			if ("addtime".equals(cond)) {
				details.setAddtime(name);
				detailsList = this.detailsDAO.getDetailsByLike(details);
			}
		}
		map.put("detailsList", detailsList);
		return "admin/querydetails";
	}

	// 按主键查询数据
	@RequestMapping("getDetailsById.action")
	public String getDetailsById(String id, Map<String, Object> map) {
		Details details = this.detailsDAO.getDetailsById(id);
		map.put("details", details);
		List<Drivers> driversList = this.driversDAO.getAllDrivers();
		map.put("driversList", driversList);
		return "admin/editdetails";
	}

	public DetailsDAO getDetailsDAO() {
		return detailsDAO;
	}
}
