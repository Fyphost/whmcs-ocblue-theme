{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-6 col-md-8">
    <div class="dashboard-card animate-on-scroll text-center">
      <div class="dashboard-card-body py-5">
        <i class="bi bi-ban display-1 text-danger mb-4 d-block"></i>
        <h2 class="fw-bold mb-3">{$LANG.banned}</h2>
        <p class="text-muted mb-4">{$LANG.bannedmessage}</p>
        <a href="{$WEB_ROOT}/contact.php" class="btn btn-primary rounded-pill px-4">
          <i class="bi bi-envelope me-2"></i>{$LANG.contactus}
        </a>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
