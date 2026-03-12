{include file="$template/header.tpl"}

{* ================================================
   HERO SECTION
   ================================================ *}
<section class="hero-section">
  {* Decorative circles *}
  <div class="hero-circle hero-circle-1"></div>
  <div class="hero-circle hero-circle-2"></div>
  <div class="hero-circle hero-circle-3"></div>

  <div class="container">
    <div class="row align-items-center min-vh-hero">
      <div class="col-lg-6 hero-content">
        <div class="hero-badge mb-3 animate-on-scroll">
          <i class="bi bi-stars me-1"></i> Trusted by 10,000+ Clients
        </div>
        <h1 class="hero-title animate-on-scroll">
          Premium Web Hosting
          <span class="gradient-text">Made Simple</span>
        </h1>
        <p class="hero-subtitle animate-on-scroll">
          Lightning-fast SSD hosting with 99.9% uptime guarantee, free SSL certificates, daily backups, and 24/7 expert support — everything you need to succeed online.
        </p>
        <div class="hero-actions d-flex flex-wrap gap-3 animate-on-scroll">
          <a href="{$WEB_ROOT}/cart.php" class="btn btn-light btn-lg rounded-pill px-4 fw-semibold">
            <i class="bi bi-rocket-takeoff me-2"></i>Get Started
          </a>
          <a href="{$WEB_ROOT}/knowledgebase.php" class="btn btn-outline-light btn-lg rounded-pill px-4">
            <i class="bi bi-book me-2"></i>Learn More
          </a>
        </div>
      </div>
      <div class="col-lg-6 text-center hero-illustration animate-on-scroll">
        <i class="bi bi-cloud-fill hero-cloud-icon"></i>
        <div class="hero-floating-cards">
          <div class="floating-stat-card">
            <i class="bi bi-speedometer2 text-primary"></i>
            <span>Ultra Fast</span>
          </div>
          <div class="floating-stat-card floating-stat-card-right">
            <i class="bi bi-shield-check text-success"></i>
            <span>Secure SSL</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

{* ================================================
   FEATURES SECTION
   ================================================ *}
<section class="features-section py-5">
  <div class="container">
    <div class="text-center mb-5 animate-on-scroll">
      <span class="section-badge">Why Choose Us</span>
      <h2 class="section-title mt-2">Everything You Need to Succeed</h2>
      <p class="section-subtitle">World-class hosting infrastructure designed for performance, security, and reliability.</p>
    </div>

    <div class="row g-4">
      <div class="col-md-4 col-sm-6 animate-on-scroll">
        <div class="feature-card">
          <div class="feature-icon-box">
            <i class="bi bi-lightning-charge-fill"></i>
          </div>
          <h4 class="feature-title">Blazing Fast</h4>
          <p class="feature-desc">NVMe SSD storage and LiteSpeed web servers deliver pages in milliseconds.</p>
        </div>
      </div>
      <div class="col-md-4 col-sm-6 animate-on-scroll">
        <div class="feature-card">
          <div class="feature-icon-box">
            <i class="bi bi-arrow-repeat"></i>
          </div>
          <h4 class="feature-title">99.9% Uptime</h4>
          <p class="feature-desc">Redundant infrastructure with real-time monitoring and automatic failover.</p>
        </div>
      </div>
      <div class="col-md-4 col-sm-6 animate-on-scroll">
        <div class="feature-card">
          <div class="feature-icon-box">
            <i class="bi bi-headset"></i>
          </div>
          <h4 class="feature-title">24/7 Support</h4>
          <p class="feature-desc">Expert support team available around the clock via live chat and tickets.</p>
        </div>
      </div>
      <div class="col-md-4 col-sm-6 animate-on-scroll">
        <div class="feature-card">
          <div class="feature-icon-box">
            <i class="bi bi-shield-lock-fill"></i>
          </div>
          <h4 class="feature-title">Free SSL</h4>
          <p class="feature-desc">Free Let's Encrypt SSL certificates with auto-renewal on all plans.</p>
        </div>
      </div>
      <div class="col-md-4 col-sm-6 animate-on-scroll">
        <div class="feature-card">
          <div class="feature-icon-box">
            <i class="bi bi-cloud-arrow-down-fill"></i>
          </div>
          <h4 class="feature-title">Daily Backups</h4>
          <p class="feature-desc">Automated daily backups with 30-day retention and one-click restore.</p>
        </div>
      </div>
      <div class="col-md-4 col-sm-6 animate-on-scroll">
        <div class="feature-card">
          <div class="feature-icon-box">
            <i class="bi bi-graph-up-arrow"></i>
          </div>
          <h4 class="feature-title">Scalable</h4>
          <p class="feature-desc">Effortlessly scale resources as your business grows — no downtime.</p>
        </div>
      </div>
    </div>
  </div>
</section>

{* ================================================
   STATS SECTION
   ================================================ *}
<section class="stats-section py-5">
  <div class="container">
    <div class="row g-4 text-center">
      <div class="col-6 col-md-3 animate-on-scroll">
        <div class="stat-number">10,000+</div>
        <div class="stat-label">Happy Clients</div>
      </div>
      <div class="col-6 col-md-3 animate-on-scroll">
        <div class="stat-number">99.9%</div>
        <div class="stat-label">Uptime Guarantee</div>
      </div>
      <div class="col-6 col-md-3 animate-on-scroll">
        <div class="stat-number">50+</div>
        <div class="stat-label">Data Centers</div>
      </div>
      <div class="col-6 col-md-3 animate-on-scroll">
        <div class="stat-number">24/7</div>
        <div class="stat-label">Expert Support</div>
      </div>
    </div>
  </div>
</section>

{* ================================================
   CTA SECTION
   ================================================ *}
<section class="cta-section py-5">
  <div class="container">
    <div class="cta-card animate-on-scroll">
      <h2 class="cta-title">Ready to Get Started?</h2>
      <p class="cta-subtitle">Join thousands of businesses that trust us with their online presence. Set up in minutes.</p>
      <a href="{$WEB_ROOT}/cart.php" class="btn btn-primary btn-lg rounded-pill px-5">
        <i class="bi bi-rocket-takeoff me-2"></i>Order Now
      </a>
    </div>
  </div>
</section>

{include file="$template/footer.tpl"}
