{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-5 col-md-7">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header text-center">
        <h5 class="mb-0"><i class="bi bi-envelope me-2 text-primary"></i>{$LANG.passwordreset}</h5>
      </div>
      <div class="dashboard-card-body">
        <p class="text-muted text-center mb-4">{$LANG.passwordresetemaildesc}</p>
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.clientareaemail}</label>
            <input type="email" name="email" class="form-control" required
                   placeholder="{$LANG.clientareaemail}" autocomplete="email">
          </div>
          <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary btn-lg rounded-pill">
              <i class="bi bi-send me-2"></i>{$LANG.passwordresetsend}
            </button>
            <a href="{$WEB_ROOT}/login.php" class="btn btn-outline-secondary rounded-pill">
              <i class="bi bi-arrow-left me-2"></i>{$LANG.login}
            </a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
