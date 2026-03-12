{include file="$template/header.tpl"}

<div class="row g-4">
  {* Sidebar *}
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  {* Main content *}
  <div class="col-lg-9">

    {* Welcome card *}
    <div class="welcome-card mb-4 animate-on-scroll">
      <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
        <div>
          <h2 class="welcome-title">Welcome back, {$clientsdetails.firstname}! 👋</h2>
          <p class="welcome-subtitle mb-0">Here's an overview of your account.</p>
        </div>
        <a href="{$WEB_ROOT}/cart.php" class="btn btn-light rounded-pill px-4 fw-semibold">
          <i class="bi bi-plus-circle me-2"></i>Order New Service
        </a>
      </div>
    </div>

    {* Stats row *}
    <div class="row g-3 mb-4">
      <div class="col-sm-6 col-xl-3 animate-on-scroll">
        <div class="dashboard-stat-card stat-primary">
          <div class="stat-icon-wrap">
            <i class="bi bi-server"></i>
          </div>
          <div class="stat-value">{$clientsstats.numactiveproducts}</div>
          <div class="stat-desc">Active Services</div>
        </div>
      </div>
      <div class="col-sm-6 col-xl-3 animate-on-scroll">
        <div class="dashboard-stat-card stat-success">
          <div class="stat-icon-wrap">
            <i class="bi bi-globe"></i>
          </div>
          <div class="stat-value">{$clientsstats.numactivedomains}</div>
          <div class="stat-desc">Active Domains</div>
        </div>
      </div>
      <div class="col-sm-6 col-xl-3 animate-on-scroll">
        <div class="dashboard-stat-card stat-warning">
          <div class="stat-icon-wrap">
            <i class="bi bi-ticket-perforated"></i>
          </div>
          <div class="stat-value">{$clientsstats.numopentickets}</div>
          <div class="stat-desc">Open Tickets</div>
        </div>
      </div>
      <div class="col-sm-6 col-xl-3 animate-on-scroll">
        <div class="dashboard-stat-card stat-danger">
          <div class="stat-icon-wrap">
            <i class="bi bi-receipt"></i>
          </div>
          <div class="stat-value">{$clientsstats.numunpaidinvoices}</div>
          <div class="stat-desc">Unpaid Invoices</div>
        </div>
      </div>
    </div>

    {* Recent Invoices *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0"><i class="bi bi-receipt me-2 text-primary"></i>Recent Invoices</h5>
        <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="btn btn-sm btn-outline-primary rounded-pill">View All</a>
      </div>
      <div class="dashboard-card-body">
        {if $invoices}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>Invoice #</th>
                  <th>Date</th>
                  <th>Total</th>
                  <th>Status</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$invoices item=invoice}
                <tr>
                  <td><strong>#{$invoice.invoicenum}</strong></td>
                  <td>{$invoice.date}</td>
                  <td>{$invoice.total}</td>
                  <td>
                    {if $invoice.status eq 'Paid'}
                      <span class="badge badge-paid">Paid</span>
                    {elseif $invoice.status eq 'Unpaid'}
                      <span class="badge badge-unpaid">Unpaid</span>
                    {elseif $invoice.status eq 'Cancelled'}
                      <span class="badge badge-cancelled">Cancelled</span>
                    {else}
                      <span class="badge badge-pending">{$invoice.status}</span>
                    {/if}
                  </td>
                  <td class="text-end">
                    <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}" class="btn btn-xs btn-outline-primary rounded-pill">
                      View
                    </a>
                  </td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-receipt empty-state-icon"></i>
            <p class="empty-state-text">No invoices found.</p>
          </div>
        {/if}
      </div>
    </div>

    {* Support Tickets *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0"><i class="bi bi-headset me-2 text-primary"></i>Support Tickets</h5>
        <a href="{$WEB_ROOT}/supporttickets.php" class="btn btn-sm btn-outline-primary rounded-pill">View All</a>
      </div>
      <div class="dashboard-card-body">
        {if $tickets}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>Ticket #</th>
                  <th>Department</th>
                  <th>Status</th>
                  <th>Last Updated</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$tickets item=ticket}
                <tr>
                  <td>
                    <a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&c={$ticket.c}" class="fw-semibold text-primary">
                      #{$ticket.tid}
                    </a>
                    <div class="small text-muted text-truncate" style="max-width:200px">{$ticket.subject}</div>
                  </td>
                  <td>{$ticket.deptname}</td>
                  <td>
                    {if $ticket.status eq 'Open'}
                      <span class="badge badge-open">Open</span>
                    {elseif $ticket.status eq 'Answered'}
                      <span class="badge badge-answered">Answered</span>
                    {elseif $ticket.status eq 'Closed'}
                      <span class="badge badge-closed">Closed</span>
                    {else}
                      <span class="badge badge-pending">{$ticket.status}</span>
                    {/if}
                  </td>
                  <td>{$ticket.lastreply}</td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-headset empty-state-icon"></i>
            <p class="empty-state-text">No support tickets found.</p>
            <a href="{$WEB_ROOT}/submitticket.php" class="btn btn-primary btn-sm rounded-pill px-3">
              <i class="bi bi-plus-circle me-1"></i>Open Ticket
            </a>
          </div>
        {/if}
      </div>
    </div>

    {* Active Services *}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0"><i class="bi bi-server me-2 text-primary"></i>Active Services</h5>
        <a href="{$WEB_ROOT}/clientarea.php?action=services" class="btn btn-sm btn-outline-primary rounded-pill">View All</a>
      </div>
      <div class="dashboard-card-body">
        {if $services}
          <div class="row g-3">
            {foreach from=$services item=service}
            <div class="col-md-6">
              <div class="service-item">
                <div class="service-icon-box">
                  <i class="bi bi-server"></i>
                </div>
                <div class="service-details">
                  <div class="service-name">{$service.product}</div>
                  <div class="service-domain">{$service.domain}</div>
                </div>
                <div class="service-status ms-auto">
                  {if $service.status eq 'Active'}
                    <span class="badge badge-active">Active</span>
                  {elseif $service.status eq 'Suspended'}
                    <span class="badge badge-suspended">Suspended</span>
                  {else}
                    <span class="badge badge-pending">{$service.status}</span>
                  {/if}
                </div>
              </div>
            </div>
            {/foreach}
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-server empty-state-icon"></i>
            <p class="empty-state-text">No active services found.</p>
            <a href="{$WEB_ROOT}/cart.php" class="btn btn-primary btn-sm rounded-pill px-3">
              <i class="bi bi-plus-circle me-1"></i>Order Now
            </a>
          </div>
        {/if}
      </div>
    </div>

  </div>{* /col-lg-9 *}
</div>{* /row *}

{include file="$template/footer.tpl"}
