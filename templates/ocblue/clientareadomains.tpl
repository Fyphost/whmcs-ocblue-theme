{include file="$template/header.tpl"}

<div class="row g-4">
  {* Sidebar *}
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  {* Main content *}
  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0"><i class="bi bi-globe me-2 text-primary"></i>{$LANG.clientareadomains}</h5>
        <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-primary btn-sm rounded-pill">
          <i class="bi bi-plus-circle me-1"></i>Register Domain
        </a>
      </div>
      <div class="dashboard-card-body">
        {if $domains}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>{$LANG.domainsdomain}</th>
                  <th>{$LANG.domainsregistrationdate}</th>
                  <th>{$LANG.domainsexpirydate}</th>
                  <th>{$LANG.domainsstatus}</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$domains item=domain}
                <tr>
                  <td>
                    <i class="bi bi-globe me-2 text-primary"></i>
                    <strong>{$domain.domain}</strong>
                  </td>
                  <td>{$domain.regdate}</td>
                  <td>{$domain.expirydate}</td>
                  <td>
                    {if $domain.status eq 'Active'}
                      <span class="badge badge-active">Active</span>
                    {elseif $domain.status eq 'Expired'}
                      <span class="badge badge-cancelled">Expired</span>
                    {elseif $domain.status eq 'Grace'}
                      <span class="badge badge-warning">Grace</span>
                    {elseif $domain.status eq 'Redemption'}
                      <span class="badge badge-danger">Redemption</span>
                    {else}
                      <span class="badge badge-pending">{$domain.status}</span>
                    {/if}
                  </td>
                  <td class="text-end">
                    <a href="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domain.id}"
                       class="btn btn-xs btn-outline-primary rounded-pill">
                      <i class="bi bi-gear me-1"></i>Manage
                    </a>
                  </td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-globe empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.clientareanorecords}</p>
            <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-primary btn-sm rounded-pill px-3">
              <i class="bi bi-plus-circle me-1"></i>Register Domain
            </a>
          </div>
        {/if}
      </div>
    </div>
  </div>{* /col-lg-9 *}
</div>{* /row *}

{include file="$template/footer.tpl"}
