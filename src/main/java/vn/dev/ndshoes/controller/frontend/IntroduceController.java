package vn.dev.ndshoes.controller.frontend;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.controller.BaseController;

@Controller
public class IntroduceController extends BaseController{
	@RequestMapping(value = "/Introduce", method = RequestMethod.GET)
	public String introduce (final Model model, final HttpServletRequest request) {
		return "frontend/Introduce";
	}
}
