{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-bar-chart-line me-2 text-primary"></i>{$LANG.usagebillingheading}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $pricingdata}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>{$LANG.description}</th>
                  <th>{$LANG.usagebillingunit}</th>
                  <th class="text-end">{$LANG.usagebillingprice}</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$pricingdata item=tier}
                <tr>
                  <td>{$tier.name}</td>
                  <td>{$tier.unit}</td>
                  <td class="text-end">{$tier.price}</td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-bar-chart-line empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.clientareanorecords}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
