package com.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.entity.Orders;

public class OrdersDAO {
	// sqlSessionTemplate 注入 在applicationContext.xml里定义
	private SqlSessionTemplate sqlSessionTemplate;

	// 插入数据 调用entity包orders.xml里的insertOrders配置
	public void insertOrders(Orders orders) {
		this.sqlSessionTemplate.insert("insertOrders", orders);
	}

	// 更新数据 调用entity包orders.xml里的updateOrders配置
	public void updateOrders(Orders orders) {
		this.sqlSessionTemplate.update("updateOrders", orders);
	}

	// 删除数据 调用entity包orders.xml里的deleteOrders配置
	public void deleteOrders(String ordersid) {
		this.sqlSessionTemplate.delete("deleteOrders", ordersid);
	}

	// 查询全部数据 调用entity包orders.xml里的getAllOrders配置
	public List<Orders> getAllOrders() {
		return this.sqlSessionTemplate.selectList("getAllOrders");
	}

	public List<Orders> getOrdersByDriver(String ordercode) {
		return this.sqlSessionTemplate.selectList("getOrdersByDriver", ordercode);
	}

	// 按照Admin类里面的值精确查询 调用entity包orders.xml里的getOrdersByCond配置
	public List<Orders> getOrdersByCond(Orders orders) {
		return this.sqlSessionTemplate.selectList("getOrdersByCond", orders);
	}

	// 按照Orders类里面的值模糊查询 调用entity包orders.xml里的getOrdersByLike配置
	public List<Orders> getOrdersByLike(Orders orders) {
		return this.sqlSessionTemplate.selectList("getOrdersByLike", orders);
	}

	// 按主键查询表返回单一的Orders实例 调用entity包orders.xml里的getOrdersById配置
	public Orders getOrdersById(String ordersid) {
		return this.sqlSessionTemplate.selectOne("getOrdersById", ordersid);
	}

	public Orders getOrdersByCode(String orderscode) {
		return this.sqlSessionTemplate.selectOne("getOrdersByCode", orderscode);
	}
	
	public List<Orders> getOrdersByDriversId(String driversid) {
		return this.sqlSessionTemplate.selectList("getOrdersByDriversId", driversid);
	}

	// IOC注入所需要的getter和setter
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

}
