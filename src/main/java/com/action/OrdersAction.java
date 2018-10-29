package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.DriversDAO;
import com.dao.OrdersDAO;
import com.dao.UsersDAO;
import com.entity.Drivers;
import com.entity.Orders;
import com.entity.Users;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/orders")
public class OrdersAction extends BaseAction {
	@Autowired
	private OrdersDAO ordersDAO;
	@Autowired
	private UsersDAO usersDAO;
	@Autowired
	private DriversDAO driversDAO;

	// 准备添加数据
	@RequestMapping("createOrders.action")
	public String createOrders(Map<String, Object> map) {
		List<Users> usersList = this.usersDAO.getAllUsers();
		map.put("usersList", usersList);
		return "admin/addorders";
	}

	// 添加数据
	@RequestMapping("addOrders.action")
	public String addOrders(Orders orders) {
		orders.setOrdersid(VeDate.getStringDatex());
		this.ordersDAO.insertOrders(orders);
		return "redirect:/orders/createOrders.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteOrders.action")
	public String deleteOrders(String id) {
		this.ordersDAO.deleteOrders(id);
		return "redirect:/orders/getAllOrders.action";
	}

	// 更新数据
	@RequestMapping("updateOrders.action")
	public String updateOrders(Orders orders) {
		this.ordersDAO.updateOrders(orders);
		return "redirect:/orders/getAllOrders.action";
	}

	// 显示全部数据
	@RequestMapping("getAllOrders.action")
	public String getAllOrders(String number, Map<String, Object> map) {
		List<Orders> ordersList = new ArrayList<Orders>();
		List<Orders> tempList = new ArrayList<Orders>();
		tempList = this.ordersDAO.getAllOrders();
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
			Orders orders = tempList.get(i);
			ordersList.add(orders);
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
			buffer.append("<a href=\"orders/getAllOrders.action?number=0\">首页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(number) + 1) == 1) {
			buffer.append("上一页");
		} else {
			buffer.append(
					"<a href=\"orders/getAllOrders.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("下一页");
		} else {
			buffer.append(
					"<a href=\"orders/getAllOrders.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (maxPage <= (Integer.parseInt(number) + 1)) {
			buffer.append("尾页");
		} else {
			buffer.append("<a href=\"orders/getAllOrders.action?number=" + (maxPage - 1) + "\">尾页</a>");
		}
		html = buffer.toString();
		map.put("html", html);
		map.put("ordersList", ordersList);
		return "admin/listorders";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryOrdersByCond.action")
	public String queryOrdersByCond(String cond, String name, Map<String, Object> map) {
		List<Orders> ordersList = new ArrayList<Orders>();
		Orders orders = new Orders();
		if (cond != null) {
			if ("ordercode".equals(cond)) {
				orders.setOrdercode(name);
				ordersList = this.ordersDAO.getOrdersByLike(orders);
			}
			if ("usersid".equals(cond)) {
				orders.setUsersid(name);
				ordersList = this.ordersDAO.getOrdersByLike(orders);
			}
			if ("thestart".equals(cond)) {
				orders.setThestart(name);
				ordersList = this.ordersDAO.getOrdersByLike(orders);
			}
			if ("theend".equals(cond)) {
				orders.setTheend(name);
				ordersList = this.ordersDAO.getOrdersByLike(orders);
			}
			if ("addtime".equals(cond)) {
				orders.setAddtime(name);
				ordersList = this.ordersDAO.getOrdersByLike(orders);
			}
			if ("money".equals(cond)) {
				orders.setMoney((Double.parseDouble(name)));
				ordersList = this.ordersDAO.getOrdersByLike(orders);
			}
			if ("status".equals(cond)) {
				orders.setStatus(name);
				ordersList = this.ordersDAO.getOrdersByLike(orders);
			}
		}
		map.put("ordersList", ordersList);
		return "admin/queryorders";
	}

	// 按主键查询数据
	@RequestMapping("getOrdersById.action")
	public String getOrdersById(String id, Map<String, Object> map) {
		Orders orders = this.ordersDAO.getOrdersById(id);
		map.put("orders", orders);
		List<Users> usersList = this.usersDAO.getAllUsers();
		map.put("usersList", usersList);
		return "admin/editorders";
	}
	
	// 按ordercode查询数据
	@RequestMapping("getOrdersByCode.action")
	public String getOrdersByCode(String code, Map<String, Object> map) {
		Orders orders = this.ordersDAO.getOrdersByCode(code);
		map.put("orders", orders);
		int count = 0;
		Drivers drivers = driversDAO.getDriversById(orders.getDriversid());
		List<Orders> list = this.ordersDAO.getOrdersByDriversId(orders.getDriversid());
		
		if(list.size()!=0){
			for(int i=0;i<list.size();i++){
				if(list.get(i).getStatus().equals("未接单") || list.get(i).getStatus().equals("服务中") || list.get(i).getStatus().equals("付款中") || list.get(i).getStatus().equals("已接单")){
				}else{
					count++;
				}	
			}
			map.put("count", count);
		}
		if(drivers!=null){
			map.put("drivers", drivers);
		}
		return "users/orderDetail";
	}
}
