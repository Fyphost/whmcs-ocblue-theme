{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">

    {* Service overview *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <div>
          <h5 class="mb-1">{$product}</h5>
          <div class="text-muted small">{$groupname}</div>
        </div>
        <div class="d-flex align-items-center gap-2">
          {if $status eq 'Active'}
            <span class="badge badge-active">Active</span>
          {elseif $status eq 'Suspended'}
            <span class="badge badge-suspended">Suspended</span>
          {elseif $status eq 'Cancelled'}
            <span class="badge badge-cancelled">Cancelled</span>
          {else}
            <span class="badge badge-pending">{$status}</span>
          {/if}
        </div>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-3">
          {if $domain}
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.domain}</div>
            <div class="fw-medium">
              <a href="http://{$domain}" target="_blank" rel="noopener">{$domain}</a>
            </div>
          </div>
          {/if}
          {if $dedicatedip}
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.dedicatedip}</div>
            <div class="fw-medium">{$dedicatedip}</div>
          </div>
          {/if}
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.billingcycle}</div>
            <div class="fw-medium">{$billingcycle}</div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.nextduedate}</div>
            <div class="fw-medium">{$nextduedate}</div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.recurringamount}</div>
            <div class="fw-medium">{$recurringamount}</div>
          </div>
          {if $diskusage or $bwusage}
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.diskUsage}</div>
            <div class="fw-medium">{$diskusage} / {$disklimit}</div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.bandwidthUsage}</div>
            <div class="fw-medium">{$bwusage} / {$bwlimit}</div>
          </div>
          {/if}
        </div>
      </div>
    </div>

    {* Control panel login if available *}
    {if $serviceloginlink}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-body text-center">
        <a href="{$serviceloginlink}" target="_blank" rel="noopener"
           class="btn btn-primary rounded-pill px-5">
          <i class="bi bi-box-arrow-up-right me-2"></i>{$LANG.logintocontrolpanel}
        </a>
      </div>
    </div>
    {/if}

    {* Custom buttons *}
    {if $customfields}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-info-circle me-2 text-primary"></i>{$LANG.customfields}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-3">
          {foreach from=$customfields item=field}
          {if $field.value}
          <div class="col-md-6">
            <div class="text-muted small">{$field.name}</div>
            <div class="fw-medium">{$field.value}</div>
          </div>
          {/if}
          {/foreach}
        </div>
      </div>
    </div>
    {/if}

    {* Module output *}
    {if $moduleoutput}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-body">
        {$moduleoutput}
      </div>
    </div>
    {/if}

    {* Actions *}
    <div class="d-flex flex-wrap gap-2 animate-on-scroll">
      {if $status eq 'Active' and $cancellationrequestpossible}
      <a href="{$WEB_ROOT}/clientarea.php?action=cancel&id={$serviceid}"
         class="btn btn-outline-danger rounded-pill px-4">
        <i class="bi bi-x-circle me-2"></i>{$LANG.requestcancellation}
      </a>
      {/if}
      {if $upgradelink}
      <a href="{$upgradelink}" class="btn btn-outline-primary rounded-pill px-4">
        <i class="bi bi-arrow-up-circle me-2"></i>{$LANG.upgradeproduct}
      </a>
      {/if}
    </div>

  </div>
</div>

{include file="$template/footer.tpl"}
