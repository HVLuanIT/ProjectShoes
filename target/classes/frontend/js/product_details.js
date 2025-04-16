const tabLinks = document.querySelectorAll(".tab-link");
    
// Lặp qua từng tab link
tabLinks.forEach(function(link) {
    link.addEventListener("click", function() {
        // Xóa lớp "current" từ tất cả các tab link
        tabLinks.forEach(function(link) {
            link.classList.remove("current");
        });
        
        // Thêm lớp "current" vào tab link được click
        this.classList.add("current");
        
        // Lấy data-tab của tab link được click
        const tabId = this.getAttribute("data-tab");
        
        // Lấy danh sách các tab content
        const tabContents = document.querySelectorAll(".tab-content");
        
        // Lặp qua từng tab content
        tabContents.forEach(function(content) {
            // Kiểm tra nếu data-tab của tab content trùng với tabId
            if (content.classList.contains(tabId)) {
                // Thêm lớp "current" vào tab content tương ứng
                content.classList.add("current");
            } else {
                // Xóa lớp "current" từ các tab content khác
                content.classList.remove("current");
            }
        });
    });
});
window.addEventListener('scroll', function() {
    var addThisListing = document.querySelector('.addThis_listing');
    var scrollPosition = window.scrollY;
  
    if (scrollPosition >= 100) {
      addThisListing.classList.add('is-show');
    } else {
      addThisListing.classList.remove('is-show');
    }
  });
  
   // Lấy phần tử toggleMenu và menu
 const toggleMenu = document.querySelector(".d-inline-block");
 const menu = document.querySelector(".menu");

 // Thêm sự kiện click vào toggleMenu
 toggleMenu.addEventListener("click", function() {
   // Thêm class "current" cho menu khi click vào toggleMenu
   menu.classList.add("current");
 });

 // Thêm sự kiện click vào trang
 document.addEventListener("click", function(event) {
   // Kiểm tra xem phần tử được click có thuộc vùng menu hay không
   if (!menu.contains(event.target) && !toggleMenu.contains(event.target)) {
     // Xóa class "current" khỏi menu khi click ra ngoài vùng menu
     menu.classList.remove("current");
   }
 });

 var swatchElements = document.getElementsByClassName("swatch-element");

 // Lặp qua từng phần tử và gắn sự kiện click cho chúng
 for (var i = 0; i < swatchElements.length; i++) {
     swatchElements[i].addEventListener("click", function() {
         // Lấy giá trị "data-value" của phần tử được nhấp vào
         var dataValue = this.getAttribute("data-value");

         // Gán giá trị vào phần tử có class "var"
         document.querySelector(".var").textContent = dataValue;
     });
 }