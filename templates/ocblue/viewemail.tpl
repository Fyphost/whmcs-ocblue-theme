{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0">
          <i class="bi bi-envelope-open me-2 text-primary"></i>{$subject}
        </h5>
        <span class="text-muted small">{$date}</span>
      </div>
      <div class="dashboard-card-body">
        <div class="email-body mb-4">
          {$message}
        </div>
        <a href="{$WEB_ROOT}/clientarea.php?action=emails"
           class="btn btn-outline-secondary rounded-pill px-4">
          <i class="bi bi-arrow-left me-2"></i>{$LANG.emailhistory}
        </a>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
