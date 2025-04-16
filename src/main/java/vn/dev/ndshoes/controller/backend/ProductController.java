package vn.dev.ndshoes.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.dev.ndshoes.dto.PsConstant;
import vn.dev.ndshoes.dto.SearchModel;
import vn.dev.ndshoes.model.BaseModel;
import vn.dev.ndshoes.model.Category;
import vn.dev.ndshoes.model.Product;
import vn.dev.ndshoes.model.User;
import vn.dev.ndshoes.service.CategoryService;
import vn.dev.ndshoes.service.ProductService;
import vn.dev.ndshoes.service.UserService;

@Controller
@RequestMapping(value = "/admin/product/")
public class ProductController extends BaseModel implements PsConstant{
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	@Autowired
	private CategoryService categoryService;
	
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model, final HttpServletRequest request) {
		//Tìm theo status
		SearchModel productSearch = new SearchModel();
		productSearch.setStatus(2);
		String status = request.getParameter("status");
		if(!StringUtils.isEmpty(status)) {//có chọn
			productSearch.setStatus(Integer.parseInt(status));
		}
		//Tìm theo category
		productSearch.setCategoryId(0);
		String categoryId = request.getParameter("categoryId");
		if(!StringUtils.isEmpty(categoryId)) {//có chọn
			productSearch.setCategoryId(Integer.parseInt(categoryId));
		}
		//Tìm theo keyword
		productSearch.setKeyword(null);
		String keyword = request.getParameter("keyword");
		if(!StringUtils.isEmpty(keyword)) {
			productSearch.setKeyword(keyword);
		}
		// Tìm kiếm theo ngày tháng
		String beginDate = null;
		String endDate = null;
		if (!StringUtils.isEmpty(request.getParameter("beginDate"))
				&& !StringUtils.isEmpty(request.getParameter("endDate"))) {
			beginDate = request.getParameter("beginDate");
			endDate = request.getParameter("endDate");
		}
		productSearch.setBeginDate(beginDate);
		productSearch.setEndDate(endDate);
		
		// Bắt đầu phần trang
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		} else {
			productSearch.setCurrentPage(1);
		}

		List<Product> allProducts = productService.searchProduct(productSearch);// Tìm kiếm
		List<Product> products = new ArrayList<Product>();// Danh sách hiển thị trang hiện tại
		// Tính tổng số trang theo tìm kiếm
		int totalPages = allProducts.size() / SIZE_OF_PAGE;
		if (allProducts.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		// Nếu tổng số trang nhỏ hơn trang hiện tại
		if (totalPages < productSearch.getCurrentPage()) {
			productSearch.setCurrentPage(1);
		}
		// Lấy danh sách cần hiển thị trong một trang
		int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while (index < allProducts.size() && count < SIZE_OF_PAGE) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}
		// Phân trang
		productSearch.setSizeOfPage(SIZE_OF_PAGE);
		productSearch.setTotalItems(allProducts.size());
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		model.addAttribute("products", products);
		model.addAttribute("productSearch", productSearch);
		// Tính tổng số lượng còn lại trong kho
		Integer totalProducts = 0;
		for (Product product : allProducts) {
			Integer productTotal;
			if (product.getProductQuantity() == null) {
				productTotal = 0;
			} else {
				productTotal = product.getProductQuantity().intValue();
			}
			totalProducts += productTotal;
		}
		model.addAttribute("totalProducts", totalProducts);
		return "backend/product-list";
	}
	
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String productAdd(final Model model) {
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		Product product = new Product();
		product.setCreateDate(new Date());
		model.addAttribute("product", product);
		return "backend/product-add";
	}
	
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String addSave(final Model model, 
				@ModelAttribute("product") Product product,
				@RequestParam("avatarFile") MultipartFile avatarFile,
				@RequestParam("imageFiles") MultipartFile[] imageFiles) throws IOException{
		productService.saveAddProduct(product, avatarFile, imageFiles);
		return "redirect:/admin/product/list";
	}
	
	@RequestMapping(value = "edit/{productId}", method = RequestMethod.GET)
	public String edit(final Model model, @PathVariable("productId") int productId) {
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		Product product = productService.getById(productId);
		product.setCreateDate(new Date());
		model.addAttribute("product", product);
		return "backend/product-edit";
	}
	
	
	//--------------edit-save product----------------------------------------------------
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model, 
				@ModelAttribute("product") Product product,
				@RequestParam("avatarFile") MultipartFile avatarFile,
				@RequestParam("imageFiles") MultipartFile[] imageFiles) throws IOException{
		productService.saveEditProduct(product, avatarFile, imageFiles);
		return "redirect:/admin/product/list";
	}
	@RequestMapping(value = "delete/{productId}", method = RequestMethod.GET)
	public String delete(final Model model, @PathVariable("productId") int productId) {
		Product product = productService.getById(productId);
		product.setStatus(false);
		productService.saveOrUpdate(product);
		return "redirect:/admin/product/list";
	}
}
