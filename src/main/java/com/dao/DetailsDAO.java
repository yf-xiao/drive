package com.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.entity.Details;

public class DetailsDAO {
	// sqlSessionTemplate 注入 在applicationContext.xml里定义
	private SqlSessionTemplate sqlSessionTemplate;

	// 插入数据 调用entity包details.xml里的insertDetails配置
	public void insertDetails(Details details) {
		this.sqlSessionTemplate.insert("insertDetails", details);
	}

	// 更新数据 调用entity包details.xml里的updateDetails配置
	public void updateDetails(Details details) {
		this.sqlSessionTemplate.update("updateDetails", details);
	}

	// 删除数据 调用entity包details.xml里的deleteDetails配置
	public void deleteDetails(String detailsid) {
		this.sqlSessionTemplate.delete("deleteDetails", detailsid);
	}

	// 查询全部数据 调用entity包details.xml里的getAllDetails配置
	public List<Details> getAllDetails() {
		return this.sqlSessionTemplate.selectList("getAllDetails");
	}

	// 按照Admin类里面的值精确查询 调用entity包details.xml里的getDetailsByCond配置
	public List<Details> getDetailsByCond(Details details) {
		return this.sqlSessionTemplate.selectList("getDetailsByCond", details);
	}

	// 按照Details类里面的值模糊查询 调用entity包details.xml里的getDetailsByLike配置
	public List<Details> getDetailsByLike(Details details) {
		return this.sqlSessionTemplate.selectList("getDetailsByLike", details);
	}

	// 按主键查询表返回单一的Details实例 调用entity包details.xml里的getDetailsById配置
	public Details getDetailsById(String detailsid) {
		return this.sqlSessionTemplate.selectOne("getDetailsById", detailsid);
	}

	// IOC注入所需要的getter和setter
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

}
