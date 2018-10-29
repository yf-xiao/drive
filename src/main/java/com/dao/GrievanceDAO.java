package com.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.entity.Grievance;

public class GrievanceDAO {
	// sqlSessionTemplate 注入 在applicationContext.xml里定义
	private SqlSessionTemplate sqlSessionTemplate;

	// 插入数据 调用entity包grievance.xml里的insertGrievance配置
	public void insertGrievance(Grievance grievance) {
		this.sqlSessionTemplate.insert("insertGrievance", grievance);
	}

	// 更新数据 调用entity包grievance.xml里的updateGrievance配置
	public void updateGrievance(Grievance grievance) {
		this.sqlSessionTemplate.update("updateGrievance", grievance);
	}

	// 删除数据 调用entity包grievance.xml里的deleteGrievance配置
	public void deleteGrievance(String grievanceid) {
		this.sqlSessionTemplate.delete("deleteGrievance", grievanceid);
	}

	// 查询全部数据 调用entity包grievance.xml里的getAllGrievance配置
	public List<Grievance> getAllGrievance() {
		return this.sqlSessionTemplate.selectList("getAllGrievance");
	}

	// 按照Admin类里面的值精确查询 调用entity包grievance.xml里的getGrievanceByCond配置
	public List<Grievance> getGrievanceByCond(Grievance grievance) {
		return this.sqlSessionTemplate.selectList("getGrievanceByCond", grievance);
	}

	// 按照Grievance类里面的值模糊查询 调用entity包grievance.xml里的getGrievanceByLike配置
	public List<Grievance> getGrievanceByLike(Grievance grievance) {
		return this.sqlSessionTemplate.selectList("getGrievanceByLike", grievance);
	}

	// 按主键查询表返回单一的Grievance实例 调用entity包grievance.xml里的getGrievanceById配置
	public Grievance getGrievanceById(String grievanceid) {
		return this.sqlSessionTemplate.selectOne("getGrievanceById", grievanceid);
	}

	public Grievance getGrievanceByOrdercode(String ordercode) {
		return this.sqlSessionTemplate.selectOne("getGrievanceByOrdercode", ordercode);
	}
	
	// IOC注入所需要的getter和setter
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

}
