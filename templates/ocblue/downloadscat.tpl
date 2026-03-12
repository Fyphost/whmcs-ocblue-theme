{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-8">
    <div class="dashboard-card animate-on-scroll mb-4">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">
          <i class="bi bi-folder2-open me-2 text-primary"></i>{$catname}
        </h5>
        <a href="{$WEB_ROOT}/downloads.php" class="btn btn-sm btn-outline-secondary rounded-pill">
          <i class="bi bi-arrow-left me-1"></i>{$LANG.downloadsheading}
        </a>
      </div>
      <div class="dashboard-card-body">
        {if $catdescription}
        <p class="text-muted mb-4">{$catdescription}</p>
        {/if}

        {if $files}
          <div class="list-group list-group-flush">
            {foreach from=$files item=file}
            <div class="list-group-item px-0 py-3 border-0 border-bottom">
              <div class="d-flex align-items-start gap-3">
                <i class="bi bi-file-earmark-arrow-down fs-3 text-primary flex-shrink-0 mt-1"></i>
                <div class="flex-grow-1">
                  <div class="fw-semibold">{$file.title}</div>
                  {if $file.description}
                  <p class="text-muted small mb-1">{$file.description}</p>
                  {/if}
                  <div class="d-flex flex-wrap gap-3 small text-muted">
                    {if $file.version}<span><i class="bi bi-tag me-1"></i>v{$file.version}</span>{/if}
                    {if $file.date}<span><i class="bi bi-calendar me-1"></i>{$file.date}</span>{/if}
                    {if $file.downloads}<span><i class="bi bi-arrow-down-circle me-1"></i>{$file.downloads} {$LANG.downloadsdownloads}</span>{/if}
                  </div>
                </div>
                <a href="{$WEB_ROOT}/dl.php?type=d&id={$file.id}"
                   class="btn btn-sm btn-primary rounded-pill flex-shrink-0">
                  <i class="bi bi-download me-1"></i>{$LANG.download}
                </a>
              </div>
            </div>
            {/foreach}
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-folder2-open empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.downloadsnone}</p>
          </div>
        {/if}
      </div>
    </div>

    {* Subcategories *}
    {if $subcategories}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-folder me-2 text-primary"></i>{$LANG.downloadscategories}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-3">
          {foreach from=$subcategories item=subcat}
          <div class="col-md-4 col-sm-6">
            <a href="{$WEB_ROOT}/downloads.php?action=displaycat&catid={$subcat.id}"
               class="text-decoration-none">
              <div class="border rounded-3 p-3 h-100">
                <i class="bi bi-folder2-open text-primary me-2"></i>
                <span class="fw-medium small">{$subcat.name}</span>
              </div>
            </a>
          </div>
          {/foreach}
        </div>
      </div>
    </div>
    {/if}
  </div>
</div>

{include file="$template/footer.tpl"}
