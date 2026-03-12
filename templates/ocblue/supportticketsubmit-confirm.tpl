{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll text-center">
      <div class="dashboard-card-body py-5">
        <i class="bi bi-check-circle display-1 text-success mb-4 d-block"></i>
        <h2 class="fw-bold mb-3">{$LANG.supportticketsubmit}</h2>
        <p class="text-muted mb-1">
          {$LANG.ticketid}: <strong>#{$ticketid}</strong>
        </p>
        <p class="text-muted mb-4">{$LANG.supportticketsubmitconfirmdesc}</p>
        <div class="d-flex flex-wrap justify-content-center gap-2">
          <a href="{$WEB_ROOT}/viewticket.php?tid={$ticketid}&c={$ticketc}"
             class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-ticket me-2"></i>{$LANG.viewticket}
          </a>
          <a href="{$WEB_ROOT}/supporttickets.php" class="btn btn-outline-secondary rounded-pill px-4">
            <i class="bi bi-headset me-2"></i>{$LANG.supportticketslist}
          </a>
        </div>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
