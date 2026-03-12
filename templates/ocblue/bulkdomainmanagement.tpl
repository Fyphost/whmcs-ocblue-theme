{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0"><i class="bi bi-globe me-2 text-primary"></i>{$LANG.bulkdomainmanagement}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $domains}
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <div class="table-responsive mb-3">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th style="width:40px">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="selectAll"
                             onclick="document.querySelectorAll('.domain-cb').forEach(c=>c.checked=this.checked)">
                    </div>
                  </th>
                  <th>{$LANG.domainsdomain}</th>
                  <th>{$LANG.domainsexpirydate}</th>
                  <th>{$LANG.domainsstatus}</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$domains item=domain}
                <tr>
                  <td>
                    <div class="form-check">
                      <input class="form-check-input domain-cb" type="checkbox"
                             name="domains[]" value="{$domain.id}">
                    </div>
                  </td>
                  <td><i class="bi bi-globe me-2 text-primary"></i><strong>{$domain.domain}</strong></td>
                  <td>{$domain.expirydate}</td>
                  <td>
                    {if $domain.status eq 'Active'}
                      <span class="badge badge-active">Active</span>
                    {elseif $domain.status eq 'Expired'}
                      <span class="badge badge-cancelled">Expired</span>
                    {else}
                      <span class="badge badge-pending">{$domain.status}</span>
                    {/if}
                  </td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
          <div class="d-flex flex-wrap gap-2">
            <select name="action" class="form-select w-auto">
              {foreach from=$actions key=val item=label}
              <option value="{$val}">{$label}</option>
              {/foreach}
            </select>
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-lightning me-2"></i>{$LANG.apply}
            </button>
          </div>
        </form>
        {else}
          <div class="empty-state">
            <i class="bi bi-globe empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.clientareanorecords}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
