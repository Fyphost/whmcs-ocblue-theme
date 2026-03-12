{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-6 col-md-8">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header text-center">
        <h5 class="mb-0"><i class="bi bi-people me-2 text-primary"></i>{$LANG.affiliatesignup}</h5>
      </div>
      <div class="dashboard-card-body">
        <p class="text-muted text-center mb-4">{$LANG.affiliatesignupdesc}</p>
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <div class="d-grid gap-2">
            <button type="submit" name="signup" class="btn btn-primary btn-lg rounded-pill">
              <i class="bi bi-person-check me-2"></i>{$LANG.affiliatesignupbtn}
            </button>
            <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-outline-secondary rounded-pill">
              <i class="bi bi-arrow-left me-2"></i>{$LANG.clientareacancel}
            </a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
