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
  <div class="login-card login-card-wide">

    {* Logo / Brand *}
    <div class="login-brand text-center mb-4">
      <a href="{$WEB_ROOT}" class="text-decoration-none">
        {if $logourl}
          <img src="{$logourl}" alt="{$companyname}" height="40" class="mb-2">
        {else}
          <div class="login-logo-icon mb-2">
            <i class="bi bi-person-plus-fill"></i>
          </div>
        {/if}
        <h1 class="login-company-name">{$companyname}</h1>
      </a>
      <p class="login-subtitle">{$LANG.createaccount}</p>
    </div>

    {* Error messages *}
    {if $errormessage}
    <div class="alert alert-danger alert-dismissible fade show mb-3" role="alert">
      <i class="bi bi-exclamation-circle me-2"></i>{$errormessage}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {/if}

    {* Registration form *}
    <form method="post" action="{$WEB_ROOT}/register.php" id="registerForm">
      <input type="hidden" name="token" value="{$token}">

      <div class="row g-3 mb-3">
        <div class="col-sm-6">
          <label for="inputFirstname" class="form-label fw-medium">{$LANG.clientareafirstname} <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="inputFirstname" name="firstname"
                 value="{$smarty.post.firstname}" required autocomplete="given-name">
        </div>
        <div class="col-sm-6">
          <label for="inputLastname" class="form-label fw-medium">{$LANG.clientarealastname} <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="inputLastname" name="lastname"
                 value="{$smarty.post.lastname}" required autocomplete="family-name">
        </div>
        <div class="col-12">
          <label for="inputEmail" class="form-label fw-medium">{$LANG.clientareaemail} <span class="text-danger">*</span></label>
          <input type="email" class="form-control" id="inputEmail" name="email"
                 value="{$smarty.post.email}" required autocomplete="email">
        </div>
        <div class="col-sm-6">
          <label for="inputPhone" class="form-label fw-medium">{$LANG.clientareaphonenumber}</label>
          <input type="tel" class="form-control" id="inputPhone" name="phonenumber"
                 value="{$smarty.post.phonenumber}" autocomplete="tel">
        </div>
        <div class="col-sm-6">
          <label for="inputCompany" class="form-label fw-medium">{$LANG.clientareacompanyname}</label>
          <input type="text" class="form-control" id="inputCompany" name="companyname"
                 value="{$smarty.post.companyname}" autocomplete="organization">
        </div>
        <div class="col-12">
          <label for="inputAddress1" class="form-label fw-medium">{$LANG.clientareaaddress1}</label>
          <input type="text" class="form-control" id="inputAddress1" name="address1"
                 value="{$smarty.post.address1}" autocomplete="address-line1">
        </div>
        <div class="col-md-6">
          <label for="inputCity" class="form-label fw-medium">{$LANG.clientareacity}</label>
          <input type="text" class="form-control" id="inputCity" name="city"
                 value="{$smarty.post.city}" autocomplete="address-level2">
        </div>
        <div class="col-md-3">
          <label for="inputState" class="form-label fw-medium">{$LANG.clientareastate}</label>
          <input type="text" class="form-control" id="inputState" name="state"
                 value="{$smarty.post.state}" autocomplete="address-level1">
        </div>
        <div class="col-md-3">
          <label for="inputPostcode" class="form-label fw-medium">{$LANG.clientareapostcode}</label>
          <input type="text" class="form-control" id="inputPostcode" name="postcode"
                 value="{$smarty.post.postcode}" autocomplete="postal-code">
        </div>
        <div class="col-12">
          <label for="country" class="form-label fw-medium">{$LANG.clientareacountry}</label>
          {$countriesdropdown}
        </div>
      </div>

      <hr class="my-3">

      <div class="row g-3 mb-3">
        <div class="col-sm-6">
          <label for="inputPassword" class="form-label fw-medium">{$LANG.clientareapassword} <span class="text-danger">*</span></label>
          <input type="password" class="form-control" id="inputPassword" name="password"
                 required autocomplete="new-password">
        </div>
        <div class="col-sm-6">
          <label for="inputConfirmPassword" class="form-label fw-medium">{$LANG.clientareaconfirmpassword} <span class="text-danger">*</span></label>
          <input type="password" class="form-control" id="inputConfirmPassword" name="password2"
                 required autocomplete="new-password">
        </div>
      </div>

      {if $captchahtml}
      <div class="mb-3">{$captchahtml}</div>
      {/if}

      {if $tos}
      <div class="form-check mb-3">
        <input class="form-check-input" type="checkbox" name="accepttos" id="acceptTos" value="1" required>
        <label class="form-check-label" for="acceptTos">
          {$LANG.clientareatosinfotext}
          <a href="{$WEB_ROOT}/tos.php" target="_blank" rel="noopener">{$LANG.clientareatos}</a>
        </label>
      </div>
      {/if}

      <button type="submit" class="btn btn-primary btn-login w-100 rounded-pill">
        <i class="bi bi-person-plus me-2"></i>{$LANG.register}
      </button>
    </form>

    <div class="login-footer text-center mt-4">
      <p class="mb-0 text-muted">
        {$LANG.alreadyregistered}
        <a href="{$WEB_ROOT}/login.php" class="register-link fw-semibold">{$LANG.login}</a>
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
