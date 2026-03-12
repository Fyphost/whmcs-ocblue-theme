{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-envelope me-2 text-primary"></i>{$LANG.emailhistory}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $emails}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>{$LANG.networkissuesdate}</th>
                  <th>{$LANG.emailhistorysubject}</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$emails item=email}
                <tr>
                  <td class="text-nowrap">{$email.date}</td>
                  <td>{$email.subject}</td>
                  <td class="text-end">
                    <a href="{$WEB_ROOT}/viewemail.php?id={$email.id}"
                       class="btn btn-xs btn-outline-primary rounded-pill">
                      <i class="bi bi-eye me-1"></i>{$LANG.view}
                    </a>
                  </td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-envelope empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.emailhistorynone}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
