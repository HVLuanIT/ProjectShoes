package vn.dev.ndshoes.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import vn.dev.ndshoes.dto.PsConstant;
import vn.dev.ndshoes.dto.SearchModel;
import vn.dev.ndshoes.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> implements PsConstant{
	@Override
	public Class<SaleOrder> clazz(){
		return SaleOrder.class;
	}
	@Transactional
	public SaleOrder saveOrder(SaleOrder saleOrder) {
		return super.saveOrUpdate(saleOrder);
	}
	@Transactional
	public void inactiveSaleOrder(SaleOrder saleOrder) {
		super.saveOrUpdate(saleOrder);
	}
	@Transactional
	public void deleteOrderById(int id) {
		super.deleteById(id);
	}
	
	public List<SaleOrder> findAllActive(){
		return super.executeNativeSql("Select * From tbl_sale_order WHERE status = 1");
	}
	public List<SaleOrder> getOrdersByUserId(int userId) {
		return super.executeNativeSql("SELECT * FROM tbl_sale_order WHERE user_id = " + userId);
	}
	public List<SaleOrder> searchOrder(SearchModel orderSearch){
		String sql = "SELECT * from tbl_sale_order p WHERE 1=1";
		
		//Tim kiem voi tieu chi status
		if(orderSearch.getStatus() != 2) {
			sql += " AND p.status = " + orderSearch.getStatus();
		}
		
		//Tim kiem voi keyword
		if (!StringUtils.isEmpty(orderSearch.getKeyword())) {
			String keyword = orderSearch.getKeyword().toLowerCase();
			
			sql += " AND (LOWER(p.customer_name) like '%" + keyword + "%'" +
					" OR LOWER(p.customer_mobile) like '%" + keyword + "%')";
		}
		// Tìm kiếm theo ngày tháng
		if(!StringUtils.isEmpty(orderSearch.getBeginDate() )&& !StringUtils.isEmpty(orderSearch.getEndDate())) {
			String beginDate = orderSearch.getBeginDate();
			String endDate = orderSearch.getEndDate();
			sql += " AND p.create_date BETWEEN '" + beginDate + "'AND '" + endDate + "'";
		}
		return super.executeNativeSql(sql);
	}
	 // Hàm trả về list số lượng các sản phẩm đã bán trong năm hiện tại theo tháng
	public List<BigDecimal> getMoneyByMonths(int year) {
	    List<BigDecimal> dashboardRevenue = new ArrayList<>();

	    for (int i = 1; i <= 12; i++) {
	        BigDecimal revenue = (BigDecimal) entityManager
	            .createNativeQuery("SELECT COALESCE(SUM(total), 0) FROM tbl_sale_order WHERE status = 1 AND YEAR(create_date) = :year AND MONTH(create_date) = :month")
	            .setParameter("year", year)
	            .setParameter("month", i)
	            .getSingleResult();
	        dashboardRevenue.add(revenue);
	    }
	    return dashboardRevenue;
	}
}
