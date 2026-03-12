{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-key me-2 text-primary"></i>{$LANG.changepassword}</h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <div class="row g-3 mw-md-500">
            <div class="col-12">
              <label class="form-label fw-medium">{$LANG.currentpassword}</label>
              <input type="password" name="oldpassword" class="form-control"
                     autocomplete="current-password" required>
            </div>
            <div class="col-12">
              <label class="form-label fw-medium">{$LANG.newpassword}</label>
              <input type="password" name="newpassword1" class="form-control"
                     autocomplete="new-password" required>
            </div>
            <div class="col-12">
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
  </div>
</div>

{include file="$template/footer.tpl"}
