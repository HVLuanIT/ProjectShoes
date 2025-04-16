package vn.dev.ndshoes.controller.frontend;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.dto.Cart;
import vn.dev.ndshoes.dto.Customer;
import vn.dev.ndshoes.dto.ProductCart;
import vn.dev.ndshoes.model.Product;
import vn.dev.ndshoes.model.SaleOrder;
import vn.dev.ndshoes.model.SaleOrderProduct;
import vn.dev.ndshoes.service.ProductService;
import vn.dev.ndshoes.service.SaleOrderService;


@Controller
public class CheckOutController {
	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderService saleOrderService;
	// Hiện thị view khách hàng và thanh toán
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkOut(final Model model, final HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart != null) {
			model.addAttribute("totalCartPrice", cart.totalCartPrice());
		}
		return "frontend/checkout";
	}

	// Chức năng Đặt hàng sản phẩm trong giỏ hàng
	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	ResponseEntity<Map<String, Object>> placeOrder(@RequestBody Customer customer, final HttpServletRequest request)
			throws IOException {

		Map<String, Object> jsonResult = new HashMap<String, Object>(); // Gửi lại view
		jsonResult.put("code", "Thông báo");

		Boolean isCheck = true;
		// Kiểm tra thông tin customer bắt buộc
		if (StringUtils.isEmpty(customer.getTxtName())) {
			isCheck = false;
			jsonResult.put("message", "Bạn chưa nhập họ tên");
		} else if (StringUtils.isEmpty(customer.getTxtMobile())) {
			isCheck = false;
			jsonResult.put("message", "Bạn chưa nhập Số điện thoại");
		} else if (StringUtils.isEmpty(customer.getTxtEmail())) {
			isCheck = false;
			jsonResult.put("message", "Bạn chưa nhập Email");
		} else if (StringUtils.isEmpty(customer.getTxtAddress())) {
			isCheck = false;
			jsonResult.put("message", "Bạn chưa nhập địa chỉ");
		} else {
			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart == null || cart.totalCartProduct().equals(BigInteger.ZERO)) {
				jsonResult.put("message", "Bạn chưa có giỏ hàng");
			} else {
				// Lưu các sản phẩm trong giỏ hàng vào DB: tbl_sale_order_product
				SaleOrder saleOrder = new SaleOrder();
				for (ProductCart productCart : cart.getProductCarts()) {
					SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
					// Lấy product trong db
					Product dbProduct = productService.getById(productCart.getProductId());
					// Lấy số lượng sản phẩm trong giỏ hàng
					BigInteger cartQuantity = productCart.getQuantity();
					// Lấy số lượng sản phẩm trong kho
					BigInteger currentQuantity = BigInteger.valueOf(dbProduct.getProductQuantity());
					// Tính toán giá trị mới cho productQuantity
					BigInteger updatedQuantity = currentQuantity.subtract(cartQuantity);
					// Cập nhật giá trị mới cho productQuantity
					dbProduct.setProductQuantity(updatedQuantity.intValue());
					saleOrderProduct.setProduct(dbProduct);
					saleOrderProduct.setQuantity(productCart.getQuantity().intValue());
					saleOrderProduct.setSize(productCart.getSize()); // luu size
					saleOrderProduct.setCreateDate(new Date());
					saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);

				}
				// Luu đơn hàng vào tbl_sale_order
				Calendar calendar = Calendar.getInstance();
				String code = customer.getTxtMobile() + calendar.get(Calendar.YEAR) + calendar.get(calendar.MONTH)
						+ calendar.get(calendar.DAY_OF_MONTH);

				saleOrder.setCode(code);

//						// Lấy thông tin người dùng hiện tại từ Spring Security
//						Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//						if (authentication != null && authentication.getPrincipal() instanceof User) {
//							User user = (User) authentication.getPrincipal();
//							saleOrder.setUser(user);
//							saleOrder.setUserCreateSaleOrder(user);
//						} else {
//							User user = new User();
//							user.setId(1);
//							saleOrder.setUser(user);
//						}

				saleOrder.setStatus(false); // trang thai mua hang
				saleOrder.setCreateDate(new Date()); // ngay mua

				saleOrder.setCustomerName(customer.getTxtName()); // luu ten khach hang
				saleOrder.setCustomerMobile(customer.getTxtMobile()); // luu so dien thoai
				saleOrder.setCustomerEmail(customer.getTxtEmail()); // luu email
				saleOrder.setCustomerAddress(customer.getTxtAddress()); // luu dia chi
				saleOrder.setTotal(cart.totalCartPrice()); // gia phai tra

				// Luu vao DB tb_sale_order
				saleOrderService.saveOrder(saleOrder);
				// Xóa giỏ hàng sau khi đã đặt hàng
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
		}
		jsonResult.put("isCheck", isCheck);
		// Tra ve du lieu cho view
		return ResponseEntity.ok(jsonResult);
	}
}
