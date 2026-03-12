{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-5 col-md-7">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header text-center">
        <h5 class="mb-0"><i class="bi bi-shield-lock me-2 text-primary"></i>{$LANG.twofactorauth}</h5>
      </div>
      <div class="dashboard-card-body">
        <p class="text-muted text-center mb-4">{$LANG.twofactorauthenterdesc}</p>
        <form method="post" action="{$smarty.server.PHP_SELF}">
          {if $token}<input type="hidden" name="_token" value="{$token}">{/if}
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.twofactorauthcode}</label>
            <input type="text" name="twofacode" class="form-control form-control-lg text-center font-monospace"
                   autocomplete="one-time-code" inputmode="numeric" maxlength="8"
                   placeholder="000000" autofocus required>
          </div>

          <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary btn-lg rounded-pill">
              <i class="bi bi-shield-check me-2"></i>{$LANG.twofactorverify}
            </button>
            {if $backupCodeUrl}
            <a href="{$backupCodeUrl}" class="btn btn-outline-secondary rounded-pill">
              <i class="bi bi-key me-2"></i>{$LANG.twofactorusebackupcode}
            </a>
            {/if}
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
