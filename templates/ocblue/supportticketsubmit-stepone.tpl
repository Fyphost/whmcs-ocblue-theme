{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0">
          <i class="bi bi-headset me-2 text-primary"></i>{$LANG.supportticketsubmit}
          <span class="badge bg-primary ms-2">Step 1 of 2</span>
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">

          {if !$loggedin}
          <div class="row g-3 mb-4">
            <div class="col-12">
              <h6 class="fw-semibold text-primary border-bottom pb-2">
                <i class="bi bi-person me-2"></i>{$LANG.yourdetails}
              </h6>
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareafirstname}</label>
              <input type="text" name="name" value="{$name}" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label fw-medium">{$LANG.clientareaemail}</label>
              <input type="email" name="email" value="{$email}" class="form-control" required>
            </div>
          </div>
          {/if}

          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.supportdepartment}</label>
            <select name="deptid" id="deptSelect" class="form-select" required>
              <option value="">{$LANG.choosedept}</option>
              {foreach from=$departments item=dept}
              <option value="{$dept.id}"{if $dept.id eq $deptid} selected{/if}>{$dept.name}</option>
              {/foreach}
            </select>
          </div>

          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.supportticketrelatedservice}</label>
            {if $services}
            <select name="serviceid" class="form-select">
              <option value="">{$LANG.none}</option>
              {foreach from=$services item=service}
              <option value="s_{$service.id}"{if $service.id eq $serviceid} selected{/if}>{$service.product} — {$service.domain}</option>
              {/foreach}
              {foreach from=$domains item=domain}
              <option value="d_{$domain.id}"{if $domain.id eq $domainid} selected{/if}>{$domain.domain}</option>
              {/foreach}
            </select>
            {else}
            <input type="hidden" name="serviceid" value="">
            <p class="text-muted small">{$LANG.none}</p>
            {/if}
          </div>

          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.supportticketsubject}</label>
            <input type="text" name="subject" value="{$subject}" class="form-control" required
                   placeholder="{$LANG.supportticketsubject}">
          </div>

          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.supportmessage}</label>
            <textarea name="message" rows="8" class="form-control" required
                      placeholder="{$LANG.supportmessage}">{$message}</textarea>
          </div>

          {if $priorityoptions}
          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.supportticketpriority}</label>
            <select name="priority" class="form-select">
              {foreach from=$priorityoptions item=p}
              <option value="{$p.value}"{if $p.selected} selected{/if}>{$p.name}</option>
              {/foreach}
            </select>
          </div>
          {/if}

          {if $captchahtml}
          <div class="mb-3">
            {$captchahtml}
          </div>
          {/if}

          <div class="d-flex flex-wrap gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              {$LANG.continue} <i class="bi bi-arrow-right ms-2"></i>
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
