{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-7 col-xl-6 mx-auto">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-envelope me-2 text-primary"></i>{$LANG.contactus}</h5>
      </div>
      <div class="dashboard-card-body">

        {if $successmessage}
        <div class="alert alert-success" role="alert">
          <i class="bi bi-check-circle me-2"></i>{$successmessage}
        </div>
        {/if}
        {if $errormessage}
        <div class="alert alert-danger" role="alert">
          <i class="bi bi-exclamation-circle me-2"></i>{$errormessage}
        </div>
        {/if}

        <form method="post" action="{$WEB_ROOT}/contact.php">
          <input type="hidden" name="token" value="{$token}">

          <div class="row g-3 mb-3">
            <div class="col-sm-6">
              <label for="inputName" class="form-label fw-medium">{$LANG.contactname} <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="inputName" name="name"
                     value="{$contactdetails.name|default:''}" required>
            </div>
            <div class="col-sm-6">
              <label for="inputEmail" class="form-label fw-medium">{$LANG.contactemail} <span class="text-danger">*</span></label>
              <input type="email" class="form-control" id="inputEmail" name="email"
                     value="{$contactdetails.email|default:''}" required>
            </div>
          </div>

          <div class="mb-3">
            <label for="inputSubject" class="form-label fw-medium">{$LANG.contactsubject} <span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="inputSubject" name="subject"
                   value="{$contactdetails.subject|default:''}" required>
          </div>

          <div class="mb-3">
            <label for="inputMessage" class="form-label fw-medium">{$LANG.contactmessage} <span class="text-danger">*</span></label>
            <textarea class="form-control" id="inputMessage" name="message" rows="6" required>{$contactdetails.message|default:''}</textarea>
          </div>

          {if $captchahtml}
          <div class="mb-3">{$captchahtml}</div>
          {/if}

          <button type="submit" name="submit" class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-send me-2"></i>{$LANG.contactsubmit}
          </button>
        </form>
      </div>
    </div>

    {* Company info *}
    {if $contactdetails.address or $contactdetails.phone or $contactdetails.email}
    <div class="dashboard-card mt-4 animate-on-scroll">
      <div class="dashboard-card-header">
        <h6 class="mb-0"><i class="bi bi-info-circle me-2 text-primary"></i>Contact Information</h6>
      </div>
      <div class="dashboard-card-body">
        <ul class="list-unstyled mb-0">
          {if $contactdetails.address}
          <li class="d-flex gap-2 mb-2">
            <i class="bi bi-geo-alt text-primary mt-1 flex-shrink-0"></i>
            <span>{$contactdetails.address}</span>
          </li>
          {/if}
          {if $contactdetails.phone}
          <li class="d-flex gap-2 mb-2">
            <i class="bi bi-telephone text-primary mt-1 flex-shrink-0"></i>
            <a href="tel:{$contactdetails.phone}" class="text-decoration-none">{$contactdetails.phone}</a>
          </li>
          {/if}
          {if $contactdetails.email}
          <li class="d-flex gap-2">
            <i class="bi bi-envelope text-primary mt-1 flex-shrink-0"></i>
            <a href="mailto:{$contactdetails.email}" class="text-decoration-none">{$contactdetails.email}</a>
          </li>
          {/if}
        </ul>
      </div>
    </div>
    {/if}
  </div>
</div>

{include file="$template/footer.tpl"}
