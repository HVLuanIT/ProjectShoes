package vn.dev.ndshoes.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_product")
public class Product extends BaseModel{
	@Column(name = "name", length = 300, nullable = false)
	private String name;
	
	@Column(name = "avatar", length = 300, nullable = true)
	private String avatar;
	
	@Column(name = "price", nullable = true)
	private BigDecimal price;
	
	@Column(name = "sale_price", nullable = true)
	private BigDecimal salePrice;
	
	@Column(name = "product_quantity", nullable = true)
	private Integer productQuantity;
	
	@Column(name = "size", length = 300, nullable = true)
	private String size;
	
	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE;
	
	@Column(name = "short_description", length = 500, nullable = true)
	private String shortDescription;
	
	@Column(name = "detail_description", nullable = true)
	private String detailDescription;
	
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	
	//----------Mapping many to one: tbl_product to tbl_category-----------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;
	
	// -----------------Mapping many-to-one: tbl_product-to-tbl_user (for create product)----------------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateProduct;

	// ----------------Mapping many-to-one: tbl_product-to-tbl_user (for update product)-------------------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateProduct;
	
	// ------Mapping One-to-many:tbl_product-to-tbl_product_image
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<ProductImage> ProductImages = new HashSet<ProductImage>();

	public void addRelationalProductImage(ProductImage productimage) {
		ProductImages.add(productimage);
		productimage.setProduct(this);
	}

	public void removeRelationalProductImage(ProductImage productimage) {
		ProductImages.remove(productimage);
		productimage.setProduct(null);
	}
	
	// ------Mapping One-to-many:tbl_product-to-tbl_sale_order_product
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<SaleOrderProduct> SaleOrderProducts = new HashSet<SaleOrderProduct>();

	public void addRelationalSaleOrderProduct(SaleOrderProduct saleorderproduct) {
		SaleOrderProducts.add(saleorderproduct);
		saleorderproduct.setProduct(this);
	}

	public void removeRelationalSaleOrderProduct(SaleOrderProduct saleorderproduct) {
		SaleOrderProducts.remove(saleorderproduct);
		saleorderproduct.setProduct(null);
	}
	
	
	public Product() {
		super();
	}
	

	public Product(Integer id, Date createDate, Date updateDate, Boolean status, String name, String avatar,
			BigDecimal price, BigDecimal salePrice, Integer productQuantity, String size, Boolean isHot,
			String shortDescription, String detailDescription, String seo, Category category, User userCreateProduct,
			User userUpdateProduct, Set<ProductImage> productImages, Set<SaleOrderProduct> saleOrderProducts) {
		super(id, createDate, updateDate, status);
		this.name = name;
		this.avatar = avatar;
		this.price = price;
		this.salePrice = salePrice;
		this.productQuantity = productQuantity;
		this.size = size;
		this.isHot = isHot;
		this.shortDescription = shortDescription;
		this.detailDescription = detailDescription;
		this.seo = seo;
		this.category = category;
		this.userCreateProduct = userCreateProduct;
		this.userUpdateProduct = userUpdateProduct;
		ProductImages = productImages;
		SaleOrderProducts = saleOrderProducts;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public User getUserCreateProduct() {
		return userCreateProduct;
	}

	public void setUserCreateProduct(User userCreateProduct) {
		this.userCreateProduct = userCreateProduct;
	}

	public User getUserUpdateProduct() {
		return userUpdateProduct;
	}

	public void setUserUpdateProduct(User userUpdateProduct) {
		this.userUpdateProduct = userUpdateProduct;
	}

	public Set<ProductImage> getProductImages() {
		return ProductImages;
	}

	public void setProductImages(Set<ProductImage> productImages) {
		ProductImages = productImages;
	}

	public Set<SaleOrderProduct> getSaleOrderProducts() {
		return SaleOrderProducts;
	}

	public void setSaleOrderProducts(Set<SaleOrderProduct> saleOrderProducts) {
		SaleOrderProducts = saleOrderProducts;
	}
	
}
