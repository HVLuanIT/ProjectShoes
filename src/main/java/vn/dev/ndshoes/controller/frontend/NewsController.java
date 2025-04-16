package vn.dev.ndshoes.controller.frontend;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.controller.BaseController;

@Controller
public class NewsController extends BaseController{
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(final Model model, final HttpServletRequest request
			, HttpServletResponse respone) throws IOException{
		return "frontend/news";
	}
}
