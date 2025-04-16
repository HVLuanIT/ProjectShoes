package vn.dev.ndshoes.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.dev.ndshoes.model.User;


@Service
public class UserService extends BaseService<User> {
	@Override
	public Class<User> clazz(){
		return User.class;
	}
	public List<User> findAllActive(){
		return super.executeNativeSql("SELECT * FROM tbl_user WHERE status = 1");
	}
	public List<User> findAllUsers() {
		return super.executeNativeSql("SELECT * FROM tbl_user WHERE status = 1 AND username != 'admin'");
	}
	@Transactional
	public void deleteUserById(int id) {
		super.deleteById(id);
	}
	@Transactional
	public void inactiveUser(User user) {
		super.saveOrUpdate(user);
	}
	// Phương thức kiểm tra (1) file có được upload hay không?
	public boolean isUploadFile(MultipartFile file) {
		// file null hoặc tên file rỗng
		if (file == null || file.getOriginalFilename().isEmpty()) {
			return false; // Không upload
		}
		return true; // Có upload
	}
//	@Transactional
//	public User saveProfile(User user, MultipartFile avatarFile)
//			throws IOException {
//		// Lay produc trong db
//		User dbUser = super.getById(user.getId());
//		user.setPassword(dbUser.getPassword());
//	    user.setUsername(dbUser.getUsername());
//	    user.setDescription(dbUser.getDescription());
//	    // Lấy giá trị ban đầu của các trường create_date và update_date
//	    Date createDate = dbUser.getCreateDate();
//	    Date updateDate = dbUser.getUpdateDate();
//	    // Thiết lập lại các trường create_date và update_date với giá trị ban đầu
//	    user.setCreateDate(createDate);
//	    user.setUpdateDate(updateDate);
//	    
//	    user.setUserCreateUser(dbUser.getUserCreateUser());
//	    user.setUserUpdateUser(dbUser.getUserUpdateUser());
//		// Luu avatar file moi neu nguoi dung co upload avatar
//		if (isUploadFile(avatarFile)) { // Co upload file avatar
//
//			// Xoa avatar cu (Xoa file avatar)
//			String path = FOLDER_UPLOAD + dbUser.getAvatar();
//			File file = new File(path);
//			file.delete();
//
//			// Lưu file avatar mới vào thư mực User/Avatar
//			path = FOLDER_UPLOAD + "User/Avatar/" + avatarFile.getOriginalFilename();
//			file = new File(path);
//			avatarFile.transferTo(file);
//			// Lưu đường dẫn của avatar mới vào bảng tbl_user
//			user.setAvatar("User/Avatar/" + avatarFile.getOriginalFilename());
//			 return super.saveOrUpdate(user);
//		} else { // Người dùng không upload avatar file
//			// giữ nguyên avatar cũ
//			user.setAvatar(dbUser.getAvatar());
//			
//		    return super.saveOrUpdate(user);
//		}
//	}
}
