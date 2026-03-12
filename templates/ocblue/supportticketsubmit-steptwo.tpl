{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-headset me-2 text-primary"></i>{$LANG.supportticketsubmit}
          <span class="badge bg-primary ms-2">Step 2 of 2</span>
        </h5>
      </div>
      <div class="dashboard-card-body">
        {* Ticket summary *}
        <div class="border rounded-3 p-3 mb-4 bg-light-subtle">
          <div class="row g-2">
            <div class="col-sm-6">
              <div class="text-muted small">{$LANG.supportdepartment}</div>
              <div class="fw-medium">{$deptname}</div>
            </div>
            <div class="col-sm-6">
              <div class="text-muted small">{$LANG.supportticketsubject}</div>
              <div class="fw-medium">{$subject}</div>
            </div>
          </div>
        </div>

        <form method="post" action="{$smarty.server.PHP_SELF}">
          {foreach from=$hiddenfields item=field}
          <input type="hidden" name="{$field.name}" value="{$field.value}">
          {/foreach}

          {* Department custom fields *}
          {if $deptcustomfields}
          <div class="row g-3 mb-4">
            {foreach from=$deptcustomfields item=field}
            <div class="col-md-6">
              {if $field.type eq 'tickbox'}
                <div class="form-check mt-2">
                  <input class="form-check-input" type="checkbox"
                         name="customfields[{$field.id}]" id="cf_{$field.id}"
                         value="on"{if $field.value} checked{/if}>
                  <label class="form-check-label fw-medium" for="cf_{$field.id}">
                    {$field.name}{if $field.required} <span class="text-danger">*</span>{/if}
                  </label>
                </div>
              {else}
                <label class="form-label fw-medium" for="cf_{$field.id}">
                  {$field.name}{if $field.required} <span class="text-danger">*</span>{/if}
                </label>
                {$field.input}
              {/if}
            </div>
            {/foreach}
          </div>
          {/if}

          {* File attachments *}
          {if $fileattachmentenabled}
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.supportattachments}</label>
            <input type="file" name="attachments[]" class="form-control" multiple>
          </div>
          {/if}

          <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-send me-2"></i>{$LANG.supportticketsubmitbtn}
            </button>
            <a href="{$WEB_ROOT}/submitticket.php" class="btn btn-outline-secondary rounded-pill px-4">
              <i class="bi bi-arrow-left me-2"></i>{$LANG.back}
            </a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
