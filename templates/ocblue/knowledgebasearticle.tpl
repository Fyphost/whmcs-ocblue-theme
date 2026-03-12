{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-8 col-xl-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0"><i class="bi bi-file-text me-2 text-primary"></i>{$article.title}</h5>
        <a href="{$WEB_ROOT}/knowledgebase.php" class="btn btn-sm btn-outline-secondary rounded-pill">
          <i class="bi bi-arrow-left me-1"></i>Back
        </a>
      </div>
      <div class="dashboard-card-body">
        {if $article.keywords}
        <div class="mb-3">
          {foreach from=","| explode:$article.keywords item=kw}
            {if $kw}<span class="badge badge-info me-1">{$kw|trim}</span>{/if}
          {/foreach}
        </div>
        {/if}
        <div class="kb-article-body">
          {$article.article}
        </div>
        {if $article.attachments}
        <hr>
        <div class="small text-muted mb-2"><i class="bi bi-paperclip me-1"></i>Attachments</div>
        {foreach from=$article.attachments item=att}
        <a href="{$att.url}" class="btn btn-sm btn-outline-secondary rounded-pill me-1 mb-1" target="_blank">
          <i class="bi bi-file-earmark me-1"></i>{$att.filename}
        </a>
        {/foreach}
        {/if}
      </div>
    </div>

    {* Was this helpful? *}
    <div class="dashboard-card mt-4 animate-on-scroll">
      <div class="dashboard-card-body text-center py-4">
        <p class="fw-semibold mb-3">{$LANG.knowledgebasehelpful}</p>
        <a href="{$WEB_ROOT}/knowledgebase.php?article={$article.id}&vote=y"
           class="btn btn-success rounded-pill px-4 me-2">
          <i class="bi bi-hand-thumbs-up me-1"></i>Yes ({$article.yescount})
        </a>
        <a href="{$WEB_ROOT}/knowledgebase.php?article={$article.id}&vote=n"
           class="btn btn-outline-secondary rounded-pill px-4">
          <i class="bi bi-hand-thumbs-down me-1"></i>No ({$article.nocount})
        </a>
      </div>
    </div>
  </div>

  {* Related articles sidebar *}
  {if $relatedarticles}
  <div class="col-lg-4 col-xl-3">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h6 class="mb-0"><i class="bi bi-link-45deg me-2 text-primary"></i>Related Articles</h6>
      </div>
      <nav class="sidebar-nav p-2">
        <ul class="list-unstyled mb-0">
          {foreach from=$relatedarticles item=related}
          <li>
            <a href="{$WEB_ROOT}/knowledgebase.php?article={$related.id}"
               class="sidebar-link">
              <i class="bi bi-file-text"></i>
              <span>{$related.title}</span>
            </a>
          </li>
          {/foreach}
        </ul>
      </nav>
    </div>
  </div>
  {/if}

</div>

{include file="$template/footer.tpl"}
