package vn.dev.ndshoes.dto;

public class SearchModel {

		private int status;
		private int categoryId;
		private String keyword;
		private String beginDate;
		private String endDate;
		
		private int sizeOfPage;// Số bản ghi hiển thị trong một trang
		private int currentPage;// Trang hiện tại
		private int totalItems;// Tổng số bản ghi tìm kiếm đ
		private int totalPages;// Tổng số trang
		
		private int orderId;
		private int checkPrice;
		private String sortCheck;
		
		public SearchModel() {
			super();
		}
		

		public SearchModel(int status, int categoryId, String keyword, String beginDate, String endDate, int sizeOfPage,
				int currentPage, int totalItems, int totalPages, int orderId, int checkPrice, String sortCheck) {
			super();
			this.status = status;
			this.categoryId = categoryId;
			this.keyword = keyword;
			this.beginDate = beginDate;
			this.endDate = endDate;
			this.sizeOfPage = sizeOfPage;
			this.currentPage = currentPage;
			this.totalItems = totalItems;
			this.totalPages = totalPages;
			this.orderId = orderId;
			this.checkPrice = checkPrice;
			this.sortCheck = sortCheck;
		}

		
		public int getCheckPrice() {
			return checkPrice;
		}


		public void setCheckPrice(int checkPrice) {
			this.checkPrice = checkPrice;
		}


		public String getSortCheck() {
			return sortCheck;
		}


		public void setSortCheck(String sortCheck) {
			this.sortCheck = sortCheck;
		}


		public int getOrderId() {
			return orderId;
		}

		public void setOrderId(int orderId) {
			this.orderId = orderId;
		}

		public int getStatus() {
			return status;
		}

		public void setStatus(int status) {
			this.status = status;
		}

		public int getCategoryId() {
			return categoryId;
		}

		public void setCategoryId(int categoryId) {
			this.categoryId = categoryId;
		}

		public String getKeyword() {
			return keyword;
		}

		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}

		public String getBeginDate() {
			return beginDate;
		}

		public void setBeginDate(String beginDate) {
			this.beginDate = beginDate;
		}

		public String getEndDate() {
			return endDate;
		}

		public void setEndDate(String endDate) {
			this.endDate = endDate;
		}


		public int getSizeOfPage() {
			return sizeOfPage;
		}



		public void setSizeOfPage(int sizeOfPage) {
			this.sizeOfPage = sizeOfPage;
		}



		public int getCurrentPage() {
			return currentPage;
		}



		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}



		public int getTotalItems() {
			return totalItems;
		}



		public void setTotalItems(int totalItems) {
			this.totalItems = totalItems;
		}



		public int getTotalPages() {
			return totalPages;
		}



		public void setTotalPages(int totalPages) {
			this.totalPages = totalPages;
		}
		
}
