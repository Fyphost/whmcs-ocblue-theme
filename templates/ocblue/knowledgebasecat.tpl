{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-8">
    <div class="dashboard-card animate-on-scroll mb-4">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0">
          <i class="bi bi-folder2-open me-2 text-primary"></i>{$catname}
        </h5>
        <a href="{$WEB_ROOT}/knowledgebase.php" class="btn btn-sm btn-outline-secondary rounded-pill">
          <i class="bi bi-arrow-left me-1"></i>{$LANG.knowledgebaseheading}
        </a>
      </div>
      <div class="dashboard-card-body">
        {if $catdescription}
        <p class="text-muted mb-4">{$catdescription}</p>
        {/if}

        {if $articles}
          <div class="list-group list-group-flush">
            {foreach from=$articles item=article}
            <a href="{$WEB_ROOT}/knowledgebase/{$article.id}/{$article.slug}"
               class="list-group-item list-group-item-action border-0 border-bottom px-0 py-3">
              <div class="d-flex align-items-start gap-3">
                <i class="bi bi-file-earmark-text fs-4 text-primary flex-shrink-0 mt-1"></i>
                <div>
                  <div class="fw-semibold">{$article.title}</div>
                  {if $article.summary}
                  <div class="text-muted small mt-1">{$article.summary}</div>
                  {/if}
                  <div class="small text-muted mt-1">
                    <i class="bi bi-eye me-1"></i>{$article.views} {$LANG.views}
                  </div>
                </div>
              </div>
            </a>
            {/foreach}
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-journal empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.knowledgebasenoresults}</p>
          </div>
        {/if}
      </div>
    </div>

    {* Subcategories *}
    {if $subcategories}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-folder me-2 text-primary"></i>{$LANG.knowledgebasecategories}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-3">
          {foreach from=$subcategories item=subcat}
          <div class="col-md-4 col-sm-6">
            <a href="{$WEB_ROOT}/knowledgebase/{$subcat.id}/{$subcat.slug}"
               class="text-decoration-none">
              <div class="border rounded-3 p-3 h-100">
                <i class="bi bi-folder2-open text-primary me-2"></i>
                <span class="fw-medium small">{$subcat.name}</span>
                {if $subcat.articlecount}
                <div class="text-muted small mt-1">{$subcat.articlecount} {$LANG.knowledgebasearticles}</div>
                {/if}
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
