{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-arrow-up-circle me-2 text-primary"></i>{$LANG.upgradeconfigure}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$serviceid}">
          <input type="hidden" name="type" value="{$type}">

          {if $type eq 'product'}
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.upgradeselectpackage}</label>
            <div class="row g-3">
              {foreach from=$products item=prod}
              <div class="col-md-6">
                <div class="form-check border rounded-3 p-3 h-100">
                  <input class="form-check-input" type="radio" name="newproductid"
                         value="{$prod.pid}" id="prod_{$prod.pid}">
                  <label class="form-check-label w-100" for="prod_{$prod.pid}">
                    <div class="fw-semibold">{$prod.name}</div>
                    <div class="text-muted small">{$prod.description}</div>
                    <div class="text-primary fw-semibold mt-1">{$prod.pricing}</div>
                  </label>
                </div>
              </div>
              {/foreach}
            </div>
          </div>
          {/if}

          {if $type eq 'configoptions'}
          <div class="mb-4">
            {foreach from=$configoptions item=option}
            <div class="mb-3">
              <label class="form-label fw-medium">{$option.optionname}</label>
              {$option.input}
            </div>
            {/foreach}
          </div>
          {/if}

          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.orderpaymentmethod}</label>
            {$gatewaydropdown}
          </div>

          <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              {$LANG.continue} <i class="bi bi-arrow-right ms-2"></i>
            </button>
            <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$serviceid}"
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
