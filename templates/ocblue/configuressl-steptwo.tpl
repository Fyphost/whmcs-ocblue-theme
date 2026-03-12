{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-shield-lock me-2 text-primary"></i>{$LANG.sslconfiguration}
          <span class="badge bg-primary ms-2">Step 2</span>
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$serviceid}">
          <input type="hidden" name="step" value="3">
          <input type="hidden" name="csr" value="{$csr}">
          <input type="hidden" name="webservertype" value="{$webservertype}">

          {if $approverEmailAddresses}
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.sslapprovalmethod}</label>
            <select name="approveremail" class="form-select">
              {foreach from=$approverEmailAddresses item=email}
              <option value="{$email}">{$email}</option>
              {/foreach}
            </select>
            <div class="form-text">{$LANG.sslapprovalemailhint}</div>
          </div>
          {/if}

          {if $validationMethods}
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.sslvalidationmethod}</label>
            {foreach from=$validationMethods item=method key=methodKey}
            <div class="form-check">
              <input class="form-check-input" type="radio" name="validationmethod"
                     value="{$methodKey}" id="method_{$methodKey}"
                     {if $methodKey@first} checked{/if}>
              <label class="form-check-label" for="method_{$methodKey}">{$method}</label>
            </div>
            {/foreach}
          </div>
          {/if}

          <div class="d-flex flex-wrap gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              {$LANG.sslsubmit} <i class="bi bi-check-lg ms-2"></i>
            </button>
            <a href="{$WEB_ROOT}/clientarea.php?action=configuressl&id={$serviceid}"
               class="btn btn-outline-secondary rounded-pill px-4">
              <i class="bi bi-arrow-left me-2"></i>{$LANG.back}
            </a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
