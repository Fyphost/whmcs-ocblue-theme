{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-5 col-md-7">
    <div class="dashboard-card animate-on-scroll text-center">
      <div class="dashboard-card-body py-5">
        <i class="bi bi-person-check display-1 text-primary mb-4 d-block"></i>
        <h2 class="fw-bold mb-3">{$LANG.userinviteaccept}</h2>
        <p class="text-muted mb-4">{$LANG.userinviteacceptdesc}</p>

        {if $inviteDetails}
        <div class="border rounded-3 p-3 text-start mb-4">
          <div class="mb-2">
            <span class="text-muted small">{$LANG.company}:</span>
            <strong class="ms-2">{$inviteDetails.companyname}</strong>
          </div>
          <div>
            <span class="text-muted small">{$LANG.clientareaemail}:</span>
            <strong class="ms-2">{$inviteDetails.email}</strong>
          </div>
        </div>
        {/if}

        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="token" value="{$token}">
          <div class="d-flex flex-wrap justify-content-center gap-2">
            <button type="submit" name="accept" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-check-lg me-2"></i>{$LANG.userinviteacceptbtn}
            </button>
            <button type="submit" name="decline" class="btn btn-outline-danger rounded-pill px-4">
              <i class="bi bi-x-lg me-2"></i>{$LANG.userinvitedeclinebtn}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
