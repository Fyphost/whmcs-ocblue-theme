<nav class="navbar navbar-expand-lg modern-navbar sticky-top">
  <div class="container">
    {* Brand / Logo *}
    <a class="navbar-brand" href="{$WEB_ROOT}">
      {if $logourl}
        <img src="{$logourl}" alt="{$companyname}" height="36" class="d-inline-block align-text-top">
      {else}
        <span class="brand-text"><i class="bi bi-cloud-fill me-2"></i>{$companyname}</span>
      {/if}
    </a>

    {* Mobile toggle *}
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar"
            aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="mainNavbar">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        {* Home *}
        <li class="nav-item">
          <a class="nav-link {if $templatefile eq 'index'}active{/if}" href="{$WEB_ROOT}">
            <i class="bi bi-house me-1"></i>{$LANG.navHome}
          </a>
        </li>

        {* Services dropdown *}
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle {if $templatefile eq 'clientarea' or $templatefile eq 'domainlist'}active{/if}"
             href="#" id="servicesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-grid me-1"></i>{$LANG.navServices}
          </a>
          <ul class="dropdown-menu" aria-labelledby="servicesDropdown">
            <li>
              <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=services">
                <i class="bi bi-server me-2"></i>{$LANG.navMyServices}
              </a>
            </li>
            <li>
              <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=domains">
                <i class="bi bi-globe me-2"></i>{$LANG.navMyDomains}
              </a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li>
              <a class="dropdown-item" href="{$WEB_ROOT}/cart.php">
                <i class="bi bi-cart-plus me-2"></i>Order New
              </a>
            </li>
          </ul>
        </li>

        {* Billing *}
        <li class="nav-item">
          <a class="nav-link {if $templatefile eq 'invoices' or $templatefile eq 'creditcard'}active{/if}"
             href="{$WEB_ROOT}/clientarea.php?action=invoices">
            <i class="bi bi-receipt me-1"></i>{$LANG.navBilling}
          </a>
        </li>

        {* Support *}
        <li class="nav-item">
          <a class="nav-link {if $templatefile eq 'supporttickets'}active{/if}"
             href="{$WEB_ROOT}/supporttickets.php">
            <i class="bi bi-headset me-1"></i>{$LANG.navSupport}
          </a>
        </li>
      </ul>

      {* Right side: auth *}
      <div class="navbar-right d-flex align-items-center gap-2">
        {if $loggedin}
          {* Logged-in user menu *}
          <div class="dropdown">
            <a href="#" class="nav-link dropdown-toggle d-flex align-items-center gap-2 user-menu-toggle"
               id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <span class="user-avatar">
                {$clientsdetails.firstname|truncate:1:"":true}{$clientsdetails.lastname|truncate:1:"":true}
              </span>
              <span class="d-none d-md-inline">{$clientsdetails.firstname}</span>
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
              <li class="dropdown-header">
                <strong>{$clientsdetails.firstname} {$clientsdetails.lastname}</strong>
                <div class="small text-muted">{$clientsdetails.email}</div>
              </li>
              <li><hr class="dropdown-divider"></li>
              <li>
                <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=details">
                  <i class="bi bi-person me-2"></i>{$LANG.mydetails}
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=emails">
                  <i class="bi bi-envelope me-2"></i>{$LANG.emailHistory}
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=password">
                  <i class="bi bi-lock me-2"></i>{$LANG.changePassword}
                </a>
              </li>
              <li><hr class="dropdown-divider"></li>
              <li>
                <a class="dropdown-item text-danger" href="{$WEB_ROOT}/logout.php">
                  <i class="bi bi-box-arrow-right me-2"></i>{$LANG.logout}
                </a>
              </li>
            </ul>
          </div>
        {else}
          <a href="{$WEB_ROOT}/login.php" class="btn btn-outline-primary btn-sm rounded-pill px-3">
            <i class="bi bi-person me-1"></i>{$LANG.login}
          </a>
          <a href="{$WEB_ROOT}/register.php" class="btn btn-primary btn-sm rounded-pill px-3">
            <i class="bi bi-person-plus me-1"></i>{$LANG.register}
          </a>
        {/if}
      </div>
    </div>
  </div>
</nav>
