
 const tabLinks = document.querySelectorAll('.tab-link');

 // Lặp qua từng tab link
 tabLinks.forEach(tab => {
     tab.addEventListener('click', function() {
         // Lấy giá trị data-tab của tab link hiện tại
         const currentTab = this.getAttribute('data-tab');

         // Xóa class 'current' khỏi tất cả các tab link
         tabLinks.forEach(link => {
             link.classList.remove('current');
         });

         // Thêm class 'current' vào tab link hiện tại
         this.classList.add('current');

         // Xóa class 'current' khỏi tất cả các tab content
         const tabContents = document.querySelectorAll('.tab-content');
         tabContents.forEach(content => {
             content.classList.remove('current');
         });

         // Thêm class 'current' vào tab content tương ứng với tab link hiện tại
         const currentContent = document.querySelector(`.${currentTab}`);
         currentContent.classList.add('current');
     });
 });

$('.responsive').slick({
    dots: true,
    infinite: true,
    autoPlay: true,
    speed: 1000,
    prevArrow:'<button type="button" class="slick-prev"></button>',
    nextArrow:'<button type="button" class="slick-next"></button>',
    slidesToShow: 4,
    slidesToScroll: 3,
    responsive: [
        {
          breakpoint: 1100,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1,
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1,
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
})
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