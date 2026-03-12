{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-wallet2 me-2 text-primary"></i>{$LANG.addfunds}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-4 align-items-start">
          <div class="col-md-6">
            <div class="border rounded-3 p-3 mb-4 bg-light-subtle">
              <div class="text-muted small mb-1">{$LANG.creditbalance}</div>
              <div class="fs-3 fw-bold text-primary">{$creditbalance}</div>
            </div>
            <form method="post" action="{$smarty.server.PHP_SELF}">
              <div class="mb-3">
                <label class="form-label fw-medium">{$LANG.addfundsamount}</label>
                <div class="input-group">
                  <span class="input-group-text">{$currency.prefix}</span>
                  <input type="number" name="amount" step="0.01" min="{$minpay}" max="{$maxpay}"
                         class="form-control" placeholder="0.00" required>
                  <span class="input-group-text">{$currency.suffix}</span>
                </div>
                {if $minpay}
                <div class="form-text">{$LANG.minimumpayment}: {$currency.prefix}{$minpay}{$currency.suffix}</div>
                {/if}
              </div>
              <div class="mb-3">
                <label class="form-label fw-medium">{$LANG.orderpaymentmethod}</label>
                {$gatewaydropdown}
              </div>
              <button type="submit" class="btn btn-primary rounded-pill px-4">
                <i class="bi bi-plus-circle me-2"></i>{$LANG.addfundsaddbutton}
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
