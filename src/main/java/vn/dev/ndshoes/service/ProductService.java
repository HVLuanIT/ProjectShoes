package vn.dev.ndshoes.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.dev.ndshoes.dto.PsConstant;
import vn.dev.ndshoes.dto.SearchModel;
import vn.dev.ndshoes.model.Product;
import vn.dev.ndshoes.model.ProductImage;


@Service
public class ProductService extends BaseService<Product> implements PsConstant{
	@Override
	public Class<Product> clazz(){
		return Product.class;
	}
	public List<Product> findAllActive(){
		return super.executeNativeSql("Select * From tbl_product WHERE status= 1");
	}
	public List<Product> findAllActiveAndIsHot(){
		return super.executeNativeSql("Select * from tbl_product WHERE status = 1 AND is_hot = 1");
	}
	public List<Product> findTop8ProductNew(){
		return super.executeNativeSql("Select * from tbl_product WHERE status = 1 ORDER BY create_date DESC LIMIT 8");
	}
	// Kiểm tra 1 file có được upload hay không
	public boolean isUploadFile(MultipartFile file) {
		if(file == null || file.getOriginalFilename().isEmpty()) {
			return false;// Không upload
		}
		return true;//Có upload
	}
	// Phương thức kiểm tra xem có danh sách file nào được upload không
	public boolean isUploadFiles(MultipartFile[] files) {
		if(files == null || files.length ==0) {
			return false;//Không load file
		}
		return true;//Có load danh sách file
	}
	
	//Lưu vào database-----------------------------------------------------------
	@Transactional
	public Product saveAddProduct(Product product, MultipartFile avatarFile,
			MultipartFile[] imageFiles) throws IOException{
		//Lưu avatarFile
		if(isUploadFile(avatarFile)) {
			//Lưu file vào thư mục Product/Avatar
			String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			//Lưu đường dẫn vào bảng tbl_product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		//Lưu image file
		if(isUploadFiles(imageFiles)) {//Có upload danh sách ảnh
			//Duyệt danh sách file image
			for(MultipartFile imageFile : imageFiles) {
				if(isUploadFile(avatarFile)) {//File có upload
					//Lưu file vào thư mục Product/Image
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file =  new File(path);
					imageFile.transferTo(file);
					//Lưu đường dẫn vào tbl_product_image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					
					//Lưu đường dẫn ảnh sang bang tbl_product_image
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return super.saveOrUpdate(product);
	}
	
	// -------------------------Lưu dữ liệu đã sửa vào database--------------------------------------
	@Transactional
	public Product saveEditProduct(Product product, MultipartFile avatarFile,
				MultipartFile[] imageFiles) throws IOException{
		// Lấy product trong db
		Product dbProduct = super.getById(product.getId());
		// Lưu file avatar mới nếu người dùng upload file
		if(isUploadFile(avatarFile)) {// Có upload file
			//Xóa avatar Cũ
			String path = FOLDER_UPLOAD + dbProduct.getAvatar();
			File file = new File(path);
			file.delete();
			//Lưu file avatar mới vào thư mục
			path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			// Lưu đường avatar mới vào bảng tbl_product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}else {
			// Người dùng không upload file avatar thì giữ nguyên avatar cũ
			product.setAvatar(dbProduct.getAvatar());
		}
		// Lưu image file
		if(isUploadFiles(imageFiles)) {
			//Duyệt danh sách file Image
			for (MultipartFile imageFile : imageFiles) {
				if(isUploadFile(imageFile)) {//File có upload
					//Lưu file vòa thư mục image
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					
					//Lưu đường dẫn vào bảng tbl_product_image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return saveOrUpdate(product);
	}
	
	// Delete product
	@Autowired
	private ProductImageService productImageService;

	@Transactional
	public void deleteProduct(Product product) {
		// Lấy danh sách ảnh của product trong tbl_product_image
		String sql = "SELECT * from tbl_product_image WHERE product_id =" + product.getId();
		List<ProductImage> productImages = productImageService.executeNativeSql(sql);

		// Xóa lần lượt các ảnh của product trong Product/Image và
		// xóa lần lượt các đường dẫn ảnh trong tbl_product_image
		for (ProductImage productImage : productImages) {
			// xóa file trong thư mục Product/Image trước
			String path = FOLDER_UPLOAD + productImage.getPath();
			File file = new File(path);
			file.delete();
		}
		// Xóa bản ghi thông tin ảnh trong tbl_product_image
		String path = FOLDER_UPLOAD + product.getAvatar();
		File file = new File(path);
		file.delete();
		super.delete(product);
	}
	
	public List<Product> searchProduct(SearchModel productSearch){
		//Tạo câu lệnh sql
		String sql = "SELECT * FROM tbl_product p WHERE 1 = 1";
		//Tìm kiếm với tiêu chí status
		if(productSearch.getStatus() != 2) {
			sql += " AND p.status=" + productSearch.getStatus();
		}
		//Tìm kiếm với tiêu chí category
		if(productSearch.getCategoryId() != 0) {
			sql += " AND p.category_id=" + productSearch.getCategoryId();
		}
		//Tìm kiếm với tiêu chí keyword
		if (!StringUtils.isEmpty(productSearch.getKeyword())) {
			String keyword = productSearch.getKeyword().toLowerCase();
			
			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" +
					" OR LOWER(p.short_description) like '%" + keyword + "%'" +
					" OR LOWER(p.seo) like '%" + keyword + "%')";
		}
		// Tìm kiếm theo ngày tháng
		if(!StringUtils.isEmpty(productSearch.getBeginDate() )&& !StringUtils.isEmpty(productSearch.getEndDate())) {
			String beginDate = productSearch.getBeginDate();
			String endDate = productSearch.getEndDate();
			sql += " AND p.create_date BETWEEN '" + beginDate + "'AND '" + endDate + "'";
		}
		
		return super.executeNativeSql(sql);
	}
	
	//---------------------------------------productSearchFE-------------------------------------
	public List<Product> searchProductFE(SearchModel searchModel){
		// Tạo câu lệnh sql
		String sql = "SELECT * FROM tbl_product p WHERE 1=1 AND p.status = 1";
				
		//Tim kiemvoi tieu chi category
		if(searchModel.getCategoryId() != 0) {
			sql += " AND p.category_id = " + searchModel.getCategoryId();
		}
		//Tìm kiếm với keyword
		if(!StringUtils.isEmpty(searchModel.getKeyword())) {
			String keyword = searchModel.getKeyword().toLowerCase();
					
			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
					+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";
		}
		if (searchModel.getCheckPrice() != 0) {
			switch (searchModel.getCheckPrice()) {
			case 1:
				sql += " AND (p.sale_price BETWEEN 0 AND 1000000 OR (p.sale_price IS NULL AND p.price BETWEEN 0 AND 1000000)) ";
				break;
			case 2:
				sql += " AND (p.sale_price BETWEEN 1000000 AND 3000000 OR (p.sale_price IS NULL AND p.price BETWEEN 1000000 AND 3000000)) ";
				break;
			case 3:
				sql += " AND (p.sale_price BETWEEN 3000000 AND 5000000 OR (p.sale_price IS NULL AND p.price BETWEEN 3000000 AND 5000000)) ";
				break;
			case 4:
				sql += " AND (p.sale_price BETWEEN 5000000 AND 10000000 OR (p.sale_price IS NULL AND p.price BETWEEN 5000000 AND 10000000)) ";
				break;
			case 5:
				sql += " AND (p.sale_price >= 10000000 OR (p.sale_price IS NULL AND p.price >= 10000000)) ";
				break;
			default:
				break;
			}
		}
		if (searchModel.getSortCheck() != null && !searchModel.getSortCheck().isEmpty()) {
			switch (searchModel.getSortCheck()) {
			case "nameASC":
				sql += " ORDER BY LOWER(p.name) COLLATE utf8mb4_unicode_ci ASC";
				break;
			case "nameDESC":
				sql += " ORDER BY LOWER(p.name) COLLATE utf8mb4_unicode_ci DESC";
				break;
			case "priceASC":
				sql += " ORDER BY CASE WHEN p.sale_price IS NOT NULL THEN p.sale_price ELSE p.price END ASC";
				break;
			case "priceDESC":
				sql += " ORDER BY CASE WHEN p.sale_price IS NOT NULL THEN p.sale_price ELSE p.price END DESC";
				break;
			default:
				break;
			}
		}
		return super.executeNativeSql(sql);
	}

	public List<String> getSizesForProduct(int productId) {
		String sql = "SELECT size FROM tbl_product WHERE id = :productId";
		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("productId", productId);
		@SuppressWarnings("unchecked")
		List<String> sizes = query.getResultList();
		return sizes;
	}

	@Transactional
	public void inactiveProduct(Product product) {
		super.saveOrUpdate(product);
	}
}
