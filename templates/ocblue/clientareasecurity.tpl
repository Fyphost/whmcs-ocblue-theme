{include file="$template/header.tpl"}

<div class="row g-4">
  {* Sidebar *}
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  {* Main content *}
  <div class="col-lg-9">

    {if $successful}
    <div class="alert alert-success alert-dismissible fade show mb-3" role="alert">
      <i class="bi bi-check-circle me-2"></i>{$LANG.changessavedsuccessfully}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {/if}
    {if $errormessage}
    <div class="alert alert-danger alert-dismissible fade show mb-3" role="alert">
      <i class="bi bi-exclamation-circle me-2"></i>{$errormessage}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {/if}

    {* Change password *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-key me-2 text-primary"></i>{$LANG.changePassword}</h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="?action=security">
          <div class="row g-3">
            <div class="col-md-6">
              <label for="inputOldPassword" class="form-label fw-medium">{$LANG.currentpassword}</label>
              <input type="password" class="form-control" id="inputOldPassword"
                     name="oldpassword" autocomplete="current-password">
            </div>
            <div class="col-md-6"></div>
            <div class="col-md-6">
              <label for="inputNewPassword" class="form-label fw-medium">{$LANG.newpassword}</label>
              <input type="password" class="form-control" id="inputNewPassword"
                     name="newpassword1" autocomplete="new-password">
            </div>
            <div class="col-md-6">
              <label for="inputConfirmPassword" class="form-label fw-medium">{$LANG.confirmpassword}</label>
              <input type="password" class="form-control" id="inputConfirmPassword"
                     name="newpassword2" autocomplete="new-password">
            </div>
          </div>
          <div class="mt-3">
            <button type="submit" name="savePassword" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-lock me-2"></i>{$LANG.savechanges}
            </button>
          </div>
        </form>
      </div>
    </div>

    {* Two-factor authentication *}
    {if $twofactorEnabled}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-shield-lock me-2 text-primary"></i>{$LANG.twofactorauth}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="d-flex align-items-center justify-content-between flex-wrap gap-3">
          <div>
            <p class="mb-1 fw-medium">
              {if $twofactorAuthEnabled}
                <span class="badge badge-active me-2"><i class="bi bi-check-lg me-1"></i>Enabled</span>
              {else}
                <span class="badge badge-cancelled me-2">Disabled</span>
              {/if}
              Two-Factor Authentication
            </p>
            <p class="mb-0 text-muted small">
              {if $twofactorAuthEnabled}
                Your account is secured with two-factor authentication.
              {else}
                Add an extra layer of security to your account.
              {/if}
            </p>
          </div>
          <a href="{$WEB_ROOT}/index.php?rp=/security/two-factor"
             class="btn btn-sm {if $twofactorAuthEnabled}btn-outline-danger{else}btn-primary{/if} rounded-pill px-3">
            {if $twofactorAuthEnabled}
              <i class="bi bi-shield-x me-1"></i>Disable 2FA
            {else}
              <i class="bi bi-shield-check me-1"></i>Enable 2FA
            {/if}
          </a>
        </div>
      </div>
    </div>
    {/if}

  </div>{* /col-lg-9 *}
</div>{* /row *}

{include file="$template/footer.tpl"}
