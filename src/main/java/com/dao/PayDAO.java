package com.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.entity.Pay;

public class PayDAO {
	// sqlSessionTemplate 注入 在applicationContext.xml里定义
	private SqlSessionTemplate sqlSessionTemplate;

	// 插入数据 调用entity包pay.xml里的insertPay配置
	public void insertPay(Pay pay) {
		this.sqlSessionTemplate.insert("insertPay", pay);
	}

	// 更新数据 调用entity包pay.xml里的updatePay配置
	public void updatePay(Pay pay) {
		this.sqlSessionTemplate.update("updatePay", pay);
	}

	// 删除数据 调用entity包pay.xml里的deletePay配置
	public void deletePay(String payid) {
		this.sqlSessionTemplate.delete("deletePay", payid);
	}

	// 查询全部数据 调用entity包pay.xml里的getAllPay配置
	public List<Pay> getAllPay() {
		return this.sqlSessionTemplate.selectList("getAllPay");
	}

	// 按照Admin类里面的值精确查询 调用entity包pay.xml里的getPayByCond配置
	public List<Pay> getPayByCond(Pay pay) {
		return this.sqlSessionTemplate.selectList("getPayByCond", pay);
	}

	// 按照Pay类里面的值模糊查询 调用entity包pay.xml里的getPayByLike配置
	public List<Pay> getPayByLike(Pay pay) {
		return this.sqlSessionTemplate.selectList("getPayByLike", pay);
	}

	// 按主键查询表返回单一的Pay实例 调用entity包pay.xml里的getPayById配置
	public Pay getPayById(String payid) {
		return this.sqlSessionTemplate.selectOne("getPayById", payid);
	}

	// IOC注入所需要的getter和setter
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

}
