package com.mercury.dao;

import java.util.List;

import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.Stock;
import com.mercury.beans.User;

public interface OwnInfoDao {
	public void save(OwnershipInfo ois);
	public void update(OwnershipInfo ois);
	public void delete(OwnershipInfo ois);
	public void saveOrUpdate(OwnershipInfo ois);
	public List<OwnershipInfo> findOwnByUser(User user);
	public List<OwnershipInfo> findByStock(Stock stock);
	public List<OwnershipInfo> findByOwn(User user, Stock stock);
	public List<OwnershipInfo> queryAll();
}
