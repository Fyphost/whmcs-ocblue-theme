{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-5 col-md-7">
    <div class="dashboard-card animate-on-scroll text-center">
      <div class="dashboard-card-body py-5">
        <i class="bi bi-envelope-check display-1 text-primary mb-4 d-block"></i>
        <h2 class="fw-bold mb-3">{$LANG.userverifyemail}</h2>
        <p class="text-muted mb-4">{$LANG.userverifyemaildesc}</p>

        {if $verified}
          <div class="alert alert-success mb-4" role="alert">
            <i class="bi bi-check-circle me-2"></i>{$LANG.userverifyemailsuccess}
          </div>
          <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-speedometer2 me-2"></i>{$LANG.clientareadashboard}
          </a>
        {else}
          <form method="post" action="{$smarty.server.PHP_SELF}">
            {if $token}<input type="hidden" name="token" value="{$token}">{/if}
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-check-circle me-2"></i>{$LANG.userverifyemailbtn}
            </button>
          </form>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
