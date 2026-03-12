{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-5 col-md-7">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header text-center">
        <h5 class="mb-0"><i class="bi bi-key me-2 text-primary"></i>{$LANG.twofactornewbackupcode}</h5>
      </div>
      <div class="dashboard-card-body text-center">
        <div class="alert alert-warning mb-4" role="alert">
          <i class="bi bi-exclamation-triangle me-2"></i>
          {$LANG.twofactornewbackupcodewarning}
        </div>

        {if $backupCode}
        <div class="mb-4">
          <div class="fs-1 fw-bold font-monospace text-primary p-3 bg-light rounded-3">
            {$backupCode}
          </div>
          <p class="text-muted small mt-2">{$LANG.twofactornewbackupcodesavehint}</p>
        </div>
        <a href="{$WEB_ROOT}/clientarea.php?action=security" class="btn btn-primary rounded-pill px-4">
          <i class="bi bi-check-lg me-2"></i>{$LANG.done}
        </a>
        {else}
        <form method="post" action="{$smarty.server.PHP_SELF}">
          {if $token}<input type="hidden" name="_token" value="{$token}">{/if}
          <button type="submit" name="generate" class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-arrow-repeat me-2"></i>{$LANG.twofactorgeneratecode}
          </button>
        </form>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
