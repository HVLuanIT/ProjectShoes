package vn.dev.ndshoes.controller.frontend;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.controller.BaseController;
import vn.dev.ndshoes.dto.SearchModel;
import vn.dev.ndshoes.model.Product;
import vn.dev.ndshoes.model.ProductImage;
import vn.dev.ndshoes.service.ProductImageService;
import vn.dev.ndshoes.service.ProductService;

@Controller
public class HomeController extends BaseController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductImageService productImageService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	//@RequestMapping: Ánh xạ một action đến một action method trong controller
	public String index(final Model model, final HttpServletRequest request,
				HttpServletResponse respone) throws IOException{
		String keyword = request.getParameter("keyword");
		if(!StringUtils.isEmpty(keyword)) {
			model.addAttribute("keyword", keyword);
			return "redirect:/allproduct?keyword=" + URLEncoder.encode(keyword, StandardCharsets.UTF_8);
		}
		
		
		List<Product> isHotProducts = productService.findAllActiveAndIsHot();
		model.addAttribute("isHotProducts", isHotProducts);
		model.addAttribute("discountsForHotProducts", calculateDiscounts(isHotProducts));
		
		List<Product> products = productService.findTop8ProductNew();
		model.addAttribute("products", products);
		model.addAttribute("discountsForAllProducts", calculateDiscounts(products));
		return "frontend/index";
	}
	@RequestMapping(value = "product-detail/{productId}", method = RequestMethod.GET)
	public String productDetail(final Model model, @PathVariable("productId") int productId) {
		List<ProductImage> productImages = productImageService.getProductImageByProductId(productId);
		model.addAttribute("productImages", productImages);
		
		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		List<String> sizes = productService.getSizesForProduct(productId);
		model.addAttribute("sizes", sizes);
		return "frontend/product-detail";
	}
	
}
