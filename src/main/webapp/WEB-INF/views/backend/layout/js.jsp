<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script src="${classpath}/backend/js/app.js"></script>
	<script src="${classpath}/backend/bootstrap/popper.min.js"></script>
	<script src="${classpath}/backend/bootstrap/bootstrap.min.js"></script>
	<script src="${classpath}/backend/js/custom.min.js"></script>
	<script src="${classpath}/backend/js/jquery.min.js"></script>
	<script src="${classpath}/backend/js/jquery.simplePagination.js"></script>
		<script>
		document.addEventListener("DOMContentLoaded", function() {
			var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
			var gradient = ctx.createLinearGradient(0, 0, 0, 225);
			gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
			gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
			
			var dashboardRevenue = <%= request.getAttribute("dashboardRevenue") %>;
			// Line chart
			new Chart(document.getElementById("chartjs-dashboard-line"), {
				type: "line",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "Sales (VND)",
						fill: true,
						backgroundColor: gradient,
						borderColor: window.theme.primary,
						data: dashboardRevenue
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					tooltips: {
						intersect: false
					},
					hover: {
						intersect: true
					},
					plugins: {
						filler: {
							propagate: false
						}
					},
					scales: {
						xAxes: [{
							reverse: true,
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}],
						yAxes: [{
							ticks: {
								   stepSize: 50000, // Bước giữa các mốc giá trị trên trục Y
				                    maxTicksLimit: 4, // Giới hạn số lượng mốc hiển thị trên trục Y
				                    callback: function(value, index, values) {
				                        return 'VND' + value.toLocaleString(); // Định dạng mốc giá trị hiển thị
				                    }
							},
							display: true,
							borderDash: [3, 3],
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}]
					}
				}
			});
		});
	</script>
	
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
			var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
			document.getElementById("datetimepicker-dashboard").flatpickr({
				inline: true,
				prevArrow: "<span title=\"Previous month\">&laquo;</span>",
				nextArrow: "<span title=\"Next month\">&raquo;</span>",
				defaultDate: defaultDate
			});
		});
	</script>