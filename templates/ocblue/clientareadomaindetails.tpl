{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">

    {* Domain overview card *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <div class="d-flex align-items-center gap-2">
          <i class="bi bi-globe-americas fs-4 text-primary"></i>
          <div>
            <div class="fw-bold fs-5">{$domain}</div>
            {if $status eq 'Active'}
              <span class="badge badge-active">Active</span>
            {elseif $status eq 'Expired'}
              <span class="badge badge-cancelled">Expired</span>
            {elseif $status eq 'Grace'}
              <span class="badge badge-warning">Grace Period</span>
            {elseif $status eq 'Redemption'}
              <span class="badge badge-danger">Redemption</span>
            {else}
              <span class="badge badge-pending">{$status}</span>
            {/if}
          </div>
        </div>
        {if $autorenew}
        <span class="badge bg-success-subtle text-success">
          <i class="bi bi-arrow-clockwise me-1"></i>{$LANG.autorenewenabled}
        </span>
        {/if}
      </div>
      <div class="dashboard-card-body">
        <div class="row g-3">
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.domainsregistrationdate}</div>
            <div class="fw-medium">{$regdate}</div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.domainsexpirydate}</div>
            <div class="fw-medium">{$expirydate}</div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="text-muted small">{$LANG.registrar}</div>
            <div class="fw-medium">{$registrar}</div>
          </div>
        </div>
      </div>
    </div>

    {* Domain management actions *}
    <div class="row g-3 mb-4">
      {if $allowdnsmanagement}
      <div class="col-sm-6 col-lg-4">
        <a href="{$WEB_ROOT}/clientarea.php?action=domaindns&id={$domainid}"
           class="domain-action-card text-decoration-none animate-on-scroll">
          <div class="border rounded-3 p-3 text-center h-100 d-flex flex-column align-items-center justify-content-center gap-2">
            <i class="bi bi-hdd-network fs-2 text-primary"></i>
            <div class="fw-semibold small">{$LANG.domainsDnsManagement}</div>
          </div>
        </a>
      </div>
      {/if}
      {if $allowemailforwarding}
      <div class="col-sm-6 col-lg-4">
        <a href="{$WEB_ROOT}/clientarea.php?action=domainemailforwarding&id={$domainid}"
           class="text-decoration-none animate-on-scroll">
          <div class="border rounded-3 p-3 text-center h-100 d-flex flex-column align-items-center justify-content-center gap-2">
            <i class="bi bi-envelope-at fs-2 text-primary"></i>
            <div class="fw-semibold small">{$LANG.domainsEmailForwarding}</div>
          </div>
        </a>
      </div>
      {/if}
      {if $domainnameservers}
      <div class="col-sm-6 col-lg-4">
        <a href="{$WEB_ROOT}/clientarea.php?action=domainregisterns&id={$domainid}"
           class="text-decoration-none animate-on-scroll">
          <div class="border rounded-3 p-3 text-center h-100 d-flex flex-column align-items-center justify-content-center gap-2">
            <i class="bi bi-diagram-3 fs-2 text-primary"></i>
            <div class="fw-semibold small">{$LANG.domainsNameservers}</div>
          </div>
        </a>
      </div>
      {/if}
      <div class="col-sm-6 col-lg-4">
        <a href="{$WEB_ROOT}/clientarea.php?action=domaincontacts&id={$domainid}"
           class="text-decoration-none animate-on-scroll">
          <div class="border rounded-3 p-3 text-center h-100 d-flex flex-column align-items-center justify-content-center gap-2">
            <i class="bi bi-person-lines-fill fs-2 text-primary"></i>
            <div class="fw-semibold small">{$LANG.domainsWhoisInformation}</div>
          </div>
        </a>
      </div>
      <div class="col-sm-6 col-lg-4">
        <a href="{$WEB_ROOT}/clientarea.php?action=domainaddons&id={$domainid}"
           class="text-decoration-none animate-on-scroll">
          <div class="border rounded-3 p-3 text-center h-100 d-flex flex-column align-items-center justify-content-center gap-2">
            <i class="bi bi-puzzle fs-2 text-primary"></i>
            <div class="fw-semibold small">{$LANG.domainAddons}</div>
          </div>
        </a>
      </div>
    </div>

    {* Auto-renew & WHOIS privacy settings *}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-gear me-2 text-primary"></i>{$LANG.domainsettings}</h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$domainid}">
          <div class="row g-3">
            <div class="col-md-6">
              <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="autorenew"
                       name="autorenew" value="on"{if $autorenew} checked{/if}>
                <label class="form-check-label fw-medium" for="autorenew">
                  {$LANG.domainautorenew}
                </label>
              </div>
            </div>
            {if $idprotectionaddon}
            <div class="col-md-6">
              <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="idprotection"
                       name="idprotection" value="on"{if $idprotection} checked{/if}>
                <label class="form-check-label fw-medium" for="idprotection">
                  {$LANG.domainidprotection}
                </label>
              </div>
            </div>
            {/if}
          </div>
          <div class="mt-3">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-check-lg me-2"></i>{$LANG.clientareasavechanges}
            </button>
          </div>
        </form>
      </div>
    </div>

  </div>
</div>

{include file="$template/footer.tpl"}
