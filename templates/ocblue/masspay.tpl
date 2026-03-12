{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-receipt me-2 text-primary"></i>{$LANG.masspay}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $invoices}
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <div class="table-responsive mb-4">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th style="width:40px">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="selectAll"
                             onclick="document.querySelectorAll('.inv-cb').forEach(c=>c.checked=this.checked)">
                    </div>
                  </th>
                  <th>{$LANG.invoicestable.invoicenum}</th>
                  <th>{$LANG.invoicestable.duedate}</th>
                  <th class="text-end">{$LANG.invoicesamount}</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$invoices item=invoice}
                <tr>
                  <td>
                    <div class="form-check">
                      <input class="form-check-input inv-cb" type="checkbox"
                             name="invoices[]" value="{$invoice.id}" checked>
                    </div>
                  </td>
                  <td>
                    <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}">#{$invoice.invoicenum}</a>
                  </td>
                  <td>{$invoice.duedate}</td>
                  <td class="text-end fw-medium">{$invoice.total}</td>
                </tr>
                {/foreach}
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="3" class="text-end fw-bold">{$LANG.invoicestotal}</td>
                  <td class="text-end fw-bold text-primary" id="massPayTotal">{$totaldue}</td>
                </tr>
              </tfoot>
            </table>
          </div>

          <div class="mb-3">
            <label class="form-label fw-medium">{$LANG.orderpaymentmethod}</label>
            {$gatewaydropdown}
          </div>

          <button type="submit" class="btn btn-primary rounded-pill px-4">
            <i class="bi bi-credit-card me-2"></i>{$LANG.payselectedinvoices}
          </button>
        </form>
        {else}
          <div class="empty-state">
            <i class="bi bi-receipt empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.invoicesnone}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
