{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-6 col-md-8">
    <div class="dashboard-card animate-on-scroll text-center">
      <div class="dashboard-card-body py-5">
        <meta http-equiv="refresh" content="3;url={$forwardurl}">
        <i class="bi bi-arrow-right-circle display-1 text-primary mb-4 d-block"></i>
        <h2 class="fw-bold mb-3">{$LANG.forwardpage}</h2>
        <p class="text-muted mb-4">{$LANG.forwardpagedesc}</p>
        <a href="{$forwardurl}" class="btn btn-primary rounded-pill px-4">
          <i class="bi bi-arrow-right me-2"></i>{$LANG.continue}
        </a>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
