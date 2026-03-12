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
          <span class="badge bg-primary ms-2">Step 1</span>
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$serviceid}">
          <input type="hidden" name="step" value="2">

          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.sslwebservertype}</label>
            <select name="webservertype" class="form-select">
              {foreach from=$webservertypes item=wstype}
              <option value="{$wstype}">{$wstype}</option>
              {/foreach}
            </select>
          </div>

          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.sslcsr}</label>
            <textarea name="csr" rows="10" class="form-control font-monospace"
                      placeholder="{$LANG.sslcsrplaceholder}"></textarea>
            <div class="form-text">{$LANG.sslcsrhint}</div>
          </div>

          <button type="submit" class="btn btn-primary rounded-pill px-4">
            {$LANG.continue} <i class="bi bi-arrow-right ms-2"></i>
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
