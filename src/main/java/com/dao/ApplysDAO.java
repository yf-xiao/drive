package com.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.entity.Applys;

public class ApplysDAO {
	// sqlSessionTemplate 注入 在applicationContext.xml里定义
	private SqlSessionTemplate sqlSessionTemplate;

	// 插入数据 调用entity包applys.xml里的insertApplys配置
	public void insertApplys(Applys applys) {
		this.sqlSessionTemplate.insert("insertApplys", applys);
	}

	// 更新数据 调用entity包applys.xml里的updateApplys配置
	public void updateApplys(Applys applys) {
		this.sqlSessionTemplate.update("updateApplys", applys);
	}

	// 删除数据 调用entity包applys.xml里的deleteApplys配置
	public void deleteApplys(String applysid) {
		this.sqlSessionTemplate.delete("deleteApplys", applysid);
	}

	// 查询全部数据 调用entity包applys.xml里的getAllApplys配置
	public List<Applys> getAllApplys() {
		return this.sqlSessionTemplate.selectList("getAllApplys");
	}

	// 按照Admin类里面的值精确查询 调用entity包applys.xml里的getApplysByCond配置
	public List<Applys> getApplysByCond(Applys applys) {
		return this.sqlSessionTemplate.selectList("getApplysByCond", applys);
	}

	// 按照Applys类里面的值模糊查询 调用entity包applys.xml里的getApplysByLike配置
	public List<Applys> getApplysByLike(Applys applys) {
		return this.sqlSessionTemplate.selectList("getApplysByLike", applys);
	}

	// 按主键查询表返回单一的Applys实例 调用entity包applys.xml里的getApplysById配置
	public Applys getApplysById(String applysid) {
		return this.sqlSessionTemplate.selectOne("getApplysById", applysid);
	}

	// IOC注入所需要的getter和setter
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

}
