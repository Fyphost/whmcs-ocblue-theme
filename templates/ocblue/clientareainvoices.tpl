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
        <h5 class="mb-0"><i class="bi bi-receipt me-2 text-primary"></i>{$LANG.clientareainvoices}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $invoices}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>{$LANG.invoicesnumber}</th>
                  <th>{$LANG.invoicesdate}</th>
                  <th>{$LANG.invoicesduedate}</th>
                  <th>{$LANG.invoicestotal}</th>
                  <th>{$LANG.invoicesstatus}</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$invoices item=invoice}
                <tr>
                  <td><strong>#{$invoice.invoicenum}</strong></td>
                  <td>{$invoice.date}</td>
                  <td>{$invoice.duedate}</td>
                  <td>{$invoice.total}</td>
                  <td>
                    {if $invoice.status eq 'Paid'}
                      <span class="badge badge-paid">Paid</span>
                    {elseif $invoice.status eq 'Unpaid'}
                      <span class="badge badge-unpaid">Unpaid</span>
                    {elseif $invoice.status eq 'Cancelled'}
                      <span class="badge badge-cancelled">Cancelled</span>
                    {elseif $invoice.status eq 'Refunded'}
                      <span class="badge badge-info">Refunded</span>
                    {else}
                      <span class="badge badge-pending">{$invoice.status}</span>
                    {/if}
                  </td>
                  <td class="text-end">
                    <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}"
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
            <i class="bi bi-receipt empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.clientareanorecords}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>{* /col-lg-9 *}
</div>{* /row *}

{include file="$template/footer.tpl"}
