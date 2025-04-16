package vn.dev.ndshoes.controller.backend;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/")
public class HomeAdminController extends BaseController{
	@RequestMapping(value = "home", method = RequestMethod.GET )
	public String home(final Model model, final HttpServletRequest request){
		return "backend/home";
	}
}
