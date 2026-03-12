{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-arrow-up-circle me-2 text-primary"></i>{$LANG.upgradeproduct}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-3 mb-4">
          {if $upgradeproducts}
          <div class="col-sm-6 col-lg-4">
            <a href="{$WEB_ROOT}/upgrade.php?type=product&id={$serviceid}"
               class="text-decoration-none">
              <div class="border rounded-3 p-3 h-100 text-center">
                <i class="bi bi-box-seam fs-2 text-primary mb-2 d-block"></i>
                <div class="fw-semibold">{$LANG.upgradeproductpackage}</div>
                <div class="text-muted small mt-1">{$LANG.upgradeproductpackagedesc}</div>
              </div>
            </a>
          </div>
          {/if}
          {if $upgradeconfigoptions}
          <div class="col-sm-6 col-lg-4">
            <a href="{$WEB_ROOT}/upgrade.php?type=configoptions&id={$serviceid}"
               class="text-decoration-none">
              <div class="border rounded-3 p-3 h-100 text-center">
                <i class="bi bi-sliders fs-2 text-primary mb-2 d-block"></i>
                <div class="fw-semibold">{$LANG.upgradeconfigoptions}</div>
                <div class="text-muted small mt-1">{$LANG.upgradeconfigoptionsdesc}</div>
              </div>
            </a>
          </div>
          {/if}
        </div>
        <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$serviceid}"
           class="btn btn-outline-secondary rounded-pill px-4">
          <i class="bi bi-arrow-left me-2"></i>{$LANG.clientareacancel}
        </a>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
