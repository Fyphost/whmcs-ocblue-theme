{include file="$template/header.tpl"}

<div class="row justify-content-center">
  <div class="col-lg-6 col-md-8">
    <div class="dashboard-card animate-on-scroll text-center">
      <div class="dashboard-card-body py-5">
        <i class="bi bi-arrow-left-right display-1 text-warning mb-4 d-block"></i>
        <h2 class="fw-bold mb-3">{$LANG.userswitchaccountforced}</h2>
        <p class="text-muted mb-4">{$LANG.userswitchaccountforceddesc}</p>
        <form method="post" action="{$smarty.server.PHP_SELF}">
          {if $accounts}
          <div class="mb-4 text-start">
            <label class="form-label fw-medium">{$LANG.selectaccount}</label>
            <select name="accountid" class="form-select">
              {foreach from=$accounts item=account}
              <option value="{$account.id}">{$account.companyname} — {$account.email}</option>
              {/foreach}
            </select>
          </div>
          {/if}
          <button type="submit" class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-arrow-right me-2"></i>{$LANG.userswitchnow}
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
