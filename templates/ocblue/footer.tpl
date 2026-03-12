  </div>{* /container *}
</main>{* /main-content *}

{* Mobile bottom navigation (only for logged-in clients) *}
{if $loggedin}
<nav class="mobile-bottom-nav d-lg-none" aria-label="Mobile navigation">
  <a href="{$WEB_ROOT}/clientarea.php"
     class="mobile-bottom-nav-item {if $templatefile eq 'clientareahome'}active{/if}">
    <i class="bi bi-speedometer2"></i>
    <span>Dashboard</span>
  </a>
  <a href="{$WEB_ROOT}/clientarea.php?action=services"
     class="mobile-bottom-nav-item {if $templatefile eq 'clientareaproducts'}active{/if}">
    <i class="bi bi-server"></i>
    <span>Services</span>
  </a>
  <a href="{$WEB_ROOT}/clientarea.php?action=invoices"
     class="mobile-bottom-nav-item {if $templatefile eq 'clientareainvoices'}active{/if}">
    <i class="bi bi-receipt"></i>
    <span>Billing</span>
  </a>
  <a href="{$WEB_ROOT}/supporttickets.php"
     class="mobile-bottom-nav-item {if $templatefile eq 'supportticketslist'}active{/if}">
    <i class="bi bi-headset"></i>
    <span>Support</span>
  </a>
  <a href="{$WEB_ROOT}/clientarea.php?action=details"
     class="mobile-bottom-nav-item {if $templatefile eq 'clientareadetails'}active{/if}">
    <i class="bi bi-person-circle"></i>
    <span>Account</span>
  </a>
</nav>
{/if}

{* Footer *}
<footer class="site-footer">
  <div class="container">
    <div class="row gy-4">

      {* Brand column *}
      <div class="col-lg-3 col-md-6">
        <div class="footer-brand">
          <a href="{$WEB_ROOT}" class="footer-logo">
            {if $logourl}
              <img src="{$logourl}" alt="{$companyname}" height="32">
            {else}
              <i class="bi bi-cloud-fill me-2"></i>{$companyname}
            {/if}
          </a>
        </div>
        <p class="footer-description mt-3">
          Premium web hosting solutions with blazing fast speeds, 99.9% uptime guarantee, and world-class support.
        </p>
        <div class="footer-social mt-3 d-flex gap-2">
          <a href="#" class="social-icon" title="Facebook"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social-icon" title="Twitter"><i class="fab fa-x-twitter"></i></a>
          <a href="#" class="social-icon" title="Instagram"><i class="fab fa-instagram"></i></a>
          <a href="#" class="social-icon" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
        </div>
      </div>

      {* Quick Links *}
      <div class="col-lg-3 col-md-6">
        <h5 class="footer-heading">Quick Links</h5>
        <ul class="footer-links list-unstyled">
          <li><a href="{$WEB_ROOT}"><i class="bi bi-chevron-right me-1"></i>Home</a></li>
          <li><a href="{$WEB_ROOT}/cart.php"><i class="bi bi-chevron-right me-1"></i>Order Hosting</a></li>
          <li><a href="{$WEB_ROOT}/clientarea.php"><i class="bi bi-chevron-right me-1"></i>Client Area</a></li>
          <li><a href="{$WEB_ROOT}/announcements.php"><i class="bi bi-chevron-right me-1"></i>Announcements</a></li>
          <li><a href="{$WEB_ROOT}/knowledgebase.php"><i class="bi bi-chevron-right me-1"></i>Knowledgebase</a></li>
        </ul>
      </div>

      {* Support *}
      <div class="col-lg-3 col-md-6">
        <h5 class="footer-heading">Support</h5>
        <ul class="footer-links list-unstyled">
          <li><a href="{$WEB_ROOT}/supporttickets.php"><i class="bi bi-chevron-right me-1"></i>Submit Ticket</a></li>
          <li><a href="{$WEB_ROOT}/knowledgebase.php"><i class="bi bi-chevron-right me-1"></i>Help Center</a></li>
          <li><a href="{$WEB_ROOT}/serverstatus.php"><i class="bi bi-chevron-right me-1"></i>Server Status</a></li>
          <li><a href="{$WEB_ROOT}/contact.php"><i class="bi bi-chevron-right me-1"></i>Contact Us</a></li>
        </ul>
      </div>

      {* Contact info *}
      <div class="col-lg-3 col-md-6">
        <h5 class="footer-heading">Contact</h5>
        <ul class="footer-contact list-unstyled">
          {if $contactdetails.address1}
          <li>
            <i class="bi bi-geo-alt me-2"></i>
            {$contactdetails.address1}, {$contactdetails.city}
          </li>
          {/if}
          {if $contactdetails.phone}
          <li>
            <i class="bi bi-telephone me-2"></i>
            <a href="tel:{$contactdetails.phone}">{$contactdetails.phone}</a>
          </li>
          {/if}
          {if $contactdetails.email}
          <li>
            <i class="bi bi-envelope me-2"></i>
            <a href="mailto:{$contactdetails.email}">{$contactdetails.email}</a>
          </li>
          {/if}
        </ul>
      </div>

    </div>{* /row *}
  </div>{* /container *}

  <div class="footer-bottom">
    <div class="container d-flex flex-wrap justify-content-between align-items-center gap-2">
      <p class="mb-0 small">
        &copy; {$smarty.now|date_format:"%Y"} {$companyname}. All rights reserved.
      </p>
      <p class="mb-0 small">
        Powered by <a href="https://www.whmcs.com" target="_blank" rel="noopener">WHMCS</a>
        &nbsp;|&nbsp; Theme by <a href="https://fyphost.com" target="_blank" rel="noopener">Fyphost</a>
      </p>
    </div>
  </div>
</footer>

{* Bootstrap 5.3.2 JS *}
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
{* OC Blue Theme JS *}
<script src="{$WEB_ROOT}/templates/{$template}/js/theme.js"></script>

</body>
</html>
