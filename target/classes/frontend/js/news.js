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