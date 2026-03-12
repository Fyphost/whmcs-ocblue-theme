{include file="$template/header.tpl"}

<div class="row g-4">
  {* Sidebar *}
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  {* Main content *}
  <div class="col-lg-9">

    {if $successful}
    <div class="alert alert-success alert-dismissible fade show" role="alert">
      <i class="bi bi-check-circle me-2"></i>{$LANG.changessavedsuccessfully}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {/if}

    {if $errormessage}
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <i class="bi bi-exclamation-circle me-2"></i>{$errormessage}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {/if}

    {if in_array('state', $optionalFields)}
    <script>var stateNotRequired = true;</script>
    {/if}
    <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

    <form method="post" action="?action=details">

      {* Personal Information *}
      <div class="dashboard-card mb-4 animate-on-scroll">
        <div class="dashboard-card-header">
          <h5 class="mb-0"><i class="bi bi-person me-2 text-primary"></i>{$LANG.orderForm.personalInformation}</h5>
        </div>
        <div class="dashboard-card-body">
          <div class="row g-3">
            <div class="col-md-6">
              <label for="inputFirstName" class="form-label fw-medium">{$LANG.clientareafirstname}</label>
              <input type="text" name="firstname" id="inputFirstName" value="{$clientfirstname}"
                     {if in_array('firstname', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            <div class="col-md-6">
              <label for="inputLastName" class="form-label fw-medium">{$LANG.clientarealastname}</label>
              <input type="text" name="lastname" id="inputLastName" value="{$clientlastname}"
                     {if in_array('lastname', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            <div class="col-md-6">
              <label for="inputEmail" class="form-label fw-medium">{$LANG.clientareaemail}</label>
              <input type="email" name="email" id="inputEmail" value="{$clientemail}"
                     {if in_array('email', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            <div class="col-md-6">
              <label for="inputPhone" class="form-label fw-medium">{$LANG.clientareaphonenumber}</label>
              <input type="tel" name="phonenumber" id="inputPhone" value="{$clientphonenumber}"
                     {if in_array('phonenumber', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            <div class="col-md-6">
              <label for="inputAccountLanguage" class="form-label fw-medium">{$LANG.clientarealanguage}</label>
              <select name="accountLanguage" id="inputAccountLanguage" class="form-select"
                      {if in_array('language', $uneditablefields)}disabled{/if}>
                <option value="">{lang key='default'}</option>
                {foreach $languages as $language}
                  <option value="{$language}"{if $language eq $clientLanguage} selected{/if}>{$language|ucfirst}</option>
                {/foreach}
              </select>
            </div>
          </div>
        </div>
      </div>

      {* Billing Address *}
      <div class="dashboard-card mb-4 animate-on-scroll">
        <div class="dashboard-card-header">
          <h5 class="mb-0"><i class="bi bi-geo-alt me-2 text-primary"></i>{$LANG.orderForm.billingAddress}</h5>
        </div>
        <div class="dashboard-card-body">
          <div class="row g-3">
            <div class="col-md-6">
              <label for="inputCompanyName" class="form-label fw-medium">{$LANG.clientareacompanyname}</label>
              <input type="text" name="companyname" id="inputCompanyName" value="{$clientcompanyname}"
                     {if in_array('companyname', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            {if $showTaxIdField}
            <div class="col-md-6">
              <label for="inputTaxId" class="form-label fw-medium">{lang key=$taxIdLabel}</label>
              <input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$clientTaxId}"
                     {if in_array('tax_id', $uneditablefields)}readonly{/if}>
            </div>
            {/if}
            <div class="col-md-6">
              <label for="inputAddress1" class="form-label fw-medium">{$LANG.clientareaaddress1}</label>
              <input type="text" name="address1" id="inputAddress1" value="{$clientaddress1}"
                     {if in_array('address1', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            <div class="col-md-6">
              <label for="inputAddress2" class="form-label fw-medium">{$LANG.clientareaaddress2}</label>
              <input type="text" name="address2" id="inputAddress2" value="{$clientaddress2}"
                     {if in_array('address2', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            <div class="col-md-4">
              <label for="inputCity" class="form-label fw-medium">{$LANG.clientareacity}</label>
              <input type="text" name="city" id="inputCity" value="{$clientcity}"
                     {if in_array('city', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            <div class="col-md-4">
              <label for="inputState" class="form-label fw-medium">{$LANG.clientareastate}</label>
              <input type="text" name="state" id="inputState" value="{$clientstate}"
                     {if in_array('state', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            <div class="col-md-4">
              <label for="inputPostcode" class="form-label fw-medium">{$LANG.clientareapostcode}</label>
              <input type="text" name="postcode" id="inputPostcode" value="{$clientpostcode}"
                     {if in_array('postcode', $uneditablefields)}readonly{/if}
                     class="form-control">
            </div>
            <div class="col-md-6">
              <label for="country" class="form-label fw-medium">{$LANG.clientareacountry}</label>
              {$clientcountriesdropdown}
            </div>
            <div class="col-md-6">
              <label for="inputPaymentMethod" class="form-label fw-medium">{$LANG.paymentmethod}</label>
              <select name="paymentmethod" id="inputPaymentMethod" class="form-select">
                <option value="none">{$LANG.paymentmethoddefault}</option>
                {foreach from=$paymentmethods item=method}
                  <option value="{$method.sysname}"{if $method.sysname eq $defaultpaymentmethod} selected{/if}>{$method.name}</option>
                {/foreach}
              </select>
            </div>
          </div>
        </div>
      </div>

      {* Custom Fields *}
      {if $customfields}
      <div class="dashboard-card mb-4 animate-on-scroll">
        <div class="dashboard-card-header">
          <h5 class="mb-0"><i class="bi bi-card-list me-2 text-primary"></i>{$LANG.additionalInfo}</h5>
        </div>
        <div class="dashboard-card-body">
          <div class="row g-3">
            {foreach from=$customfields key=num item=customfield}
            <div class="col-md-6">
              {if $customfield.type eq 'tickbox'}
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="customfield{$customfield.id}" name="customfield[{$customfield.id}]" value="on"{if $customfield.value} checked{/if}>
                  <label class="form-check-label" for="customfield{$customfield.id}">{$customfield.name}</label>
                  {if $customfield.description}<div class="form-text">{$customfield.description}</div>{/if}
                </div>
              {else}
                <label class="form-label fw-medium" for="customfield{$customfield.id}">{$customfield.name}</label>
                {$customfield.input}
                {if $customfield.description}<div class="form-text">{$customfield.description}</div>{/if}
              {/if}
            </div>
            {/foreach}
          </div>
        </div>
      </div>
      {/if}

      {* Email Preferences *}
      {if $emailPreferencesEnabled}
      <div class="dashboard-card mb-4 animate-on-scroll">
        <div class="dashboard-card-header">
          <h5 class="mb-0"><i class="bi bi-envelope me-2 text-primary"></i>{$LANG.clientareacontactsemails}</h5>
        </div>
        <div class="dashboard-card-body">
          <div class="row g-2">
            {foreach $emailPreferences as $emailType => $value}
            <div class="col-md-6">
              <div class="form-check">
                <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                <input class="form-check-input" type="checkbox" name="email_preferences[{$emailType}]"
                       id="{$emailType}Emails" value="1"{if $value} checked{/if}>
                <label class="form-check-label" for="{$emailType}Emails">
                  {lang key="emailPreferences."|cat:$emailType}
                </label>
              </div>
            </div>
            {/foreach}
          </div>
        </div>
      </div>
      {/if}

      {* Actions *}
      <div class="d-flex gap-2 animate-on-scroll">
        <button type="submit" name="save" class="btn btn-primary rounded-pill px-4">
          <i class="bi bi-check-lg me-2"></i>{$LANG.clientareasavechanges}
        </button>
        <button type="reset" class="btn btn-outline-secondary rounded-pill px-4">
          <i class="bi bi-x-lg me-2"></i>{$LANG.clientareacancel}
        </button>
      </div>

    </form>
  </div>{* /col-lg-9 *}
</div>{* /row *}

{include file="$template/footer.tpl"}
