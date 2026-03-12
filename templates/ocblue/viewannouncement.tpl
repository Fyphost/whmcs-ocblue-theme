{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-12">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0"><i class="bi bi-megaphone me-2 text-primary"></i>{$announcement.title}</h5>
        <a href="{$WEB_ROOT}/announcements.php" class="btn btn-sm btn-outline-secondary rounded-pill">
          <i class="bi bi-arrow-left me-1"></i>All Announcements
        </a>
      </div>
      <div class="dashboard-card-body">
        <div class="text-muted small mb-3">
          <i class="bi bi-calendar3 me-1"></i>{$announcement.date}
        </div>
        <div class="announcement-body">
          {$announcement.announcement}
        </div>
      </div>
    </div>

    {* Prev / Next navigation *}
    {if $previousid or $nextid}
    <div class="d-flex justify-content-between mt-3 animate-on-scroll">
      {if $previousid}
      <a href="{$WEB_ROOT}/announcements.php?id={$previousid}" class="btn btn-outline-primary rounded-pill">
        <i class="bi bi-chevron-left me-1"></i>Previous
      </a>
      {else}
      <span></span>
      {/if}
      {if $nextid}
      <a href="{$WEB_ROOT}/announcements.php?id={$nextid}" class="btn btn-outline-primary rounded-pill">
        Next <i class="bi bi-chevron-right ms-1"></i>
      </a>
      {/if}
    </div>
    {/if}
  </div>
</div>

{include file="$template/footer.tpl"}
