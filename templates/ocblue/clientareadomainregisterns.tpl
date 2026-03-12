{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-diagram-3 me-2 text-primary"></i>{$LANG.domainsNameservers}
          {if $domain}<span class="text-muted fw-normal small ms-1">— {$domain}</span>{/if}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$domainid}">

          {if $ownNameservers}
          <div class="mb-3">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="nstype" value="default"
                     id="nsDefault"{if $nstype neq 'custom'} checked{/if}>
              <label class="form-check-label fw-medium" for="nsDefault">
                {$LANG.domainsDefaultNameservers}
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="nstype" value="custom"
                     id="nsCustom"{if $nstype eq 'custom'} checked{/if}>
              <label class="form-check-label fw-medium" for="nsCustom">
                {$LANG.domainsCustomNameservers}
              </label>
            </div>
          </div>
          {/if}

          <div id="customNsFields" class="row g-3 mb-4">
            {foreach from=$nameservers item=ns key=nsKey}
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.nameserver} {$nsKey+1}</label>
              <input type="text" name="ns{$nsKey+1}" value="{$ns}" class="form-control"
                     placeholder="ns{$nsKey+1}.example.com">
            </div>
            {/foreach}
          </div>

          <div class="d-flex flex-wrap gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-check-lg me-2"></i>{$LANG.clientareasavechanges}
            </button>
            <a href="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}"
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
