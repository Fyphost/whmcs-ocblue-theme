{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-x-circle me-2 text-danger"></i>{$LANG.cancellationrequest}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="alert alert-warning mb-4" role="alert">
          <i class="bi bi-exclamation-triangle me-2"></i>
          {$LANG.cancellationrequestwarning}
        </div>

        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$serviceid}">
          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.cancellationtype}</label>
            <select name="type" class="form-select">
              <option value="Immediate">{$LANG.cancellationtypeimmediate}</option>
              <option value="End of Billing Period">{$LANG.cancellationtypeendofbillingperiod}</option>
            </select>
          </div>
          <div class="mb-4">
            <label class="form-label fw-medium">{$LANG.cancellationreason}</label>
            <textarea name="reason" rows="4" class="form-control" placeholder="{$LANG.cancellationreasonplaceholder}"></textarea>
          </div>
          <div class="d-flex flex-wrap gap-2">
            <button type="submit" class="btn btn-danger rounded-pill px-4">
              <i class="bi bi-x-circle me-2"></i>{$LANG.requestcancellation}
            </button>
            <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$serviceid}"
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
