package vn.dev.ndshoes.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.model.Role;
import vn.dev.ndshoes.model.User;
import vn.dev.ndshoes.service.RoleService;
import vn.dev.ndshoes.service.UserService;

@Controller
public class LoginController extends BaseController {
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	private String login() throws IOException{
		return "login";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	private String signAccount() throws IOException{
		return "signup";
	}
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String register(final Model model,
			final HttpServletRequest request, 
			HttpServletResponse response ) throws IOException {
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(new BCryptPasswordEncoder(4).encode(request.getParameter("password")));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setMobile(request.getParameter("mobile"));
		user.setAddress(request.getParameter("address"));
		
		Role role = roleService.getRoleByName("GUEST");
		user.addRelationalUserRole(role);
		userService.saveOrUpdate(user);
		return "redirect:/login";
	}
}
