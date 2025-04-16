package vn.dev.ndshoes.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.dev.ndshoes.model.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct>{
	@Override
	public Class<SaleOrderProduct> clazz(){
		return SaleOrderProduct.class;
	}
	//Lay san pham trong don hang
	public List<SaleOrderProduct> findAllProductInOrder(int saleOrderId) {
		String sql = "SELECT * FROM tbl_sale_order_product WHERE sale_order_id = '" + saleOrderId + "'";
		return super.executeNativeSql(sql);
	}
	public List<SaleOrderProduct> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_sale_order_product WHERE status = 1");
	}
	public List<SaleOrderProduct> getProductsByOrderId(int orderId) {
		return super.executeNativeSql("SELECT * FROM tbl_sale_order_product WHERE sale_order_id = " + orderId);
	}
}
