<%@ Page Title="" Language="C#" MasterPageFile="~/PublicPages/Public.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Restaurent_Management_System_G3.PublicPages.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Custom Styling -->
    <style>
        body {
        background-color: #f6f6f6;
        }
        .carousel-img-overlay {
            height: 100vh;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .carousel-img-overlay::before {
            content: "";
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* dark overlay */
            z-index: 1;
        }

        .carousel-caption-center {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 2;
            text-align: center;
            max-width: 90%;
        }
        .btn-custom {
            background: linear-gradient(to right, #7B1E23, #eab926);
            border: none;
            color: #1f1f1f;
            transition: 0.3s ease-in-out;
        }

        .btn-custom:hover {
            background: linear-gradient(to right, #eab926, #7B1E23);
            color: black;
            transform: scale(1.05);
        }

        section {
            border-radius: 20px;
        }
    </style>
    
    <!-- Carousel Banner -->
    <div id="restaurantCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2000">
        <div class="carousel-inner">
          <!-- Slide 1 -->
          <div class="carousel-item active">
            <div class="carousel-img-overlay" style="background-image: url('../images/slide1.jpg');">
              <div class="carousel-caption-center">
                <h1 class="display-3 fw-bold text-white" style="font-family: 'Georgia', serif;">Where Every Bite Tells a Story</h1>
                <p class="lead text-white" style="font-family: 'Georgia', serif;">Welcome to our restaurant — where tradition meets taste. <br />
                    We serve a variety of delicious dishes made with fresh ingredients and timeless recipes.</p>
                <asp:HyperLink ID="HyperLink1" CssClass ="btn mt-3 text-light rounded-pill fw-bold" style="background-color: #75270f" runat="server" NavigateUrl="MenuPage.aspx">Explore Our Menu</asp:HyperLink>  
              </div>
            </div>
          </div>
          <!-- Slide 2 -->
          <div class="carousel-item">
            <div class="carousel-img-overlay" style="background-image: url('../images/slide4.jpg');">
              <div class="carousel-caption-center">
                <h1 class="display-3 fw-bold text-white" style="font-family: 'Georgia', serif;">A Place to Relax and Dine in Style</h1>
                <p class="lead text-white" style="font-family: 'Georgia', serif;">Enjoy your meals in a cozy, elegant space designed for comfort and great conversations.<br /> 
                    Perfect for families, friends, and food lovers.</p>
                <asp:HyperLink ID="HyperLink2" CssClass ="btn mt-3 text-light rounded-pill  fw-bold" style="background-color: #75270f" runat="server" NavigateUrl="MenuPage.aspx">Explore Our Menu</asp:HyperLink>
              </div>
            </div>
          </div>
        </div>
        <!-- Carousel Controls -->
        <button class="carousel-control-prev" type="button" data-bs-target="#restaurantCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#restaurantCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <!-- About Section -->
    <div class="container">
        <section id="about" class="about section py-5 bg-light">
            <!-- Section Title -->
            <div class="container text-center mb-5" data-aos="fade-up">
                <h2 class="fw-bold">Discover Our Story</h2>
                <p class="text-muted">Crafting memorable dining experiences through passion, dedication, and excellence in service.</p>
            </div>
            <!-- End Section Title -->
            <!-- Content -->
            <div class="container" data-aos="fade-up" data-aos-delay="100">
                <div class="row g-5 align-items-center">

                    <!-- Left Content -->
                    <div class="col-lg-6">
                        <div class="about-content">
                            <h2 class="fw-bold mb-3">Experience Our Unique Approach</h2>
                            <p class="fst-italic text-muted">Welcome to our restaurant — where tradition meets taste.  
                                We serve a variety of delicious dishes made with fresh ingredients and timeless recipes.</p>
                            <p class="text-muted">At our restaurant, every meal is crafted to bring comfort and joy. From classic favorites to unique specialties, 
                                we combine authentic flavors with a modern touch, ensuring that every visit is a memorable dining experience.</p>

                            <!-- Features -->
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="feature-item p-3 rounded shadow-sm bg-white h-100" data-aos="fade-up" data-aos-delay="150">
                                    <i class="bi bi-award text-danger fs-2 mb-2"></i>
                                    <h5 class="fw-semibold">Exceptional Service</h5>
                                    <p class="small text-muted">From the moment you step in, we ensure every detail adds to your comfort.</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="feature-item p-3 rounded shadow-sm bg-white h-100" data-aos="fade-up" data-aos-delay="200">
                                        <i class="bi bi-trophy text-danger fs-2 mb-2"></i>
                                        <h5 class="fw-semibold">Industry Recognition</h5>
                                        <p class="small text-muted">Proudly recognized for culinary excellence and hospitality leadership.</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Signature -->
                            <div class="signature mt-4 d-flex align-items-center" data-aos="fade-up" data-aos-delay="250">
                                <div>
                                    <p class="mb-1 fw-bold">Jane Smith</p>
                                    <small class="text-muted">Head of Operations</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Left Content -->

                    <!-- Right Gallery -->
                    <div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
                        <div class="about-gallery position-relative">
                            <div class="row g-3">
                                <div class="col-6">
                                    <img src="../images/slide2.jpg" class="img-fluid rounded shadow-sm" alt="Restaurant Image">
                                </div>
                                <div class="col-6">
                                    <img src="../images/slide3.jpg" class="img-fluid rounded shadow-sm" alt="Restaurant Image">
                                </div>
                                <div class="col-12 mt-3 position-relative">
                                    <img src="../images/slide4.jpg" class="img-fluid rounded shadow-sm" alt="Restaurant Image">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Right Gallery -->
                </div>
            </div>
        </section>
    </div>
    
    <!-- /About Section -->

    <!-- Why Choose Us Section -->
    <div class="container">
        <section class="py-5">
            <div class="container">
                <div class="text-center mb-5" data-aos="fade-up">
                    <h2 class="fw-bold" style="color: #301007">Why Choose Golden Fork?</h2>
                    <p class="lead">We serve more than just food — we serve experiences.</p>
                </div>
    
                <div class="row text-center">
                    <!-- Feature 1 -->
                    <div class="col-md-3 mb-4" data-aos="zoom-in" data-aos-delay="100">
                    <div class="p-4 border rounded shadow-sm h-100">
                        <i class="bi bi-basket-fill display-4 mb-3" style="color: #75270f"></i>
                        <h5 class="fw-semibold">Fresh Ingredients</h5>
                        <p class="text-muted">We use locally sourced and fresh ingredients daily.</p>
                    </div>
                    </div>

                    <!-- Feature 2 -->
                    <div class="col-md-3 mb-4" data-aos="zoom-in" data-aos-delay="200">
                    <div class="p-4 border rounded shadow-sm h-100">
                        <i class="bi bi-people-fill display-4 mb-3" style="color: #75270f"></i>
                        <h5 class="fw-semibold">Expert Chefs</h5>
                        <p class="text-muted">Our team is led by skilled chefs with a passion for flavor.</p>
                    </div>
                    </div>

                    <!-- Feature 3 -->
                    <div class="col-md-3 mb-4" data-aos="zoom-in" data-aos-delay="300">
                    <div class="p-4 border rounded shadow-sm h-100">
                        <i class="bi bi-clock-fill display-4 mb-3" style="color: #75270f"></i>
                        <h5 class="fw-semibold">Quick Service</h5>
                        <p class="text-muted">Delicious food served promptly with care.</p>
                    </div>
                    </div>

                    <!-- Feature 4 -->
                    <div class="col-md-3 mb-4" data-aos="zoom-in" data-aos-delay="400">
                    <div class="p-4 border rounded shadow-sm h-100">
                        <i class="bi bi-tree-fill	display-4 mb-3" style="color: #75270f"></i>
                        <h5 class="fw-semibold">Organic Options</h5>
                        <p class="text-muted">We offer healthy, organic, and vegan-friendly choices.</p>
                    </div>
                    </div>

                </div>
            </div>
        </section>
    </div>
    
    <!-- End of Why Choose Us Section -->

    <!-- Testimonials Section -->
    <div class="container">
        <section class="py-5">
            <div class="container">
                <h2 class="text-center mb-5 fw-bold" style="color: #9c3c1f;" data-aos="fade-up">Testimonials</h2>

                <div class="row g-4">
                    <!-- Testimonial 1 -->
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                        <div class="card shadow p-4 h-100 border-0">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://i.pravatar.cc/80?img=3" class="rounded-circle me-3" width="60" alt="Avatar">
                                <div>
                                    <h5 class="mb-0 fw-semibold" style="color: #9c3c1f;">Mohamed K.</h5>
                                    <small class="text-muted">Food Lover</small>
                                </div>
                            </div>
                            <p>"Absolutely loved the ambiance and the food! The service was quick and the staff were super friendly."</p>
                            <div class="text-warning">
                                ★★★★★
                            </div>
                        </div>
                    </div>

                    <!-- Testimonial 2 -->
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                        <div class="card shadow p-4 h-100 border-0">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://i.pravatar.cc/80?img=5" class="rounded-circle me-3" width="60" alt="Avatar">
                                <div>
                                    <h5 class="mb-0 fw-semibold" style="color: #9c3c1f;">Sarah A.</h5>
                                    <small class="text-muted">Regular Customer</small>
                                </div>
                            </div>
                            <p>"Golden Fork never disappoints. Their ingredients are always fresh, and the chefs clearly care about quality."</p>
                            <div class="text-warning">
                                ★★★★★
                            </div>
                        </div>
                    </div>

                    <!-- Testimonial 3 -->
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                        <div class="card shadow p-4 h-100 border-0">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://i.pravatar.cc/80?img=7" class="rounded-circle me-3" width="60" alt="Avatar">
                                <div>
                                    <h5 class="mb-0 fw-semibold" style="color: #9c3c1f;">John H.</h5>
                                    <small class="text-muted">Food Blogger</small>
                                </div>
                            </div>
                            <p>"Their grilled dishes are out of this world. Cozy interior, polite staff, and tasty food. Highly recommended!"</p>
                            <div class="text-warning">
                                ★★★★★
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- End of Testimonial Section -->
    <br />

     <!-- Location Section -->
    <div class="container">
        <section id="location" class="location section py-5" style="background:#f9f3f1;">
            <div class="container" data-aos="fade-up" data-aos-delay="100">
                <div class="row g-4">

                    <!-- Map -->
                    <div class="col-lg-6" data-aos="fade-right" data-aos-delay="200">
                        <div class="map-container h-100">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.684949335945!2d-73.98658242357565!3d40.75853057126168!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDDCsDQ1JzMwLjciTiA3M8KwNTknMDcuNyJX!5e0!3m2!1sen!2sus!4v1654321234567!5m2!1sen!2sus"
                                    width="100%" height="100%" style="border:0; border-radius:12px;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>

                    <!-- Info -->
                    <div class="col-lg-6" data-aos="fade-left" data-aos-delay="200">
                        <div class="bg-white shadow rounded-4 p-4 h-100 d-flex flex-column justify-content-between">
                            <!-- Header -->
                            <div class="text-center mb-4">
                                <h2 class="fw-bold" style="color:#3a1f1d;">Find Us</h2>
                                <p class="text-muted mb-0">Visit Us Today</p>
                            </div>

                            <!-- Location -->
                            <div class="d-flex align-items-start pb-3 mb-3 border-bottom">
                                <div class="me-3 text-danger fs-4">
                                    <i class="bi bi-geo-alt-fill"></i>
                                </div>
                                <div>
                                    <h5 class="fw-semibold">Our Location</h5>
                                    <p class="mb-0">123 Culinary Avenue, Manhattan, NY 10001</p>
                                </div>
                            </div>

                            <!-- Reservations -->
                            <div class="d-flex align-items-start pb-3 mb-3 border-bottom">
                                <div class="me-3 text-danger fs-4">
                                    <i class="bi bi-telephone-fill"></i>
                                </div>
                                <div>
                                    <h5 class="fw-semibold">Reservations</h5>
                                    <p class="mb-1">+1 (212) 555-7890</p>
                                    <small class="text-muted fst-italic">We recommend making reservations at least 48 hours in advance</small>
                                </div>
                            </div>

                            <!-- Hours -->
                            <div class="d-flex align-items-start pb-3 mb-3 border-bottom">
                                <div class="me-3 text-danger fs-4">
                                    <i class="bi bi-clock-fill"></i>
                                </div>
                                <div>
                                    <h5 class="fw-semibold">Hours</h5>
                                    <div class="d-flex justify-content-between small mb-1">
                                    <span>Monday - Thursday</span> <span>11:00 AM - 10:00 PM</span>
                                    </div>
                                    <div class="d-flex justify-content-between small mb-1">
                                    <span>Friday - Saturday</span> <span>11:00 AM - 11:30 PM</span>
                                    </div>
                                    <div class="d-flex justify-content-between small mb-1">
                                    <span>Sunday</span> <span>10:00 AM - 9:00 PM</span>
                                    </div>
                                    <div class="d-flex justify-content-between small">
                                    <span>Brunch Hours</span> <span>Sat &amp; Sun, 10:00 AM - 2:00 PM</span>
                                    </div>
                                </div>
                            </div>

                            <!-- CTA Buttons -->
                            <div class="d-flex gap-3">
                                <a href="#" class="btn flex-fill text-white fw-semibold py-2" style="background:#e85d25;">Make a Reservation</a>
                                <a href="#" class="btn flex-fill border fw-semibold py-2" style="color:#e85d25; border-color:#e85d25;">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    

</asp:Content>
