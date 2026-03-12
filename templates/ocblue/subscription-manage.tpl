{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0"><i class="bi bi-arrow-repeat me-2 text-primary"></i>{$LANG.subscriptionmanage}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $subscription}
          <div class="row g-3 mb-4">
            <div class="col-sm-6 col-md-4">
              <div class="text-muted small">{$LANG.subscriptiondescription}</div>
              <div class="fw-medium">{$subscription.description}</div>
            </div>
            <div class="col-sm-6 col-md-4">
              <div class="text-muted small">{$LANG.subscriptionamount}</div>
              <div class="fw-medium">{$subscription.amount}</div>
            </div>
            <div class="col-sm-6 col-md-4">
              <div class="text-muted small">{$LANG.subscriptioncycle}</div>
              <div class="fw-medium">{$subscription.billingcycle}</div>
            </div>
            <div class="col-sm-6 col-md-4">
              <div class="text-muted small">{$LANG.subscriptionnextdue}</div>
              <div class="fw-medium">{$subscription.nextduedate}</div>
            </div>
            <div class="col-sm-6 col-md-4">
              <div class="text-muted small">{$LANG.status}</div>
              <div class="fw-medium">
                {if $subscription.status eq 'Active'}
                  <span class="badge badge-active">{$subscription.status}</span>
                {else}
                  <span class="badge bg-secondary">{$subscription.status}</span>
                {/if}
              </div>
            </div>
          </div>

          <form method="post" action="{$smarty.server.PHP_SELF}">
            <input type="hidden" name="subscriptionid" value="{$subscription.id}">
            <button type="submit" name="cancel"
                    class="btn btn-outline-danger rounded-pill px-4"
                    onclick="return confirm('{$LANG.subscriptioncancelconfirm}')">
              <i class="bi bi-x-circle me-2"></i>{$LANG.subscriptioncancel}
            </button>
          </form>
        {else}
          <div class="empty-state">
            <i class="bi bi-arrow-repeat empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.subscriptionnone}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
