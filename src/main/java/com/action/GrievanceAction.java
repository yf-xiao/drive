package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.GrievanceDAO;
import com.entity.Grievance;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/grievance")
public class GrievanceAction extends BaseAction {
	@Autowired
	private GrievanceDAO grievanceDAO;

	// 准备添加数据
	@RequestMapping("createGrievance.action")
	public String createGrievance(Map<String, Object> map) {
		return "admin/addgrievance";
	}

	// 添加数据
	@RequestMapping("addGrievance.action")
	public String addGrievance(Grievance grievance) {
		grievance.setGrievanceid(VeDate.getStringDatex());
		this.grievanceDAO.insertGrievance(grievance);
		return "redirect:/grievance/createGrievance.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteGrievance.action")
	public String deleteGrievance(String id) {
		this.grievanceDAO.deleteGrievance(id);
		return "redirect:/grievance/getAllGrievance.action";
	}
	// 更新数据
	@RequestMapping("updateGrievance.action")
	public String updateGrievance(Grievance grievance) {
		this.grievanceDAO.updateGrievance(grievance);
		return "redirect:/grievance/getAllGrievance.action";
	}

	// 显示全部数据
	@RequestMapping("getAllGrievance.action")
	public String getAllGrievance(String number, Map<String, Object> map) {
		List<Grievance> grievanceList = new ArrayList<Grievance>();
		List<Grievance> tempList = new ArrayList<Grievance>();
		tempList = this.grievanceDAO.getAllGrievance();
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
			Grievance grievance = tempList.get(i);
			grievanceList.add(grievance);
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
			buffer.append("<a href=\"grievance/getAllGrievance.action?number=0\">首页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(number) + 1) == 1) {
			buffer.append("上一页");
		} else {
			buffer.append("<a href=\"grievance/getAllGrievance.action?number=" + (Integer.parseInt(number) - 1)
					+ "\">上一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("下一页");
		} else {
			buffer.append("<a href=\"grievance/getAllGrievance.action?number=" + (Integer.parseInt(number) + 1)
					+ "\">下一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("尾页");
		} else {
			buffer.append("<a href=\"grievance/getAllGrievance.action?number=" + (maxPage - 1) + "\">尾页</a>");
		}
		html = buffer.toString();
		map.put("html", html);
		map.put("grievanceList", grievanceList);
		return "admin/listgrievance";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryGrievanceByCond.action")
	public String queryGrievanceByCond(String cond, String name, Map<String, Object> map) {
		List<Grievance> grievanceList = new ArrayList<Grievance>();
		Grievance grievance = new Grievance();
		if (cond != null) {
			if ("usersid".equals(cond)) {
				grievance.setUsersid(name);
				grievanceList = this.grievanceDAO.getGrievanceByLike(grievance);
			}
			if ("ordercode".equals(cond)) {
				grievance.setOrdercode(name);
				grievanceList = this.grievanceDAO.getGrievanceByLike(grievance);
			}
			if ("contents".equals(cond)) {
				grievance.setContents(name);
				grievanceList = this.grievanceDAO.getGrievanceByLike(grievance);
			}
			if ("addtime".equals(cond)) {
				grievance.setAddtime(name);
				grievanceList = this.grievanceDAO.getGrievanceByLike(grievance);
			}
		}
		map.put("grievanceList", grievanceList);
		return "admin/querygrievance";
	}

	// 按主键查询数据
	@RequestMapping("getGrievanceById.action")
	public String getGrievanceById(String id, Map<String, Object> map) {
		Grievance grievance = this.grievanceDAO.getGrievanceById(id);
		map.put("grievance", grievance);
		return "admin/editgrievance";
	}
	// 按ordercode查询数据
	@RequestMapping("getGrievanceByOrdercode.action")
	public String getGrievanceByOrdercode(String ordercode, Map<String, Object> map) {
		Grievance grievance = this.grievanceDAO.getGrievanceByOrdercode(ordercode);
		map.put("grievance", grievance);
		return "users/orderGrievance";
	}
	
	// 通过主键删除数据
	@RequestMapping("deleteGrievanceForUser.action")
	public String deleteGrievanceForUser(String id) {
		this.grievanceDAO.deleteGrievance(id);
		return "redirect:/index/myGrievance.action";
	}

}
