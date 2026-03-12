{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-6 col-md-8">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header text-center">
        <h5 class="mb-0"><i class="bi bi-shield-lock me-2 text-primary"></i>{$LANG.3dsecure}</h5>
      </div>
      <div class="dashboard-card-body text-center">
        <p class="mb-4">{$LANG.3dsecuredesc}</p>
        {$form}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
