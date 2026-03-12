{include file="$template/header.tpl"}

<div class="row g-4">
  {* Sidebar *}
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  {* Main content *}
  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-person-plus me-2 text-primary"></i>{$LANG.clientareanavaddcontact}</h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{routePath('account-contacts-save')}">
          <input type="hidden" name="contactid" value="new">

          <div class="row g-3 mb-4">
            <div class="col-12">
              <h6 class="fw-semibold text-primary border-bottom pb-2">
                <i class="bi bi-person me-2"></i>{$LANG.clientareacontactdetails}
              </h6>
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareafirstname}</label>
              <input type="text" name="firstname" value="{$formdata.firstname}" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientarealastname}</label>
              <input type="text" name="lastname" value="{$formdata.lastname}" class="form-control">
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareaemail}</label>
              <input type="email" name="email" value="{$formdata.email}" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareaphonenumber}</label>
              <input type="tel" name="phonenumber" value="{$formdata.phonenumber}" class="form-control">
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareacompanyname}</label>
              <input type="text" name="companyname" value="{$formdata.companyname}" class="form-control">
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareaaddress1}</label>
              <input type="text" name="address1" value="{$formdata.address1}" class="form-control">
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareaaddress2}</label>
              <input type="text" name="address2" value="{$formdata.address2}" class="form-control">
            </div>
            <div class="col-md-4">
              <label class="form-label fw-medium">{$LANG.clientareacity}</label>
              <input type="text" name="city" value="{$formdata.city}" class="form-control">
            </div>
            <div class="col-md-4">
              <label class="form-label fw-medium">{$LANG.clientareastate}</label>
              <input type="text" name="state" value="{$formdata.state}" class="form-control">
            </div>
            <div class="col-md-4">
              <label class="form-label fw-medium">{$LANG.clientareapostcode}</label>
              <input type="text" name="postcode" value="{$formdata.postcode}" class="form-control">
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareacountry}</label>
              {$formdata.countriesdropdown}
            </div>
          </div>

          {* Email permissions *}
          {if $formdata.emailprefs}
          <div class="mb-4">
            <h6 class="fw-semibold text-primary border-bottom pb-2">
              <i class="bi bi-envelope me-2"></i>{$LANG.clientareacontactsemails}
            </h6>
            <div class="row g-2 mt-2">
              {foreach from=$formdata.emailprefs key=pref item=checked}
              <div class="col-md-4">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="emailprefs[{$pref}]"
                         id="pref_{$pref}" value="on"{if $checked} checked{/if}>
                  <label class="form-check-label" for="pref_{$pref}">
                    {lang key="contactEmailPreferences."|cat:$pref}
                  </label>
                </div>
              </div>
              {/foreach}
            </div>
          </div>
          {/if}

          <div class="d-flex gap-2">
            <button type="submit" name="save" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-plus-circle me-2"></i>{$LANG.clientareanavaddcontact}
            </button>
            <a href="{$WEB_ROOT}/clientarea.php?action=contacts" class="btn btn-outline-secondary rounded-pill px-4">
              <i class="bi bi-x-lg me-2"></i>{$LANG.clientareacancel}
            </a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
