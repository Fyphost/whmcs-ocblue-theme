{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">

    {* Change Password *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-key me-2 text-primary"></i>{$LANG.changepassword}</h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="sub" value="changepassword">
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.currentpassword}</label>
              <input type="password" name="oldpassword" class="form-control"
                     autocomplete="current-password" required>
            </div>
            <div class="col-md-6"></div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.newpassword}</label>
              <input type="password" name="newpassword1" class="form-control"
                     autocomplete="new-password" required>
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.confirmpassword}</label>
              <input type="password" name="newpassword2" class="form-control"
                     autocomplete="new-password" required>
            </div>
            <div class="col-12">
              <button type="submit" class="btn btn-primary rounded-pill px-4">
                <i class="bi bi-check-lg me-2"></i>{$LANG.savechanges}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>

    {* Two-Factor Authentication *}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0"><i class="bi bi-shield-lock me-2 text-primary"></i>{$LANG.twofactorauth}</h5>
        {if $twofactorenabled}
          <span class="badge bg-success-subtle text-success">
            <i class="bi bi-check-circle me-1"></i>{$LANG.enabled}
          </span>
        {else}
          <span class="badge bg-secondary-subtle text-secondary">
            <i class="bi bi-x-circle me-1"></i>{$LANG.disabled}
          </span>
        {/if}
      </div>
      <div class="dashboard-card-body">
        {if $twofactorenabled}
          <form method="post" action="{$smarty.server.PHP_SELF}">
            <input type="hidden" name="sub" value="disabletwofactor">
            <p class="text-muted mb-3">{$LANG.twofactorauthenabled}</p>
            <button type="submit" class="btn btn-outline-danger rounded-pill px-4">
              <i class="bi bi-shield-x me-2"></i>{$LANG.twofactordisable}
            </button>
          </form>
        {else}
          <p class="text-muted mb-3">{$LANG.twofactorauthinfo}</p>
          <a href="{routePath('user-security-twofactor-enable')}"
             class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-shield-plus me-2"></i>{$LANG.twofactorenable}
          </a>
        {/if}
      </div>
    </div>

  </div>
</div>

{include file="$template/footer.tpl"}
