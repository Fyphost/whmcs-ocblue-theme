{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0">
          <i class="bi bi-credit-card me-2 text-primary"></i>{$LANG.paymentmethods}
        </h5>
        {if $addMethodUrl}
        <a href="{$addMethodUrl}" class="btn btn-primary btn-sm rounded-pill">
          <i class="bi bi-plus-circle me-1"></i>{$LANG.paymentmethodaddnew}
        </a>
        {/if}
      </div>
      <div class="dashboard-card-body">
        {if $paymethods}
          <div class="row g-3">
            {foreach from=$paymethods item=method}
            <div class="col-md-6">
              <div class="border rounded-3 p-3 h-100">
                <div class="d-flex justify-content-between align-items-start mb-2">
                  <div>
                    <div class="fw-semibold">{$method.gateway_display_name}</div>
                    <div class="text-muted small">{$method.description}</div>
                  </div>
                  {if $method.default}
                  <span class="badge bg-primary-subtle text-primary">{$LANG.paymentmethoddefault}</span>
                  {/if}
                </div>
                <div class="d-flex flex-wrap gap-2 mt-3">
                  <a href="{$method.manageUrl}" class="btn btn-xs btn-outline-primary rounded-pill">
                    <i class="bi bi-pencil me-1"></i>{$LANG.clientareaedit}
                  </a>
                  {if !$method.default}
                  <a href="{$method.makeDefaultUrl}" class="btn btn-xs btn-outline-secondary rounded-pill">
                    <i class="bi bi-star me-1"></i>{$LANG.paymentmethodmakedefault}
                  </a>
                  {/if}
                  {if $method.billingContactsUrl}
                  <a href="{$method.billingContactsUrl}" class="btn btn-xs btn-outline-secondary rounded-pill">
                    <i class="bi bi-people me-1"></i>{$LANG.paymentmethodbillingcontacts}
                  </a>
                  {/if}
                  <a href="{$method.deleteUrl}"
                     class="btn btn-xs btn-outline-danger rounded-pill"
                     onclick="return confirm('{$LANG.paymentmethoddeleteconfirm}')">
                    <i class="bi bi-trash me-1"></i>{$LANG.delete}
                  </a>
                </div>
              </div>
            </div>
            {/foreach}
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-credit-card empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.paymentmethodnonemsg}</p>
            {if $addMethodUrl}
            <a href="{$addMethodUrl}" class="btn btn-primary btn-sm rounded-pill px-3">
              <i class="bi bi-plus-circle me-1"></i>{$LANG.paymentmethodaddnew}
            </a>
            {/if}
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
