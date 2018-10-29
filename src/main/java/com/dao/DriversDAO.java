package com.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.entity.Drivers;

public class DriversDAO {
	// sqlSessionTemplate 注入 在applicationContext.xml里定义
	private SqlSessionTemplate sqlSessionTemplate;

	// 插入数据 调用entity包drivers.xml里的insertDrivers配置
	public void insertDrivers(Drivers drivers) {
		this.sqlSessionTemplate.insert("insertDrivers", drivers);
	}

	// 更新数据 调用entity包drivers.xml里的updateDrivers配置
	public void updateDrivers(Drivers drivers) {
		this.sqlSessionTemplate.update("updateDrivers", drivers);
	}

	// 删除数据 调用entity包drivers.xml里的deleteDrivers配置
	public void deleteDrivers(String driversid) {
		this.sqlSessionTemplate.delete("deleteDrivers", driversid);
	}

	// 查询全部数据 调用entity包drivers.xml里的getAllDrivers配置
	public List<Drivers> getAllDrivers() {
		return this.sqlSessionTemplate.selectList("getAllDrivers");
	}

	// 查询全部未锁定司机,调用entity包drivers.xml里的getAllDrivers配置
	public List<Drivers> getAllDriversNoS() {
		return this.sqlSessionTemplate.selectList("getAllDriversNoS");
	}
		
	public List<Drivers> getDriversByRecommend() {
		return this.sqlSessionTemplate.selectList("getDriversByRecommend");
	}

	public List<Drivers> getDriversByFront() {
		return this.sqlSessionTemplate.selectList("getDriversByFront");
	}

	// 按照Admin类里面的值精确查询 调用entity包drivers.xml里的getDriversByCond配置
	public List<Drivers> getDriversByCond(Drivers drivers) {
		return this.sqlSessionTemplate.selectList("getDriversByCond", drivers);
	}

	// 按照Drivers类里面的值模糊查询 调用entity包drivers.xml里的getDriversByLike配置
	public List<Drivers> getDriversByLike(Drivers drivers) {
		return this.sqlSessionTemplate.selectList("getDriversByLike", drivers);
	}

	// 按主键查询表返回单一的Drivers实例 调用entity包drivers.xml里的getDriversById配置
	public Drivers getDriversById(String driversid) {
		return this.sqlSessionTemplate.selectOne("getDriversById", driversid);
	}
	
	// IOC注入所需要的getter和setter
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

}
