{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-credit-card me-2 text-primary"></i>{$LANG.paymentmethodbillingcontacts}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="sub" value="savebillingcontacts">
          <input type="hidden" name="paymethodid" value="{$paymethodid}">

          <p class="text-muted mb-4">{$LANG.paymentmethodbillingcontactsdesc}</p>

          {if $contacts}
          <div class="row g-2 mb-4">
            {foreach from=$contacts item=contact}
            <div class="col-md-6">
              <div class="form-check">
                <input class="form-check-input" type="checkbox"
                       name="billingcontacts[]" value="{$contact.id}"
                       id="contact_{$contact.id}"
                       {if $contact.selected} checked{/if}>
                <label class="form-check-label" for="contact_{$contact.id}">
                  {$contact.name} — {$contact.email}
                </label>
              </div>
            </div>
            {/foreach}
          </div>
          {else}
          <div class="empty-state mb-4">
            <i class="bi bi-people empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.clientareanorecords}</p>
          </div>
          {/if}

          <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-check-lg me-2"></i>{$LANG.clientareasavechanges}
            </button>
            <a href="{$WEB_ROOT}/clientarea.php?action=paymentmethods"
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
