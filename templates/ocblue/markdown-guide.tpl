{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-8 mx-auto">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-markdown me-2 text-primary"></i>{$LANG.markdownguide}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="markdown-guide-content">
          {$markdownContent}
        </div>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
