package com.voidmain.dao;

import java.util.List;

import com.voidmain.pojo.Wharehouse;
import com.voidmain.pojo.Product;
import com.voidmain.pojo.BuyRequest;
import com.voidmain.pojo.User;
import com.voidmain.pojo.Block;

public class HibernateDAO {

	public static boolean isValidWharehouse(String username,String password)
	{
		Wharehouse wharehouse=getWharehouseById(username);

		if(wharehouse!=null && wharehouse.getPassword().equals(password) && wharehouse.getStatus().equals("yes"))
		{
			return true;
		}

		return false;
	}
	
	public static boolean isValidUser(String username,String password)
	{
		User user=getUserById(username);

		if(user!=null && user.getPassword().equals(password))
		{
			return true;
		}

		return false;
	}

	//================================================================================

	public static User getUserById(String id)
	{
		return (User)HibernateTemplate.getObject(User.class,id);
	}

	public static int deleteUser(String id)
	{
		return HibernateTemplate.deleteObject(User.class,id);
	}

	public static List<User> getUsers()
	{
		List<User> users=(List)HibernateTemplate.getObjectListByQuery("From User");

		return users;
	}

	//=========================================================================

	public static Wharehouse getWharehouseById(String id)
	{
		return (Wharehouse)HibernateTemplate.getObject(Wharehouse.class,id);
	}

	public static int deleteWharehouse(String id)
	{
		return HibernateTemplate.deleteObject(Wharehouse.class,id);
	}

	public static List<Wharehouse> getWharehouses()
	{
		List<Wharehouse> wharehouses=(List)HibernateTemplate.getObjectListByQuery("From Wharehouse");

		return wharehouses;
	}

	//=========================================================================

	public static Product getProductById(int id)
	{
		return (Product)HibernateTemplate.getObject(Product.class,id);
	}

	public static int deleteProduct(int id)
	{
		return HibernateTemplate.deleteObject(Product.class,id);
	}

	public static List<Product> getProducts()
	{
		List<Product> products=(List)HibernateTemplate.getObjectListByQuery("From Product");

		return products;
	}

	//=========================================================================

	public static BuyRequest getBuyRequestById(int id)
	{
		return (BuyRequest)HibernateTemplate.getObject(BuyRequest.class,id);
	}

	public static int deleteBuyRequest(int id)
	{
		return HibernateTemplate.deleteObject(BuyRequest.class,id);
	}

	public static List<BuyRequest> getBuyRequests()
	{
		List<BuyRequest> buyRequests=(List)HibernateTemplate.getObjectListByQuery("From BuyRequest");

		return buyRequests;
	}

	//=========================================================================

	public static Block getBlockById(int id)
	{
		return (Block)HibernateTemplate.getObject(Block.class,id);
	}

	public static int deleteBlock(int id)
	{
		return HibernateTemplate.deleteObject(Block.class,id);
	}

	public static List<Block> getBlocks()
	{
		List<Block> blocks=(List)HibernateTemplate.getObjectListByQuery("From Block");

		return blocks;
	}
}
