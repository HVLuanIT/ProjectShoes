package vn.dev.ndshoes.controller.frontend;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.controller.BaseController;
import vn.dev.ndshoes.dto.Cart;
import vn.dev.ndshoes.dto.ProductCart;
import vn.dev.ndshoes.dto.PsConstant;
import vn.dev.ndshoes.model.Product;
import vn.dev.ndshoes.service.ProductService;

@Controller
public class CartController extends BaseController implements PsConstant{
	@Autowired
	private ProductService productService;

	// Thêm một sản phẩm vào giỏ hàng
	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final Model model, final HttpServletRequest request,
			@RequestBody ProductCart addProduct) throws IOException {

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Cart cart = null;
		// Lay gio hang trong Session
		// Kiem tra xem gio hang da duoc tao trong Session chua
		if (session.getAttribute("cart") != null) { // da co gio hang
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Laay san pham trong co so du lieu
		Product dbProduct = productService.getById(addProduct.getProductId());
		BigInteger productQuantity = BigInteger.valueOf(dbProduct.getProductQuantity());
		String size = addProduct.getSize();

		// Lấy ra sản phẩm trong giỏ hàng
		int index = cart.findProductByIdAndSize(dbProduct.getId(), size);
		// Tính tổng số lượng sản phẩm cùng một loại có trong giỏ hàng
		BigInteger totalQuantityInCart = calculateTotalQuantityInCart(cart, dbProduct.getId());
		// Tính tổng số lượng sản phẩm mua mới và cập nhật giỏ hàng
		BigInteger newQuantity = addProduct.getQuantity();
		if (totalQuantityInCart.add(newQuantity).compareTo(productQuantity) > 0) { // vượt quá
			jsonResult.put("code", "Thông báo");
			jsonResult.put("message", "Số lượng sản phẩm " + dbProduct.getName() + " không đủ hàng!");
			return ResponseEntity.ok(jsonResult);
		}
		if (index != -1) {// San pham da co trong gio hang
			cart.getProductCarts().get(index)
					.setQuantity(cart.getProductCarts().get(index).getQuantity().add(addProduct.getQuantity()));
		} else {
			// Kiểm tra xem có size được chọn từ jsp không
			if (addProduct.getSize() != null && !addProduct.getSize().isEmpty()) {
				addProduct.setSize(addProduct.getSize());
			} else {
				// Nếu không có size được chọn thì mặc định lấy size đầu tiên từ danh sách size
				// của sản phẩm
				addProduct.setSize(dbProduct.getSize().split(",")[0]);
			}
			if (dbProduct.getSalePrice() != null) {
				addProduct.setProductName(dbProduct.getName());
				addProduct.setAvatar(dbProduct.getAvatar());
				addProduct.setPrice(dbProduct.getSalePrice());
			} else {
				addProduct.setProductName(dbProduct.getName());
				addProduct.setAvatar(dbProduct.getAvatar());
				addProduct.setPrice(dbProduct.getPrice());
			}

			cart.getProductCarts().add(addProduct);// Thêm sản phẩm mới vào giỏ hàng
		}

		// Thiet lap lai gio hang trong session
		session.setAttribute("cart", cart);
		// Tra ve du lieu cho view
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", "Thông báo");
		jsonResult.put("totalCartProducts", cart.totalCartProduct());
		jsonResult.put("message", " Đã thêm sản phẩm " + addProduct.getProductName() + " vào giỏ hàng ");

		return ResponseEntity.ok(jsonResult);
	}

	private BigInteger calculateTotalQuantityInCart(Cart cart, int productId) {
		BigInteger totalQuantity = BigInteger.ZERO;
		for (ProductCart productCart : cart.getProductCarts()) {
			if (productCart.getProductId() == productId) {
				totalQuantity = totalQuantity.add(productCart.getQuantity());
			}
		}
		return totalQuantity;
	}

	// Hiển thị giỏ hàng
	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			model.addAttribute("totalCartPrice", cart.totalCartPrice());
			String message = "Co tong cong" + cart.totalCartProduct() + "trong gio hang";
			model.addAttribute("message", message);
		} else {
			String errorMessage = "khong co san pham nao trong gio hang";
			model.addAttribute("errorMessage", errorMessage);
		}
		return "frontend/cart-view";
	}

	// Them/bot so luong san pham trong gio hang
	@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateProductQuantity(@RequestBody ProductCart productCart,
			final HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			// Kiêm tra null cho kích thước
			String size = productCart.getSize();
			if (size == null) {
				size = cart.getProductCarts().get(0).getSize();
			}
			// Cap nhat so luong
			// Lấy số lượng sản phẩm từ cơ sở dữ liệu
			Product dbProduct = productService.getById(productCart.getProductId());
			BigInteger productQuantity = BigInteger.valueOf(dbProduct.getProductQuantity());
			// Tính tổng số lượng các sản phẩm có cùng ID nhưng khác kích thước trong giỏ
			// hàng
			BigInteger totalQuantityInCart = calculateTotalQuantityInCart(cart, productCart.getProductId());
			if (totalQuantityInCart.compareTo(productQuantity) >= 0
					&& productCart.getQuantity().compareTo(BigInteger.ZERO) > 0) {
				jsonResult.put("code", "Thông báo");
				jsonResult.put("message", "Số lượng sản phẩm " + dbProduct.getName() + " không đủ!");
				return ResponseEntity.ok(jsonResult);
			}
			// Kiểm tra sản phẩm đặt mua đã có trong giỏ hàng hay chưa
			int index = cart.findProductByIdAndSize(productCart.getProductId(), size);
			if (index != -1) {
				BigInteger oldQuantity = cart.getProductCarts().get(index).getQuantity();
				BigInteger newQuantity = oldQuantity.add(productCart.getQuantity()); // -/+
				if (newQuantity.intValue() < 1) {
					newQuantity = BigInteger.ONE;
				}
				cart.getProductCarts().get(index).setQuantity(newQuantity);
				jsonResult.put("newQuantity", newQuantity);
				// Lấy ra new totalPrice
				BigDecimal newTotalPrice = BigDecimal.ZERO;
				if (dbProduct.getSalePrice() != null) {
					newTotalPrice = dbProduct.getSalePrice().multiply(new BigDecimal(newQuantity));
				} else {
					newTotalPrice = dbProduct.getPrice().multiply(new BigDecimal(newQuantity));
				}
				jsonResult.put("newTotalPrice", newTotalPrice);
				jsonResult.put("totalCartProducts", cart.totalCartProduct());
				BigDecimal newTotalCartPrice = cart.totalCartPrice();
				jsonResult.put("newTotalCartPrice", newTotalCartPrice);
				jsonResult.put("productId", productCart.getProductId());
				jsonResult.put("size", size);
			}
		}
		// Tra ve du lieu cho view
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = "/product-cart-delete/{productId}/{size}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId") int productId, @PathVariable("size") String size,
			final HttpServletRequest request, final Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			// Tìm vị trí của sản phẩm trong giỏ hàng
			int index = cart.findProductByIdAndSize(productId, size);
			if (index != -1) {
				cart.getProductCarts().remove(index);
			}
			// Thiết lập lại giỏ hàng trong session
			session.setAttribute("cart", cart);
		}
		return "redirect:/cart-view";
	}
}
