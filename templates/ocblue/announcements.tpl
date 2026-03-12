{include file="$template/header.tpl"}

{* Announcements list *}
<div class="row g-4">
  <div class="col-12">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-megaphone me-2 text-primary"></i>{$LANG.announcementsnewstitle}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $announcements}
          <div class="row g-4">
            {foreach from=$announcements item=announcement}
            <div class="col-md-6 col-lg-4">
              <div class="announcement-card h-100">
                <div class="announcement-date">
                  <i class="bi bi-calendar3 me-1"></i>{$announcement.date}
                </div>
                <h5 class="announcement-title">
                  <a href="{$WEB_ROOT}/announcements.php?id={$announcement.id}"
                     class="text-decoration-none">
                    {$announcement.title}
                  </a>
                </h5>
                <p class="announcement-excerpt">{$announcement.announcement|truncate:160:"..."}</p>
                <a href="{$WEB_ROOT}/announcements.php?id={$announcement.id}"
                   class="btn btn-sm btn-outline-primary rounded-pill">
                  <i class="bi bi-arrow-right me-1"></i>Read More
                </a>
              </div>
            </div>
            {/foreach}
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-megaphone empty-state-icon"></i>
            <p class="empty-state-text">No announcements at this time.</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
