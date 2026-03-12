{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-star me-2 text-primary"></i>{$LANG.ticketfeedback}</h5>
      </div>
      <div class="dashboard-card-body">
        <p class="text-muted mb-4">{$LANG.ticketfeedbackdesc}</p>
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="tid" value="{$ticketid}">

          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.ticketfeedbackrating}</label>
            <div class="d-flex gap-2 flex-wrap">
              {for $i=1 to 5}
              <div class="form-check">
                <input class="form-check-input" type="radio" name="rating" value="{$i}"
                       id="rating{$i}"{if $i eq 5} checked{/if}>
                <label class="form-check-label" for="rating{$i}">
                  {$i} <i class="bi bi-star{if $i le 3}-fill{/if} text-warning"></i>
                </label>
              </div>
              {/for}
            </div>
          </div>

          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.ticketfeedbackcomments}</label>
            <textarea name="comments" rows="4" class="form-control"
                      placeholder="{$LANG.ticketfeedbackcommentsplaceholder}"></textarea>
          </div>

          <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-send me-2"></i>{$LANG.submitfeedback}
            </button>
            <a href="{$WEB_ROOT}/viewticket.php?tid={$ticketid}&c={$ticketc}"
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
