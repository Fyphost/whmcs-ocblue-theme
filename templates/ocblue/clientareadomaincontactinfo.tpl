{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-person-lines-fill me-2 text-primary"></i>{$LANG.domaincontactinfo}
          {if $domain}<span class="text-muted fw-normal small ms-1">— {$domain}</span>{/if}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$domainid}">

          {foreach from=$contacttypes item=type key=typeKey}
          <div class="mb-4">
            <h6 class="fw-semibold text-primary border-bottom pb-2 mb-3">
              <i class="bi bi-person me-2"></i>{$type.title}
            </h6>
            <div class="row g-3">
              <div class="col-md-6">
                <label class="form-label fw-medium">{$LANG.clientareafirstname}</label>
                <input type="text" name="{$typeKey}[firstname]"
                       value="{$type.data.firstname}" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label fw-medium">{$LANG.clientarealastname}</label>
                <input type="text" name="{$typeKey}[lastname]"
                       value="{$type.data.lastname}" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label fw-medium">{$LANG.clientareacompanyname}</label>
                <input type="text" name="{$typeKey}[company]"
                       value="{$type.data.company}" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label fw-medium">{$LANG.clientareaemail}</label>
                <input type="email" name="{$typeKey}[email]"
                       value="{$type.data.email}" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label fw-medium">{$LANG.clientareaaddress1}</label>
                <input type="text" name="{$typeKey}[address1]"
                       value="{$type.data.address1}" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label fw-medium">{$LANG.clientareaaddress2}</label>
                <input type="text" name="{$typeKey}[address2]"
                       value="{$type.data.address2}" class="form-control">
              </div>
              <div class="col-md-4">
                <label class="form-label fw-medium">{$LANG.clientareacity}</label>
                <input type="text" name="{$typeKey}[city]"
                       value="{$type.data.city}" class="form-control">
              </div>
              <div class="col-md-4">
                <label class="form-label fw-medium">{$LANG.clientareastate}</label>
                <input type="text" name="{$typeKey}[state]"
                       value="{$type.data.state}" class="form-control">
              </div>
              <div class="col-md-4">
                <label class="form-label fw-medium">{$LANG.clientareapostcode}</label>
                <input type="text" name="{$typeKey}[zipcode]"
                       value="{$type.data.zipcode}" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label fw-medium">{$LANG.clientareacountry}</label>
                <input type="text" name="{$typeKey}[country]"
                       value="{$type.data.country}" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label fw-medium">{$LANG.clientareaphonenumber}</label>
                <input type="tel" name="{$typeKey}[phone]"
                       value="{$type.data.phone}" class="form-control">
              </div>
            </div>
          </div>
          {/foreach}

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
