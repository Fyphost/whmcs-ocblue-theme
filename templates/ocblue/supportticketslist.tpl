{include file="$template/header.tpl"}

<div class="row g-4">
  {* Sidebar *}
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  {* Main content *}
  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0"><i class="bi bi-headset me-2 text-primary"></i>{$LANG.supporttickets}</h5>
        <a href="{$WEB_ROOT}/submitticket.php" class="btn btn-primary btn-sm rounded-pill">
          <i class="bi bi-plus-circle me-1"></i>{$LANG.supportopenticket}
        </a>
      </div>
      <div class="dashboard-card-body">
        {if $tickets}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>{$LANG.ticketsdepartment}</th>
                  <th>{$LANG.ticketssubject}</th>
                  <th>{$LANG.ticketsstatus}</th>
                  <th>{$LANG.ticketslastupdate}</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$tickets item=ticket}
                <tr>
                  <td>{$ticket.deptname}</td>
                  <td>
                    <a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&c={$ticket.c}"
                       class="fw-semibold text-primary text-decoration-none">
                      #{$ticket.tid}
                    </a>
                    <div class="small text-muted text-truncate" style="max-width:220px">{$ticket.subject}</div>
                  </td>
                  <td>
                    {if $ticket.status eq 'Open'}
                      <span class="badge badge-open">Open</span>
                    {elseif $ticket.status eq 'Answered'}
                      <span class="badge badge-answered">Answered</span>
                    {elseif $ticket.status eq 'Customer-Reply'}
                      <span class="badge badge-warning">Customer Reply</span>
                    {elseif $ticket.status eq 'Closed'}
                      <span class="badge badge-closed">Closed</span>
                    {elseif $ticket.status eq 'On Hold'}
                      <span class="badge badge-pending">On Hold</span>
                    {else}
                      <span class="badge badge-pending">{$ticket.status}</span>
                    {/if}
                  </td>
                  <td>{$ticket.lastreply}</td>
                  <td class="text-end">
                    <a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&c={$ticket.c}"
                       class="btn btn-xs btn-outline-primary rounded-pill">
                      <i class="bi bi-eye me-1"></i>View
                    </a>
                  </td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-headset empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.clientareanorecords}</p>
            <a href="{$WEB_ROOT}/submitticket.php" class="btn btn-primary btn-sm rounded-pill px-3">
              <i class="bi bi-plus-circle me-1"></i>Open Ticket
            </a>
          </div>
        {/if}
      </div>
    </div>
  </div>{* /col-lg-9 *}
</div>{* /row *}

{include file="$template/footer.tpl"}
