{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-key me-2 text-primary"></i>{$LANG.domainsgetepp}
          {if $domain}<span class="text-muted fw-normal small ms-1">— {$domain}</span>{/if}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <p class="text-muted mb-4">{$LANG.domainsgeteppdesc}</p>

        {if $eppCode}
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.eppcode}</label>
            <div class="input-group">
              <input type="text" class="form-control font-monospace" id="eppCodeInput"
                     value="{$eppCode}" readonly>
              <button class="btn btn-outline-primary"
                      onclick="navigator.clipboard.writeText(document.getElementById('eppCodeInput').value)">
                <i class="bi bi-clipboard"></i>
              </button>
            </div>
          </div>
        {else}
          <form method="post" action="{$smarty.server.PHP_SELF}">
            <input type="hidden" name="id" value="{$domainid}">
            <button type="submit" name="send" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-envelope me-2"></i>{$LANG.domainsgeteppsendemail}
            </button>
          </form>
        {/if}

        <div class="mt-3">
          <a href="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}"
             class="btn btn-outline-secondary rounded-pill px-4">
            <i class="bi bi-arrow-left me-2"></i>{$LANG.clientareacancel}
          </a>
        </div>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
