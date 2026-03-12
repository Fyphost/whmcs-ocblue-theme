{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0">
          <i class="bi bi-envelope-at me-2 text-primary"></i>{$LANG.domainsEmailForwarding}
          {if $domain}<span class="text-muted fw-normal small ms-1">— {$domain}</span>{/if}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$domainid}">

          <div class="table-responsive mb-3">
            <table class="table dashboard-table" id="emailForwardTable">
              <thead>
                <tr>
                  <th>{$LANG.emailforwardingprefix}</th>
                  <th></th>
                  <th>{$LANG.emailforwardingforwardto}</th>
                  <th style="width:50px"></th>
                </tr>
              </thead>
              <tbody>
                {if $emailforwarding}
                  {foreach from=$emailforwarding item=forward name=fwdloop}
                  <tr>
                    <td>
                      <div class="input-group">
                        <input type="text" name="prefix[{$smarty.foreach.fwdloop.index}]"
                               value="{$forward.prefix}" class="form-control form-control-sm">
                        <span class="input-group-text small">@{$domain}</span>
                      </div>
                    </td>
                    <td><i class="bi bi-arrow-right text-muted"></i></td>
                    <td>
                      <input type="email" name="forwardto[{$smarty.foreach.fwdloop.index}]"
                             value="{$forward.forwardto}" class="form-control form-control-sm">
                    </td>
                    <td>
                      <button type="button" class="btn btn-xs btn-outline-danger rounded-circle"
                              onclick="this.closest('tr').remove()">
                        <i class="bi bi-trash"></i>
                      </button>
                    </td>
                  </tr>
                  {/foreach}
                {/if}
              </tbody>
            </table>
          </div>

          <div class="d-flex flex-wrap gap-2">
            <button type="submit" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-check-lg me-2"></i>{$LANG.clientareasavechanges}
            </button>
            <a href="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}"
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
