{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll mb-4">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-lightbulb me-2 text-primary"></i>{$LANG.kbsuggestions}
        </h5>
      </div>
      <div class="dashboard-card-body">
        {if $suggestions}
          <p class="text-muted mb-3">{$LANG.kbsuggestionsdesc}</p>
          <div class="list-group list-group-flush mb-4">
            {foreach from=$suggestions item=article}
            <a href="{$WEB_ROOT}/knowledgebase/{$article.id}/{$article.slug}"
               target="_blank" rel="noopener"
               class="list-group-item list-group-item-action border-0 border-bottom px-0 py-3">
              <div class="d-flex align-items-center gap-3">
                <i class="bi bi-file-earmark-text text-primary flex-shrink-0"></i>
                <span>{$article.title}</span>
                <i class="bi bi-arrow-up-right-square ms-auto text-muted"></i>
              </div>
            </a>
            {/foreach}
          </div>
          <p class="text-muted mb-3">{$LANG.kbsuggestionsstillopenreq}</p>
        {/if}

        <form method="post" action="{$smarty.server.PHP_SELF}">
          {foreach from=$hiddenfields item=field}
          <input type="hidden" name="{$field.name}" value="{$field.value}">
          {/foreach}
          <button type="submit" name="proceed" class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-send me-2"></i>{$LANG.supportticketsubmitbtn}
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
