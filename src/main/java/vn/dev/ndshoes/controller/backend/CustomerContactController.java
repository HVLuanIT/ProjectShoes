package vn.dev.ndshoes.controller.backend;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.controller.BaseController;
import vn.dev.ndshoes.dto.PsConstant;
import vn.dev.ndshoes.dto.SearchModel;
import vn.dev.ndshoes.model.Contact;
import vn.dev.ndshoes.model.User;
import vn.dev.ndshoes.service.ContactService;
import vn.dev.ndshoes.service.UserService;

@Controller
@RequestMapping(value = "/admin/")
public class CustomerContactController extends BaseController implements PsConstant{
	@Autowired
	private ContactService contactService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "customer-contact", method = RequestMethod.GET)
	public String customerContact(final Model model, final HttpServletRequest request){
		
		SearchModel contactSearch = new SearchModel();
		//Tìm kiếm theo status
		contactSearch.setStatus(2);
		String status = request.getParameter("status");
		if(!StringUtils.isEmpty(status)) {
			contactSearch.setStatus(Integer.parseInt(status));
		}
		//Tìm kiếm theo từ khóa
		contactSearch.setKeyword(null);
		String keyword = request.getParameter("keyword");
		if(!StringUtils.isEmpty(keyword)) {
			contactSearch.setKeyword(keyword);
		}
		// Tìm theo từ khoảng [] ngày
		String beginDate = null;
		String endDate = null;
		if (!StringUtils.isEmpty(request.getParameter("beginDate"))
				&& !StringUtils.isEmpty(request.getParameter("endDate"))) {
			beginDate = request.getParameter("beginDate");
			endDate = request.getParameter("endDate");
		}
		contactSearch.setBeginDate(beginDate);
		contactSearch.setEndDate(endDate);
		// Bat dau phan trang
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) { // Bam nut chuyen trang
			contactSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		} else {
			contactSearch.setCurrentPage(1); // lan dau truy cap luon hien thi trang 1
		}
		List<Contact> allCustomerContacts = contactService.searchCustomerContact(contactSearch);// Tim kiem
		List<Contact> customerContacts = new ArrayList<Contact>(); // DS sp can hien thi trang hien tai
		// Tong so trang theo tim kiem
		int totalPages = allCustomerContacts.size() / SIZE_OF_PAGE;
		if (allCustomerContacts.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		// Neu tong so trang < trang hien tai (lai bam tim kiem)
		if (totalPages < contactSearch.getCurrentPage()) {
			contactSearch.setCurrentPage(1);
		}
		// Lay danh sach sp can hien thi trong 1 trang
		int firstIndex = (contactSearch.getCurrentPage() - 1) * SIZE_OF_PAGE; // vị trị dau 1 trang
		int index = firstIndex, count = 0;
		while (index < allCustomerContacts.size() && count < SIZE_OF_PAGE) {
			customerContacts.add(allCustomerContacts.get(index));
			index++;
			count++;
		}
		// Phan trang
		contactSearch.setSizeOfPage(SIZE_OF_PAGE); // So ban ghi tren 1 trang
		contactSearch.setTotalItems(allCustomerContacts.size()); // Tong so san pham theo tim kiem
		model.addAttribute("contactSearch", contactSearch);
		model.addAttribute("customerContacts", customerContacts);
		return "backend/customer-contact";
	}
	@RequestMapping(value = "customer-contact/detail/{contactId}", method = RequestMethod.GET)
	String contactDetail(final Model model, @PathVariable("contactId") int contactId) {
		Contact customerContact = contactService.getById(contactId);
		model.addAttribute("customerContact", customerContact);
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		customerContact.setUpdateDate(new Date());
		return "backend/customer-contact-detail";
	}
	@RequestMapping(value = "customer-contact/delete/{contactId}", method = RequestMethod.GET)
	public String contactDelete(final Model model,@PathVariable("contactId") int contactId) {
		Contact customerContact = contactService.getById(contactId);
		customerContact.setStatus(false);
		contactService.inactiveCustomerContact(customerContact);
		return "redirect:/admin/customer-contact";
	}
	
}
