package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.PayDAO;
import com.dao.UsersDAO;
import com.entity.Pay;
import com.entity.Users;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/pay")
public class PayAction extends BaseAction {
	@Autowired
	private PayDAO payDAO;
	@Autowired
	private UsersDAO usersDAO;

	// 准备添加数据
	@RequestMapping("createPay.action")
	public String createPay(Map<String, Object> map) {
		List<Users> usersList = this.usersDAO.getAllUsers();
		map.put("usersList", usersList);
		return "admin/addpay";
	}

	// 添加数据
	@RequestMapping("addPay.action")
	public String addPay(Pay pay) {
		pay.setPayid(VeDate.getStringDatex());
		this.payDAO.insertPay(pay);
		return "redirect:/pay/createPay.action";
	}

	// 通过主键删除数据
	@RequestMapping("deletePay.action")
	public String deletePay(String id) {
		this.payDAO.deletePay(id);
		return "redirect:/pay/getAllPay.action";
	}

	// 更新数据
	@RequestMapping("updatePay.action")
	public String updatePay(Pay pay) {
		this.payDAO.updatePay(pay);
		return "redirect:/pay/getAllPay.action";
	}

	// 显示全部数据
	@RequestMapping("getAllPay.action")
	public String getAllPay(String number, Map<String, Object> map) {
		List<Pay> payList = new ArrayList<Pay>();
		List<Pay> tempList = new ArrayList<Pay>();
		tempList = this.payDAO.getAllPay();
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
			Pay pay = tempList.get(i);
			payList.add(pay);
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
			buffer.append("<a href=\"pay/getAllPay.action?number=0\">首页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(number) + 1) == 1) {
			buffer.append("上一页");
		} else {
			buffer.append("<a href=\"pay/getAllPay.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("下一页");
		} else {
			buffer.append("<a href=\"pay/getAllPay.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("尾页");
		} else {
			buffer.append("<a href=\"pay/getAllPay.action?number=" + (maxPage - 1) + "\">尾页</a>");
		}
		html = buffer.toString();
		map.put("html", html);
		map.put("payList", payList);
		return "admin/listpay";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryPayByCond.action")
	public String queryPayByCond(String cond, String name, Map<String, Object> map) {
		List<Pay> payList = new ArrayList<Pay>();
		Pay pay = new Pay();
		if (cond != null) {
			if ("ordercode".equals(cond)) {
				pay.setOrdercode(name);
				payList = this.payDAO.getPayByLike(pay);
			}
			if ("usersid".equals(cond)) {
				pay.setUsersid(name);
				payList = this.payDAO.getPayByLike(pay);
			}
			if ("money".equals(cond)) {
				pay.setMoney((Double.parseDouble(name)));
				payList = this.payDAO.getPayByLike(pay);
			}
			if ("cate".equals(cond)) {
				pay.setCate(name);
				payList = this.payDAO.getPayByLike(pay);
			}
			if ("addtime".equals(cond)) {
				pay.setAddtime(name);
				payList = this.payDAO.getPayByLike(pay);
			}
		}
		map.put("payList", payList);
		return "admin/querypay";
	}

	// 按主键查询数据
	@RequestMapping("getPayById.action")
	public String getPayById(String id, Map<String, Object> map) {
		Pay pay = this.payDAO.getPayById(id);
		map.put("pay", pay);
		List<Users> usersList = this.usersDAO.getAllUsers();
		map.put("usersList", usersList);
		return "admin/editpay";
	}
}
