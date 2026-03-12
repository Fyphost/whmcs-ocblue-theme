{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-shield-check me-2 text-primary"></i>
          {$LANG.userpermissionsfor}: {$user.firstname} {$user.lastname}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="userid" value="{$user.id}">

          <p class="text-muted mb-4">{$LANG.userpermissionsdesc}</p>

          <div class="mb-3">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="permissions" value="all"
                     id="permAll"{if $user.permissions eq 'all'} checked{/if}>
              <label class="form-check-label fw-medium" for="permAll">
                {$LANG.userpermissionsall}
              </label>
              <div class="form-text">{$LANG.userpermissionsalldesc}</div>
            </div>
          </div>
          <div class="mb-4">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="permissions" value="custom"
                     id="permCustom"{if $user.permissions neq 'all'} checked{/if}>
              <label class="form-check-label fw-medium" for="permCustom">
                {$LANG.userpermissionslimited}
              </label>
            </div>
          </div>

          {if $permissionsList}
          <div id="customPermsSection" class="border rounded-3 p-3 mb-4">
            <div class="row g-2">
              {foreach from=$permissionsList item=perm}
              <div class="col-md-4 col-sm-6">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox"
                         name="permissionsList[]" value="{$perm.value}"
                         id="perm_{$perm.value}"
                         {if $perm.selected} checked{/if}>
                  <label class="form-check-label small" for="perm_{$perm.value}">
                    {$perm.lang}
                  </label>
                </div>
              </div>
              {/foreach}
            </div>
          </div>
          {/if}

          <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-check-lg me-2"></i>{$LANG.clientareasavechanges}
            </button>
            <a href="{$WEB_ROOT}/clientarea.php?action=users"
               class="btn btn-outline-secondary rounded-pill px-4">
              <i class="bi bi-arrow-left me-2"></i>{$LANG.clientareacancel}
            </a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
