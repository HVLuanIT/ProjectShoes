package vn.dev.ndshoes.controller.frontend;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.dev.ndshoes.controller.BaseController;

import vn.dev.ndshoes.dto.PsConstant;
import vn.dev.ndshoes.model.Contact;
import vn.dev.ndshoes.service.ContactService;

@Controller
public class ContactController extends BaseController implements PsConstant{
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, 
			final HttpServletResponse respone) throws IOException{
		return "frontend/contact/contact";
	}
	@RequestMapping(value = "/contact-send", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactEditSave(final Model model, 
			final HttpServletRequest request, 
			@RequestBody Contact contact)
			throws IOException {
		
		//Sau khi lưu giữ liệu vào DB;
		Map<String, Object> jsonResult = new HashMap<String, Object>(); // Gửi trở lại view
		jsonResult.put("code", "Thông báo");
		if (StringUtils.isEmpty(contact.getName())) {
			jsonResult.put("errorMessage", "Bạn chưa nhập họ tên");
		} else if (StringUtils.isEmpty(contact.getMobile())) {
			jsonResult.put("errorMessage", "Bạn chưa nhập Số điện thoại");
		} else if (StringUtils.isEmpty(contact.getEmail())) {
			jsonResult.put("errorMessage", "Bạn chưa nhập Email");
		} else if (StringUtils.isEmpty(contact.getAddress())) {
			jsonResult.put("errorMessage", "Bạn chưa nhập địa chỉ");
		} else {
			Contact contacts = new Contact();
			contacts.setStatus(true);
			contacts.setCreateDate(new Date());
			contacts.setName(contact.getName());
			contacts.setMobile(contact.getMobile());
			contacts.setEmail(contact.getEmail());
			contacts.setAddress(contact.getAddress());
			contacts.setMessage(contact.getMessage());
			
			contactService.saveOrUpdate(contacts);
			jsonResult.put("message", "Cảm ơn " + contact.getName() + " đã gửi thông tin phản hồi");
			
			//Xóa
			contact = new Contact();
		}
		
		return ResponseEntity.ok(jsonResult);
	}
}
