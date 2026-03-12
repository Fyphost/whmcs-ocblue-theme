{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-5 col-md-7">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header text-center">
        <h5 class="mb-0"><i class="bi bi-key me-2 text-primary"></i>{$LANG.passwordreset}</h5>
      </div>
      <div class="dashboard-card-body">
        <p class="text-muted text-center mb-4">{$LANG.passwordresetchangedesc}</p>
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="token" value="{$token}">
          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.newpassword}</label>
            <input type="password" name="newpassword1" class="form-control" required
                   placeholder="{$LANG.newpassword}">
          </div>
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.confirmpassword}</label>
            <input type="password" name="newpassword2" class="form-control" required
                   placeholder="{$LANG.confirmpassword}">
          </div>
          <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-lg rounded-pill">
              <i class="bi bi-check-lg me-2"></i>{$LANG.passwordresetsubmit}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
