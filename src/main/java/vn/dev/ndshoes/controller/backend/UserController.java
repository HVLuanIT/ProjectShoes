package vn.dev.ndshoes.controller.backend;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.controller.BaseController;
import vn.dev.ndshoes.dto.PsConstant;
import vn.dev.ndshoes.dto.SearchModel;
import vn.dev.ndshoes.model.Role;
import vn.dev.ndshoes.model.User;
import vn.dev.ndshoes.service.RoleService;
import vn.dev.ndshoes.service.UserService;


@Controller
@RequestMapping(value = "/admin/user/")
public class UserController extends BaseController implements PsConstant{
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@RequestMapping(value = "list" , method = RequestMethod.GET)
	public String list(final Model model,
			HttpServletRequest request) {
		
		// Bắt đầu phần trang
		SearchModel userSearch = new SearchModel();
		if(!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			userSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}else {
			userSearch.setCurrentPage(1);
		}		
		List<User> allUsers = userService.findAll();
		List<User> users = new ArrayList<User>();// Danh sách hiển thị trang hiện tại
		// Tính tổng số trang theo tìm kiếm
		int totalPages = allUsers.size() / SIZE_OF_PAGE;
		if(allUsers.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		// Nếu tổng số trang nhỏ hơn trang hiện tại
		if(totalPages < userSearch.getCurrentPage()) {
			userSearch.setCurrentPage(1);
		}
		// Lấy danh sách cần hiển thị trong một trang
		int firstIndex = (userSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < allUsers.size() && count < SIZE_OF_PAGE) {
			users.add(allUsers.get(index));
			index++;
			count++;
		} 
		// Phân trang
		userSearch.setSizeOfPage(SIZE_OF_PAGE);
		userSearch.setTotalItems(allUsers.size());
		model.addAttribute("users",users);
		model.addAttribute("userSearch", userSearch);
		return "backend/user-list";
	}
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		List<User> users = userService.findAll();
		model.addAttribute("users",users);
		
		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);
		
		User user = new User();
		user.setCreateDate(new Date());
		
		model.addAttribute("user", user);
		return "backend/user-add";
	}
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	// Cách đẩy 1 dữ liệu sang view
	public String addSave(final Model model, @ModelAttribute("user") User user, HttpServletRequest request) {
		
		int roleId = Integer.parseInt(request.getParameter("roleId"));
		Role role = roleService.getRoleById(roleId);
		String rawPassword = user.getPassword();
	    String encodedPassword = new BCryptPasswordEncoder(4).encode(rawPassword);
	    user.setPassword(encodedPassword);
	    user.addRelationalUserRole(role);
		userService.saveOrUpdate(user);
		return "redirect:/admin/user/list";
	}
	@RequestMapping(value = "edit/{UserId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable ("UserId") int UserId){
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		User user = userService.getById(UserId);
		model.addAttribute("user", user);
		return "backend/user-edit";
	}
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
				@ModelAttribute("user") User user) {
		userService.saveOrUpdate(user);
		return "redirect:/admin/user/list";
	}
	
	@RequestMapping(value = "delete/{UserId}", method = RequestMethod.GET)
	public String delete(final Model model,
				@PathVariable("UserId") int userId) {
		User user = userService.getById(userId);
		user.setStatus(false);
		userService.inactiveUser(user);
		return "redirect:/admin/user/list";
	}
}
