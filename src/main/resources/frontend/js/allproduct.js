
window.addEventListener('scroll', function() {
    var addThisListing = document.querySelector('.addThis_listing');
    var scrollPosition = window.scrollY;
  
    if (scrollPosition >= 100) {
      addThisListing.classList.add('is-show');
    } else {
      addThisListing.classList.remove('is-show');
    }
  });
  
  const btnQuickSorts = document.querySelectorAll('.btn-quick-sort');

  // Lặp qua từng phần tử và gán sự kiện click
  btnQuickSorts.forEach(btn => {
      btn.addEventListener('click', function(event) {
          event.preventDefault();

          // Xóa lớp active khỏi tất cả các phần tử .btn-quick-sort
          btnQuickSorts.forEach(btn => {
              btn.classList.remove('active');
          });

          // Thêm lớp active vào phần tử được click
          this.classList.add('active');
      });
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