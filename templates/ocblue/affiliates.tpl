{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">

    {* Stats *}
    <div class="row g-3 mb-4">
      <div class="col-sm-6 col-lg-4 animate-on-scroll">
        <div class="dashboard-stat-card stat-primary">
          <div class="stat-icon-wrap"><i class="bi bi-people"></i></div>
          <div class="stat-value">{$affiliatestats.numreferrals}</div>
          <div class="stat-desc">{$LANG.affiliatestotalreferrals}</div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4 animate-on-scroll">
        <div class="dashboard-stat-card stat-success">
          <div class="stat-icon-wrap"><i class="bi bi-cash-coin"></i></div>
          <div class="stat-value">{$affiliatestats.balance}</div>
          <div class="stat-desc">{$LANG.affiliatesbalance}</div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4 animate-on-scroll">
        <div class="dashboard-stat-card stat-warning">
          <div class="stat-icon-wrap"><i class="bi bi-graph-up"></i></div>
          <div class="stat-value">{$affiliatestats.totalearnings}</div>
          <div class="stat-desc">{$LANG.affiliatestotalearnings}</div>
        </div>
      </div>
    </div>

    {* Referral Link *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-link-45deg me-2 text-primary"></i>{$LANG.affiliatesreferrallink}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="input-group">
          <input type="text" class="form-control" id="referralLink"
                 value="{$affiliatestats.affiliatelink}" readonly>
          <button class="btn btn-outline-primary rounded-end-pill"
                  onclick="navigator.clipboard.writeText(document.getElementById('referralLink').value)">
            <i class="bi bi-clipboard me-1"></i>{$LANG.copy}
          </button>
        </div>
      </div>
    </div>

    {* Referral History *}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-clock-history me-2 text-primary"></i>{$LANG.affiliatesreferralhistory}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $affiliatehistory}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>{$LANG.networkissuesdate}</th>
                  <th>{$LANG.affiliatesreferral}</th>
                  <th>{$LANG.affiliatescommission}</th>
                  <th>{$LANG.status}</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$affiliatehistory item=history}
                <tr>
                  <td>{$history.date}</td>
                  <td>{$history.description}</td>
                  <td>{$history.amount}</td>
                  <td>
                    {if $history.status eq 'Active'}
                      <span class="badge badge-active">{$history.status}</span>
                    {elseif $history.status eq 'Pending'}
                      <span class="badge badge-pending">{$history.status}</span>
                    {else}
                      <span class="badge bg-secondary">{$history.status}</span>
                    {/if}
                  </td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-people empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.affiliatesnoreferrals}</p>
          </div>
        {/if}
      </div>
    </div>

  </div>
</div>

{include file="$template/footer.tpl"}
