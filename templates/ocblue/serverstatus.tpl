{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-12">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-activity me-2 text-primary"></i>{$LANG.serverstatustitle}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $servers}
          <div class="row g-3">
            {foreach from=$servers item=server}
            <div class="col-md-6 col-lg-4">
              <div class="server-status-card">
                <div class="d-flex align-items-center gap-3">
                  <div class="server-status-indicator {if $server.online}indicator-online{else}indicator-offline{/if}"></div>
                  <div class="flex-grow-1">
                    <div class="fw-semibold">{$server.name}</div>
                    {if $server.type}
                    <div class="small text-muted">{$server.type}</div>
                    {/if}
                  </div>
                  {if $server.online}
                    <span class="badge badge-active">Online</span>
                  {else}
                    <span class="badge badge-danger">Offline</span>
                  {/if}
                </div>
                {if $server.pingtime}
                <div class="mt-2 small text-muted">
                  <i class="bi bi-speedometer2 me-1"></i>
                  Response: {$server.pingtime}ms
                </div>
                {/if}
              </div>
            </div>
            {/foreach}
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-server empty-state-icon"></i>
            <p class="empty-state-text">No server status information available.</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
