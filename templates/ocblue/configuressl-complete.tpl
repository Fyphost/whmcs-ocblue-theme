{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">

    {* SSL Configuration Complete *}
    <div class="dashboard-card animate-on-scroll text-center">
      <div class="dashboard-card-body py-5">
        <i class="bi bi-patch-check display-1 text-success mb-4 d-block"></i>
        <h2 class="fw-bold mb-3">{$LANG.sslcertconfigcomplete}</h2>
        <p class="text-muted mb-4">{$LANG.sslcertconfigcompletedesc}</p>
        <div class="d-flex flex-wrap justify-content-center gap-2">
          <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$serviceid}"
             class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-arrow-left me-2"></i>{$LANG.returntoservice}
          </a>
          <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-outline-secondary rounded-pill px-4">
            <i class="bi bi-house me-2"></i>{$LANG.clientareadashboard}
          </a>
        </div>
      </div>
    </div>

  </div>
</div>

{include file="$template/footer.tpl"}
