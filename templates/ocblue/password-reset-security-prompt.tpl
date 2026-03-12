{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-5 col-md-7">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header text-center">
        <h5 class="mb-0"><i class="bi bi-shield-lock me-2 text-primary"></i>{$LANG.passwordreset}</h5>
      </div>
      <div class="dashboard-card-body">
        <p class="text-muted text-center mb-4">{$LANG.passwordresetsecuritydesc}</p>
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="token" value="{$token}">
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.securityquestion}</label>
            <p class="fw-semibold">{$securityquestion}</p>
            <input type="text" name="securityanswer" class="form-control" required
                   placeholder="{$LANG.securityanswer}">
          </div>
          <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-lg rounded-pill">
              <i class="bi bi-check-lg me-2"></i>{$LANG.continue}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
