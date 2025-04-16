package vn.dev.ndshoes.controller.frontend;

import java.math.BigDecimal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.controller.BaseController;
import vn.dev.ndshoes.dto.PsConstant;
import vn.dev.ndshoes.dto.SearchModel;
import vn.dev.ndshoes.model.BaseModel;
import vn.dev.ndshoes.model.Product;
import vn.dev.ndshoes.service.ProductService;

@Controller
public class ProductControllerFE extends BaseController implements PsConstant{
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/allproduct", method = RequestMethod.GET)
	public String allProduct(final Model model, final HttpServletRequest request){
		SearchModel searchModel = new SearchModel();		
		//Tìm kiếm theo category
		searchModel.setCategoryId(0);
		String categoryId = request.getParameter("categoryId");
		if (!StringUtils.isEmpty(categoryId)) {
			searchModel.setCategoryId(Integer.parseInt(categoryId));
		}

		// Tìm kiếm theo key
		searchModel.setKeyword(null);
		String keyword = request.getParameter("keyword");
		if (!StringUtils.isEmpty(keyword)) {
			searchModel.setKeyword(keyword);
		}
		// Tìm kiếm theo Giá tiền
		searchModel.setCheckPrice(0);
		String checkPrice = request.getParameter("checkPrice");
		if (!StringUtils.isEmpty(checkPrice)) {
			searchModel.setCheckPrice(Integer.parseInt(checkPrice));
		}
		// Sắp xếp theo mặc định
		searchModel.setSortCheck(null);
		String sortCheck = request.getParameter("sortCheck");
		if (!StringUtils.isEmpty(sortCheck)) {
			searchModel.setSortCheck(sortCheck);
		}
		List<Product> products = productService.searchProductFE(searchModel);
		List<BigDecimal> discounts = calculateDiscounts(products);
		model.addAttribute("products", products);
		model.addAttribute("keyword", keyword);
		model.addAttribute("discounts", discounts);
		return "frontend/allproduct";
	}
}
