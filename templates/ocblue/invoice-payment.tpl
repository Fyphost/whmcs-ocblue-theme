{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-credit-card me-2 text-primary"></i>{$LANG.makepayment}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-4 align-items-center mb-4">
          <div class="col-md-6">
            <div class="text-muted small mb-1">{$LANG.invoicestotaldue}</div>
            <div class="fs-2 fw-bold text-primary">{$amounttopay}</div>
          </div>
          {if $gatewaydropdown}
          <div class="col-md-6">
            <label class="form-label fw-medium">{$LANG.orderpaymentmethod}</label>
            {$gatewaydropdown}
          </div>
          {/if}
        </div>
        <div class="payment-btn-container">
          {$paymentbutton}
        </div>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
