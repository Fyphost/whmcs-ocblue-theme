{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0">
          <i class="bi bi-hdd-network me-2 text-primary"></i>{$LANG.domainsDnsManagement}
          {if $domain}<span class="text-muted fw-normal small ms-1">— {$domain}</span>{/if}
        </h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="id" value="{$domainid}">

          <div class="table-responsive mb-3">
            <table class="table dashboard-table" id="dnsRecordsTable">
              <thead>
                <tr>
                  <th>{$LANG.dnsmanagementhost}</th>
                  <th>{$LANG.dnsmanagementtype}</th>
                  <th>{$LANG.dnsmanagementvalue}</th>
                  <th>{$LANG.dnsmanagementttl}</th>
                  <th style="width:50px"></th>
                </tr>
              </thead>
              <tbody>
                {if $dnsrecords}
                  {foreach from=$dnsrecords item=record name=dnsloop}
                  <tr>
                    <td>
                      <input type="text" name="dnsrecords[{$smarty.foreach.dnsloop.index}][hostname]"
                             value="{$record.hostname}" class="form-control form-control-sm">
                    </td>
                    <td>
                      <select name="dnsrecords[{$smarty.foreach.dnsloop.index}][type]" class="form-select form-select-sm">
                        {foreach from=$dnstypes item=dnstype}
                        <option value="{$dnstype}"{if $dnstype eq $record.type} selected{/if}>{$dnstype}</option>
                        {/foreach}
                      </select>
                    </td>
                    <td>
                      <input type="text" name="dnsrecords[{$smarty.foreach.dnsloop.index}][address]"
                             value="{$record.address}" class="form-control form-control-sm">
                    </td>
                    <td>
                      <input type="number" name="dnsrecords[{$smarty.foreach.dnsloop.index}][ttl]"
                             value="{$record.ttl}" class="form-control form-control-sm" style="width:90px">
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
