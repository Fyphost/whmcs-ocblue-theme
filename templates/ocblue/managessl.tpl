{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-shield-check me-2 text-primary"></i>{$LANG.managessl}
          {if $domain}<span class="text-muted fw-normal small ms-1">— {$domain}</span>{/if}
        </h5>
      </div>
      <div class="dashboard-card-body">
        {if $ssldetails}
          <div class="row g-3 mb-4">
            {if $ssldetails.status}
            <div class="col-sm-6 col-md-4">
              <div class="text-muted small">{$LANG.status}</div>
              <div class="fw-medium">{$ssldetails.status}</div>
            </div>
            {/if}
            {if $ssldetails.expirydate}
            <div class="col-sm-6 col-md-4">
              <div class="text-muted small">{$LANG.expiry}</div>
              <div class="fw-medium">{$ssldetails.expirydate}</div>
            </div>
            {/if}
            {if $ssldetails.cert}
            <div class="col-12">
              <label class="form-label fw-medium">{$LANG.sslcertificate}</label>
              <textarea class="form-control font-monospace" rows="8" readonly>{$ssldetails.cert}</textarea>
            </div>
            {/if}
            {if $ssldetails.cabundle}
            <div class="col-12">
              <label class="form-label fw-medium">{$LANG.sslcabundle}</label>
              <textarea class="form-control font-monospace" rows="8" readonly>{$ssldetails.cabundle}</textarea>
            </div>
            {/if}
          </div>
        {/if}

        {if $reconfigurelink}
        <a href="{$reconfigurelink}" class="btn btn-primary rounded-pill px-4">
          <i class="bi bi-arrow-repeat me-2"></i>{$LANG.sslreconfigure}
        </a>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
