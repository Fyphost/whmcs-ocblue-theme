{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">

    {if $successful}
    <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
      <i class="bi bi-check-circle me-2"></i>{$LANG.changessavedsuccessfully}
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    {/if}

    <form method="post" action="{$smarty.server.PHP_SELF}">
      <div class="dashboard-card mb-4 animate-on-scroll">
        <div class="dashboard-card-header">
          <h5 class="mb-0"><i class="bi bi-person me-2 text-primary"></i>{$LANG.userprofile}</h5>
        </div>
        <div class="dashboard-card-body">
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareafirstname}</label>
              <input type="text" name="firstname" value="{$user.firstname}" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientarealastname}</label>
              <input type="text" name="lastname" value="{$user.lastname}" class="form-control">
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareaemail}</label>
              <input type="email" name="email" value="{$user.email}" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientarealanguage}</label>
              <select name="language" class="form-select">
                <option value="">{lang key='default'}</option>
                {foreach $languages as $lang}
                <option value="{$lang}"{if $lang eq $user.language} selected{/if}>{$lang|ucfirst}</option>
                {/foreach}
              </select>
            </div>
          </div>
        </div>
      </div>

      <div class="d-flex gap-2">
        <button type="submit" class="btn btn-primary rounded-pill px-4">
          <i class="bi bi-check-lg me-2"></i>{$LANG.clientareasavechanges}
        </button>
      </div>
    </form>

  </div>
</div>

{include file="$template/footer.tpl"}
