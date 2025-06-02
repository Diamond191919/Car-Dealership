<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <jsp:include page="/common/home-head.jsp"/>
</head>
<body>

  <header>
    <jsp:include page="/common/header.jsp"/>
  </header>

  <!-- Login Modal -->
  <div class="modal fade" id="login-modal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content border-0 shadow">
        <div class="custom-modal-content">
          <!-- Left side with car image -->
          <div class="modal-image">
            <img src="/static/img/login/car_login.png" alt="Luxury car interior">
            <div class="image-overlay">
              <h2>Trải nghiệm dịch vụ xe sang</h2>
              <p>Đăng nhập để quản lý xe và đặt lịch bảo dưỡng</p>
            </div>
          </div>
          <!-- Right side with login form -->
          <div class="modal-form">
            <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close">×</button>
            <div class="form-header">
              <span class="logo-text"><span style="color:#FF7A00;">Garage</span><span style="color:#fff;">Pro</span></span>
              <h3>Đăng nhập</h3>
            </div>

            <form action="/navigate/login" method="post">
              <div class="form-group mb-4 floating-label-group">
                <input type="email" class="form-control rounded-3" id="loginEmail" name="typeEmail" placeholder=" " required>
                <label for="loginEmail">Email</label>
                <i class="bi bi-envelope position-absolute top-50 end-0 translate-middle-y me-3"></i>
              </div>

              <div class="form-group mb-4 floating-label-group">
                <input type="password" class="form-control rounded-3" id="loginPasswordModal" name="typePassword" placeholder=" " required>
                <label for="loginPasswordModal">Password</label>
                <i class="bi bi-lock position-absolute top-50 end-0 translate-middle-y me-3"></i>
              </div>

              <div class="form-group mb-4 floating-label-group">
                <select class="form-select rounded-3" id="loginRole" name="typeRole" required placeholder=" ">
                  <option value="">Chọn vai trò</option>
                  <option value="Admin">Admin</option>
                  <option value="Customer">Customer</option>
                  <option value="Mechanic">Mechanic</option>
                  <option value="Sale">Sale</option>
                </select>
              </div>

              <div class="d-flex justify-content-between mb-4">
                <div class="form-check">
                  <input type="checkbox" class="form-check-input" id="rememberMeModal">
                  <label class="form-check-label" for="rememberMeModal">Lưu mật khẩu</label>
                </div>
                <a href="#" class="text-decoration-none">Quên mật khẩu?</a>
              </div>

              <button type="submit" name="action" value="LoginSession" class="btn btn-primary w-100 py-2 rounded-3">
                Đăng nhập
              </button>
            </form>

            <div class="text-center mt-4">
              <span>Bạn chưa có tài khoản? </span>
              <a href="" class="text-decoration-none" data-bs-toggle="modal"
                 data-bs-target="#register-modal" data-bs-dismiss="modal">Đăng ký ngay</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- Register Modal -->
  <div class="modal fade" id="register-modal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content border-0 shadow">
            <div class="custom-modal-content">
                <div class="modal-image">
                    <img src="/static/img/login/car_login.png" alt="Registration illustration">
                    <div class="image-overlay">
                        <h4>Tham gia cộng đồng GaragePro</h4>
                        <p>Đăng ký để trải nghiệm các tính năng tuyệt vời</p>
                    </div>
                </div>
                <div class="modal-form">
                    <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close">×</button>
                    <div class="form-header">
                        <span class="logo-text"><span style="color:#FF7A00;">Garage</span><span
                                style="color:#fff;">Pro</span></span>
                        <h3>Đăng ký</h3>
                    </div>
                    <form action="register" method="post">
                        <div class="form-group mb-4 floating-label-group">
                            <input type="text" class="form-control rounded-3" id="registerFullName" name="fullName"
                                placeholder=" " required>
                            <label for="registerFullName">Họ và tên</label>
                            <i class="bi bi-person position-absolute top-50 end-0 translate-middle-y me-3"></i>
                        </div>
                        <div class="form-group mb-4 floating-label-group">
                            <input type="email" class="form-control rounded-3" id="registerEmail" name="email"
                                placeholder=" " required>
                            <label for="registerEmail">Email</label>
                            <i class="bi bi-envelope position-absolute top-50 end-0 translate-middle-y me-3"></i>
                        </div>
                        <div class="form-group mb-4 floating-label-group">
                            <input type="tel" class="form-control rounded-3" id="registerPhone" name="phone"
                                placeholder=" " required>
                            <label for="registerPhone">Số điện thoại</label>
                            <i class="bi bi-phone position-absolute top-50 end-0 translate-middle-y me-3"></i>
                        </div>
                        <div class="form-group mb-4 floating-label-group">
                            <input type="password" class="form-control rounded-3" id="registerPassword"
                                name="password" placeholder=" " required>
                            <label for="registerPassword">Mật khẩu</label>
                            <i class="bi bi-lock position-absolute top-50 end-0 translate-middle-y me-3"></i>
                        </div>
                        <div class="form-group mb-4 floating-label-group">
                            <input type="password" class="form-control rounded-3" id="registerConfirmPassword"
                                name="confirmPassword" placeholder=" " required>
                            <label for="registerConfirmPassword">Xác nhận mật khẩu</label>
                            <i class="bi bi-lock position-absolute top-50 end-0 translate-middle-y me-3"></i>
                        </div>
                        <button type="submit" name="action" value="RegisterUser" class="btn btn-primary w-100 py-2 rounded-3">Đăng
                            ký</button>
                    </form>
                    <div class="text-center mt-4">
                        <span>Bạn đã có tài khoản? </span>
                        <a href="#" class="text-decoration-none" data-bs-toggle="modal"
                            data-bs-target="#login-modal" data-bs-dismiss="modal">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

  <!-- Hero Banner -->
  <section id="hero" class="hero">
    <div class="hero-overlay"></div>
    <div class="container hero-content">
        <div class="hero-text">
            <h1 class="fade-in">Trải nghiệm xe hạng sang</h1>
            <p class="fade-in">Khám phá dịch vụ mua bán, sửa chữa, bảo dưỡng ô tô chuyên nghiệp.</p>
            <a href="/templates/viewAllCar_ver02.html" class="btn-hero-cta">Khám phá ngay</a>
        </div>
        <div class="hero-image">
            <img src="/static/img/car/aston-nartin.jpg" alt="Premium Car" class="scale-effect" />
        </div>
    </div>
</section>

  <!-- Giới thiệu -->
  <section id="about" class="py-5">
    <div class="container">
      <div class="title-wrapper">
        <h2 class="text-center custom-mb-5">Dịch Vụ Của Chúng Tôi</h2>
      </div>
      <div class="row g-4">
        <div class="col-md-4">
          <div class="service-card card h-500">
            <img src="/static/img/about/professional_repair.png" class="card-img-top" alt="Sửa Chữa Chuyên Nghiệp">
            <div class="card-body">
              <h5 class="card-title">Sửa Chữa</h5>
              <p class="card-text">Chẩn đoán và sửa chữa chuyên nghiệp cho tất cả các loại xe.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="service-card card h-500">
            <img src="/static/img/about/periodic_maintenance.png" class="card-img-top" alt="Bảo Dưỡng Định Kỳ">
            <div class="card-body">
              <h5 class="card-title">Bảo Dưỡng Định Kỳ</h5>
              <p class="card-text">Bảo dưỡng định kỳ, xe bạn luôn trong tình trạng tốt nhất.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="service-card card h-500">
            <img src="/static/img/about/genuine_parts.png" class="card-img-top" alt="Phụ Tùng Chính Hãng">
            <div class="card-body">
              <h5 class="card-title">Phụ Tùng Chính Hãng</h5>
              <p class="card-text">Phụ tùng thay thế chính hãng, chất lượng hàng đầu.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


  <!-- Dịch vụ -->
  <section id="service" class="services">
    <div class="container">
      <h2 class="custom-mb-5">Các Loại Dịch Vụ</h2>
      <div class="services-grid">
        <!-- 4 card mỗi hàng -->
        <div class="service-card">
          <div class="service-icon">
            <img src="/static/img/service/buy_sell.png" alt="Sale Icon" />
          </div>
          <h3>Mua Bán Xe</h3>
          <p>Mua bán xe mới & cũ với thủ tục nhanh gọn, giá cả minh bạch.</p>
        </div>
        <div class="service-card">
          <div class="service-icon">
            <img src="/static/img/service/repair.png" alt="Repair Icon" />
          </div>
          <h3>Sửa Chữa</h3>
          <p>Dịch vụ toàn diện, sửa chữa toàn diện, khắc phục mọi vấn đề.</p>
        </div>
        <div class="service-card">
          <div class="service-icon">
            <img src="/static/img/service/square_part.png" alt="Parts Icon" />
          </div>
          <h3>Thay Thế Phụ Tùng</h3>
          <p>Phụ tùng chính hãng, đảm bảo chất lượng và độ bền.</p>
        </div>
        <div class="service-card">
          <div class="service-icon">
            <img src="/static/img/service/financial.png" alt="Finance Icon" />
          </div>
          <h3>Tư Vấn Tài Chính</h3>
          <p>Hỗ trợ trả góp, vay mua xe với lãi suất ưu đãi.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Xe Nổi Bật -->
  <section id="car" class="featured-cars">
    <div class="container">
      <h2 class="custom-mb-5">Xe Nổi Bật</h2>
      <!-- Bootstrap Carousel -->
      <div id="carsCarousel" class="carousel slide" data-bs-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="d-flex justify-content-evenly">
              <div class="car-card">
                <img src="/static/img/car/Honda-CR-V_2020.jpg" alt="Honda CR-V 2020">
                <h3>Honda CR-V</h3>
                <p>Năm: 2020 | Giá: <span class="price">680,000,000₫</span></p>
                <a href="#" class="car-detail-link">Xem chi tiết</a>
              </div>
              <div class="car-card">
                <img src="/static/img/car/Toyota-Camry-2021.jpg" alt="Toyota Camry 2021">
                <h3>Toyota Camry</h3>
                <p>Năm: 2021 | Giá: <span class="price">750,000,000₫</span></p>
                <a href="#" class="car-detail-link">Xem chi tiết</a>
              </div>
              <div class="car-card">
                <img src="/static/img/car/Mercedes-BenzC200_exclusive 2020.jpg" alt="Mercedes Benz C200 Exclusive 2020">
                <h3>Mercedes C200</h3>
                <p>Năm: 2019 | Giá: <span class="price">1,100,000,000₫</span></p>
                <a href="#" class="car-detail-link">Xem chi tiết</a>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="d-flex justify-content-evenly">
              <div class="car-card">
                <img src="/static/img/car/maybach_2018.jpg" alt="Mercedes-Maybach S-Class">
                <h3>Mercedes-Maybach S-Class</h3>
                <p>Năm: 2018 | Giá: <span class="price">3,699,000,000₫</span></p>
                <a href="#" class="car-detail-link">Xem chi tiết</a>
              </div>
              <div class="car-card">
                <img src="/static/img/car/Bentley-Continental_2007.jpg" alt="Bentley-Continental 2007">
                <h3>Bentley-Continental 2007</h3>
                <p>Năm: 2007 | Giá: <span class="price">4,200,000,000₫</span></p>
                <a href="#" class="car-detail-link">Xem chi tiết</a>
              </div>
              <div class="car-card">
                <img src="/static/img/car/range_rover_vogue_LWB.jpg" alt="rolls-royce-ghost">
                <h3>Range Rover LWB</h3>
                <p>Năm: 2019 | Giá: <span class="price">5,950,000,000₫</span></p>
                <a href="#" class="car-detail-link">Xem chi tiết</a>
              </div>
            </div>
          </div>
        </div>
        <!-- Controls -->
        <button class="carousel-control-prev" type="button" data-bs-target="#carsCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carsCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <a href="/templates/viewAllCar_ver02.html" class="btn-viewall">Xem tất cả</a>
    </div>
  </section>


  <!-- Đánh Giá Khách Hàng -->
  <section id="reviews" class="testimonials">
    <div class="container">
      <h2 class="custom-mb-5">Khách Hàng Nói Gì?</h2>
      <div class="testimonials-list">
        <div class="testimonial-card">
          <div class="testimonial-img">
            <img src="/static/img/customer/nguyenvanA.png" alt="Customer 1" />
          </div>
          <p>“Dịch vụ tuyệt vời, nhân viên nhiệt tình, mua xe cũ mà chất lượng như mới!”</p>
          <div class="stars">★★★★★</div>
          <div class="author">- Nguyễn Văn A</div>
        </div>
        <div class="testimonial-card">
          <div class="testimonial-img">
            <img src="/static/img/customer/tranthiB.png" alt="Customer 2" />
          </div>
          <p>“Bảo dưỡng rất chuyên nghiệp, hỗ trợ 24/7, mình rất an tâm.”</p>
          <div class="stars">★★★★★</div>
          <div class="author">- Trần Thị B</div>
        </div>
        <div class="testimonial-card">
          <div class="testimonial-img">
            <img src="/static/img/customer/lethiC.png" alt="Customer 3" />
          </div>
          <p>“Xe đẹp, giá cả hợp lý, thủ tục nhanh gọn. Tôi rất hài lòng!”</p>
          <div class="stars">★★★★★</div>
          <div class="author">- Lê Thị C</div>
        </div>
        <div class="testimonial-card">
          <div class="testimonial-img">
            <img src="/static/img/customer/phamvanD.png" alt="Customer 4" />
          </div>
          <p>“Nhân viên tư vấn rất nhiệt tình, giúp tôi chọn được chiếc xe ưng ý.”</p>
          <div class="stars">★★★★★</div>
          <div class="author">- Phạm Văn D</div>
        </div>
      </div>
    </div>
  </section>


  <!-- CTA Cuối Trang -->
  <section id="contact" class="cta-section">
    <div class="container cta-content">
      <h2>Sẵn sàng trải nghiệm dịch vụ tốt nhất?</h2>
      <a href="#" class="btn-cta-white">Liên hệ ngay <span>→</span></a>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="/common/footer.jsp"/>

  <button id="backToTopBtn" class="back-to-top">↑</button>

  <!-- Script -->
  <jsp:include page="/common/script.jsp"/>
</body>

</html>