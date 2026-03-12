{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-arrow-up-circle me-2 text-primary"></i>{$LANG.upgradesummary}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-3 mb-4">
          {if $newproductname}
          <div class="col-sm-6">
            <div class="text-muted small">{$LANG.upgradenewpackage}</div>
            <div class="fw-medium">{$newproductname}</div>
          </div>
          {/if}
          <div class="col-sm-6">
            <div class="text-muted small">{$LANG.upgradeproratacharge}</div>
            <div class="fw-medium fs-4 text-primary">{$proratacharge}</div>
          </div>
          {if $proratarefund}
          <div class="col-sm-6">
            <div class="text-muted small">{$LANG.upgradeproratarefund}</div>
            <div class="fw-medium text-success">{$proratarefund}</div>
          </div>
          {/if}
        </div>

        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$serviceid}">
          <input type="hidden" name="type" value="{$type}">
          <input type="hidden" name="newproductid" value="{$newproductid}">

          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.orderpaymentmethod}</label>
            {$gatewaydropdown}
          </div>

          <div class="d-flex flex-wrap gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-check-lg me-2"></i>{$LANG.upgradeconfirm}
            </button>
            <a href="{$WEB_ROOT}/upgrade.php?id={$serviceid}"
               class="btn btn-outline-secondary rounded-pill px-4">
              <i class="bi bi-arrow-left me-2"></i>{$LANG.back}
            </a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
