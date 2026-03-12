{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-credit-card me-2 text-primary"></i>{$pagetitle}
        </h5>
      </div>
      <div class="dashboard-card-body">
        {$form}
        <div class="d-flex flex-wrap gap-2 mt-4">
          <button type="submit" form="payMethodForm" class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-check-lg me-2"></i>{$LANG.clientareasavechanges}
          </button>
          <a href="{$WEB_ROOT}/clientarea.php?action=paymentmethods"
             class="btn btn-outline-secondary rounded-pill px-4">
            <i class="bi bi-arrow-left me-2"></i>{$LANG.clientareacancel}
          </a>
        </div>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
