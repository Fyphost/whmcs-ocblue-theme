{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0">
          <i class="bi bi-puzzle me-2 text-primary"></i>{$LANG.domainaddons}
          {if $domain}<span class="text-muted fw-normal small ms-1">— {$domain}</span>{/if}
        </h5>
      </div>
      <div class="dashboard-card-body">
        {if $addons}
          <form method="post" action="{$smarty.server.PHP_SELF}">
            <input type="hidden" name="id" value="{$domainid}">
            <div class="row g-3 mb-4">
              {foreach from=$addons item=addon}
              <div class="col-md-6">
                <div class="border rounded-3 p-3 h-100">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox"
                           name="addons[]" value="{$addon.id}"
                           id="addon_{$addon.id}"
                           {if $addon.active} checked{/if}>
                    <label class="form-check-label fw-medium" for="addon_{$addon.id}">
                      {$addon.name}
                    </label>
                  </div>
                  {if $addon.description}
                  <p class="text-muted small mt-1 mb-0 ms-4">{$addon.description}</p>
                  {/if}
                  {if $addon.price}
                  <div class="text-primary fw-semibold small mt-1 ms-4">{$addon.price}</div>
                  {/if}
                </div>
              </div>
              {/foreach}
            </div>
            <div class="d-flex gap-2">
              <button type="submit" class="btn btn-primary rounded-pill px-4">
                <i class="bi bi-check-lg me-2"></i>{$LANG.clientareasavechanges}
              </button>
              <a href="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}"
                 class="btn btn-outline-secondary rounded-pill px-4">
                <i class="bi bi-arrow-left me-2"></i>{$LANG.clientareacancel}
              </a>
            </div>
          </form>
        {else}
          <div class="empty-state">
            <i class="bi bi-puzzle empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.domainaddonsnone}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
