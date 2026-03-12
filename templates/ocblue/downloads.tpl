{include file="$template/header.tpl"}

<div class="dashboard-card animate-on-scroll">
  <div class="dashboard-card-header">
    <h5 class="mb-0"><i class="bi bi-download me-2 text-primary"></i>{$LANG.downloadsheading}</h5>
  </div>
  <div class="dashboard-card-body">
    {if $categories}
      <div class="row g-3">
        {foreach from=$categories item=cat}
        <div class="col-md-4 col-sm-6">
          <a href="{$WEB_ROOT}/downloads.php?action=displaycat&catid={$cat.id}"
             class="text-decoration-none">
            <div class="border rounded-3 p-3 h-100 d-flex align-items-center gap-3 hover-card">
              <i class="bi bi-folder2-open fs-2 text-primary flex-shrink-0"></i>
              <div>
                <div class="fw-semibold">{$cat.name}</div>
                {if $cat.description}
                <div class="text-muted small">{$cat.description}</div>
                {/if}
                <div class="text-muted small">{$cat.filecount} {$LANG.downloadsfiles}</div>
              </div>
            </div>
          </a>
        </div>
        {/foreach}
      </div>
    {else}
      <div class="empty-state">
        <i class="bi bi-download empty-state-icon"></i>
        <p class="empty-state-text">{$LANG.downloadsnone}</p>
      </div>
    {/if}
  </div>
</div>

{include file="$template/footer.tpl"}
