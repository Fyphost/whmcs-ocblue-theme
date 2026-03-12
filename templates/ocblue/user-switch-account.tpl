{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-arrow-left-right me-2 text-primary"></i>{$LANG.userswitchaccount}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $accounts}
          <p class="text-muted mb-4">{$LANG.userswitchaccountdesc}</p>
          <form method="post" action="{$smarty.server.PHP_SELF}">
            <div class="row g-3 mb-4">
              {foreach from=$accounts item=account}
              <div class="col-md-6">
                <div class="border rounded-3 p-3 h-100 d-flex align-items-center gap-3">
                  <div class="flex-grow-1">
                    <div class="fw-semibold">{$account.companyname}</div>
                    <div class="text-muted small">{$account.email}</div>
                  </div>
                  <a href="{$WEB_ROOT}/clientarea.php?action=switch&accountid={$account.id}"
                     class="btn btn-sm btn-primary rounded-pill flex-shrink-0">
                    <i class="bi bi-arrow-right me-1"></i>{$LANG.userswitchnow}
                  </a>
                </div>
              </div>
              {/foreach}
            </div>
          </form>
        {else}
          <div class="empty-state">
            <i class="bi bi-arrow-left-right empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.userswitchaccountnone}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
