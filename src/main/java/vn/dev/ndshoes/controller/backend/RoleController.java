package vn.dev.ndshoes.controller.backend;

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

import vn.dev.ndshoes.dto.PsConstant;
import vn.dev.ndshoes.dto.SearchModel;
import vn.dev.ndshoes.model.BaseModel;
import vn.dev.ndshoes.model.Role;
import vn.dev.ndshoes.model.User;
import vn.dev.ndshoes.service.RoleService;
import vn.dev.ndshoes.service.UserService;

@Controller
@RequestMapping(value = "/admin/role/")
public class RoleController extends BaseModel implements PsConstant{
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model,
			HttpServletRequest request) {
		// Bắt đầu phần trang
		SearchModel roleSearch = new SearchModel();
		if(!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			roleSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}else {
			roleSearch.setCurrentPage(1);
		}		
		List<Role> allRoles = roleService.findAll();
		List<Role> roles = new ArrayList<Role>();// Danh sách hiển thị trang hiện tại
		// Tính tổng số trang theo tìm kiếm
		int totalPages = allRoles.size() / SIZE_OF_PAGE;
		if(allRoles.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		// Nếu tổng số trang nhỏ hơn trang hiện tại
		if(totalPages < roleSearch.getCurrentPage()) {
			roleSearch.setCurrentPage(1);
		}
		// Lấy danh sách cần hiển thị trong một trang
		int firstIndex = (roleSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < allRoles.size() && count < SIZE_OF_PAGE) {
			roles.add(allRoles.get(index));
			index++;
			count++;
		} 
		// Phân trang
		roleSearch.setSizeOfPage(SIZE_OF_PAGE);
		roleSearch.setTotalItems(allRoles.size());
		model.addAttribute("roles",roles);
		model.addAttribute("roleSearch", roleSearch);
		return "backend/role-list";
	}
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		List<User> users = userService.findAll();
		model.addAttribute("users",users);
		
		Role role = new Role();
		
		role.setCreateDate(new Date());
		model.addAttribute("role", role);
		return "backend/role-add";
	}
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String addSave(final Model model,
			@ModelAttribute("role") Role role) {
		roleService.saveOrUpdate(role);
		return "redirect:/admin/role/list";
	}
	@RequestMapping(value = "edit/{RoleId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable("RoleId") int RoleId) {
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		Role role = roleService.getById(RoleId);
		model.addAttribute("role",role);
		return "backend/role-edit";
	}
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
			@ModelAttribute("role") Role role) {
		roleService.saveOrUpdate(role);
		return "redirect:/admin/role/list";
	}
	@RequestMapping(value = "delete/{RoleId}" , method = RequestMethod.GET)
	public String delete(final Model model,
			@PathVariable("RoleId") int roleId) {
		Role role = roleService.getById(roleId);
		role.setStatus(false);
		roleService.inactiveRole(role);
		return "redirect:/admin/role/list";
		
	}
}
