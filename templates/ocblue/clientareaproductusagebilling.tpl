{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-bar-chart me-2 text-primary"></i>{$LANG.usagebillingheading}
        </h5>
      </div>
      <div class="dashboard-card-body">
        {if $usagebilling}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>{$LANG.description}</th>
                  <th>{$LANG.usagebillingusage}</th>
                  <th>{$LANG.usagebillingunit}</th>
                  <th class="text-end">{$LANG.invoicesamount}</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$usagebilling item=item}
                <tr>
                  <td>{$item.description}</td>
                  <td>{$item.usage}</td>
                  <td>{$item.unit}</td>
                  <td class="text-end">{$item.amount}</td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-bar-chart empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.clientareanorecords}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
