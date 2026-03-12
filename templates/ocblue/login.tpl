<!DOCTYPE html>
<html lang="{$lang}">
<head>
  {include file="$template/includes/head.tpl"}
</head>
<body class="modern-blue-theme login-page">

{* Decorative background shapes *}
<div class="login-shape login-shape-1"></div>
<div class="login-shape login-shape-2"></div>
<div class="login-shape login-shape-3"></div>

<div class="login-wrapper">
  <div class="login-card">

    {* Logo / Brand *}
    <div class="login-brand text-center mb-4">
      <a href="{$WEB_ROOT}" class="text-decoration-none">
        {if $logourl}
          <img src="{$logourl}" alt="{$companyname}" height="40" class="mb-2">
        {else}
          <div class="login-logo-icon mb-2">
            <i class="bi bi-cloud-fill"></i>
          </div>
        {/if}
        <h1 class="login-company-name">{$companyname}</h1>
      </a>
      <p class="login-subtitle">Sign in to your account</p>
    </div>

    {* Error message *}
    {if $incorrect}
    <div class="alert alert-danger alert-dismissible fade show mb-3" role="alert">
      <i class="bi bi-exclamation-circle me-2"></i>{$LANG.loginerror}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {/if}

    {* Login form *}
    <form method="post" action="{$WEB_ROOT}/dologin.php" id="loginForm">
      <input type="hidden" name="token" value="{$token}">

      <div class="form-floating mb-3">
        <input type="email" class="form-control" id="inputEmail" name="username"
               placeholder="name@example.com" required autocomplete="email">
        <label for="inputEmail"><i class="bi bi-envelope me-1"></i>Email Address</label>
      </div>

      <div class="form-floating mb-3">
        <input type="password" class="form-control" id="inputPassword" name="password"
               placeholder="Password" required autocomplete="current-password">
        <label for="inputPassword"><i class="bi bi-lock me-1"></i>Password</label>
      </div>

      <div class="d-flex justify-content-between align-items-center mb-4">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" name="rememberme" id="rememberMe" value="on">
          <label class="form-check-label" for="rememberMe">Remember me</label>
        </div>
        <a href="{$WEB_ROOT}/password/reset" class="forgot-link">{$LANG.forgotpw}</a>
      </div>

      <button type="submit" class="btn btn-primary btn-login w-100 rounded-pill">
        <i class="bi bi-box-arrow-in-right me-2"></i>{$LANG.login}
      </button>
    </form>

    <div class="login-footer text-center mt-4">
      <p class="mb-0 text-muted">
        Don't have an account?
        <a href="{$WEB_ROOT}/register.php" class="register-link fw-semibold">{$LANG.register}</a>
      </p>
      <a href="{$WEB_ROOT}" class="back-home mt-2 d-inline-block">
        <i class="bi bi-arrow-left me-1"></i>Back to home
      </a>
    </div>

  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/theme.js"></script>
</body>
</html>
