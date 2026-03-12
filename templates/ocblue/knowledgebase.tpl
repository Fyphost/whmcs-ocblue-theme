{include file="$template/header.tpl"}

<div class="row g-4">

  {* Category sidebar *}
  {if $categories}
  <div class="col-lg-3">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h6 class="mb-0"><i class="bi bi-folder me-2 text-primary"></i>Categories</h6>
      </div>
      <nav class="sidebar-nav p-2">
        <ul class="list-unstyled mb-0">
          <li>
            <a href="{$WEB_ROOT}/knowledgebase.php"
               class="sidebar-link {if !$categoryid}active{/if}">
              <i class="bi bi-grid"></i>
              <span>All Articles</span>
            </a>
          </li>
          {foreach from=$categories item=cat}
          <li>
            <a href="{$WEB_ROOT}/knowledgebase.php?category={$cat.id}"
               class="sidebar-link {if $categoryid eq $cat.id}active{/if}">
              <i class="bi bi-folder2"></i>
              <span>{$cat.name}</span>
            </a>
          </li>
          {/foreach}
        </ul>
      </nav>
    </div>
  </div>
  <div class="col-lg-9">
  {else}
  <div class="col-12">
  {/if}

    {* Search *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-body">
        <form method="get" action="{$WEB_ROOT}/knowledgebase.php" class="d-flex gap-2">
          <input type="text" name="search" class="form-control" placeholder="{$LANG.knowledgebasesearch}"
                 value="{$search|default:''}">
          <button type="submit" class="btn btn-primary rounded-pill px-4 text-nowrap">
            <i class="bi bi-search me-1"></i>Search
          </button>
        </form>
      </div>
    </div>

    {* Articles *}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-book me-2 text-primary"></i>
          {if $catname}{$catname}{elseif $search}Search: "{$search}"{else}{$LANG.knowledgebasetitle}{/if}
        </h5>
      </div>
      <div class="dashboard-card-body">
        {if $articles}
          <div class="list-group list-group-flush">
            {foreach from=$articles item=article}
            <a href="{$WEB_ROOT}/knowledgebase.php?article={$article.id}"
               class="list-group-item list-group-item-action kb-article-link border-0 py-3">
              <div class="d-flex justify-content-between align-items-start gap-2">
                <div>
                  <i class="bi bi-file-text me-2 text-primary"></i>
                  <span class="fw-medium">{$article.title}</span>
                  {if $article.description}
                  <p class="mb-0 text-muted small mt-1">{$article.description|truncate:120:"..."}</p>
                  {/if}
                </div>
                <i class="bi bi-chevron-right text-muted flex-shrink-0 mt-1"></i>
              </div>
            </a>
            {/foreach}
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-book empty-state-icon"></i>
            <p class="empty-state-text">
              {if $search}No articles found for "{$search}".{else}No articles available.{/if}
            </p>
          </div>
        {/if}
      </div>
    </div>

  </div>
</div>

{include file="$template/footer.tpl"}
