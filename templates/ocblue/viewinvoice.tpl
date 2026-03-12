{include file="$template/header.tpl"}

<div class="row g-4">
  {* Sidebar *}
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  {* Main content *}
  <div class="col-lg-9">

    {* Payment status alerts *}
    {if $paymentSuccessAwaitingNotification}
    <div class="alert alert-success alert-dismissible fade show mb-3" role="alert">
      <i class="bi bi-check-circle me-2"></i>{$LANG.invoicePaymentSuccessAwaitingNotify}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {elseif $paymentSuccess}
    <div class="alert alert-success alert-dismissible fade show mb-3" role="alert">
      <i class="bi bi-check-circle me-2"></i>{$LANG.invoicepaymentsuccessconfirmation}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {elseif $paymentFailed}
    <div class="alert alert-danger alert-dismissible fade show mb-3" role="alert">
      <i class="bi bi-exclamation-circle me-2"></i>{$LANG.invoicepaymentfailedconfirmation}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {elseif $pendingReview}
    <div class="alert alert-info alert-dismissible fade show mb-3" role="alert">
      <i class="bi bi-info-circle me-2"></i>{$LANG.invoicepaymentpendingreview}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {elseif $paymentInititated}
    <div class="alert alert-info alert-dismissible fade show mb-3" role="alert">
      <i class="bi bi-info-circle me-2"></i>{$LANG.invoicePaymentInitiated}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    {/if}

    {* Invoice header card *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <div class="d-flex align-items-center gap-2">
          <h5 class="mb-0"><i class="bi bi-receipt me-2 text-primary"></i>{$pagetitle}</h5>
          {if $status eq 'Paid'}
            <span class="badge badge-paid">Paid</span>
          {elseif $status eq 'Unpaid'}
            <span class="badge badge-unpaid">Unpaid</span>
          {elseif $status eq 'Cancelled'}
            <span class="badge badge-cancelled">Cancelled</span>
          {elseif $status eq 'Refunded'}
            <span class="badge badge-info">Refunded</span>
          {elseif $status eq 'Draft'}
            <span class="badge badge-pending">Draft</span>
          {else}
            <span class="badge badge-pending">{$status}</span>
          {/if}
        </div>
        <div class="d-flex gap-2">
          <a href="{$WEB_ROOT}/dl.php?type=i&id={$invoiceid}" target="_blank"
             class="btn btn-sm btn-outline-secondary rounded-pill">
            <i class="bi bi-download me-1"></i>Download PDF
          </a>
          <a href="#" onclick="window.print()" class="btn btn-sm btn-outline-secondary rounded-pill">
            <i class="bi bi-printer me-1"></i>Print
          </a>
        </div>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-3">
          <div class="col-md-6">
            <div class="invoice-section-label">Pay To</div>
            <address class="mb-0 invoice-address">
              {$payto}
              {if $taxCode}<br>{$taxIdLabel}: {$taxCode}{/if}
            </address>
          </div>
          <div class="col-md-6">
            <div class="invoice-section-label">Bill To</div>
            <address class="mb-0 invoice-address">
              {if $clientsdetails.companyname}{$clientsdetails.companyname}<br>{/if}
              {$clientsdetails.firstname} {$clientsdetails.lastname}<br>
              {$clientsdetails.address1}{if $clientsdetails.address2}, {$clientsdetails.address2}{/if}<br>
              {$clientsdetails.city}, {$clientsdetails.state} {$clientsdetails.postcode}<br>
              {$clientsdetails.country}
              {if $clientsdetails.tax_id}<br>{$taxIdLabel}: {$clientsdetails.tax_id}{/if}
            </address>
          </div>
          <div class="col-md-4">
            <div class="invoice-meta-item">
              <span class="invoice-meta-label">{$LANG.invoicesdatecreated}</span>
              <span class="invoice-meta-value">{$date}</span>
            </div>
          </div>
          {if $status eq 'Unpaid' or $status eq 'Draft'}
          <div class="col-md-4">
            <div class="invoice-meta-item">
              <span class="invoice-meta-label">{$LANG.invoicesdatedue}</span>
              <span class="invoice-meta-value text-danger fw-semibold">{$datedue}</span>
            </div>
          </div>
          {/if}
          {if $status neq 'Unpaid'}
          <div class="col-md-4">
            <div class="invoice-meta-item">
              <span class="invoice-meta-label">{$LANG.orderpaymentmethod}</span>
              <span class="invoice-meta-value">{$paymentmethod}{if $paymethoddisplayname} ({$paymethoddisplayname}){/if}</span>
            </div>
          </div>
          {/if}
        </div>
      </div>
    </div>

    {* Line items *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-list-ul me-2 text-primary"></i>{$LANG.invoicelineitems}</h5>
      </div>
      <div class="dashboard-card-body p-0">
        <div class="table-responsive">
          <table class="table dashboard-table mb-0">
            <thead>
              <tr>
                <th>{$LANG.invoicesdescription}</th>
                <th class="text-end">{$LANG.invoicesamount}</th>
              </tr>
            </thead>
            <tbody>
              {foreach from=$invoiceitems item=item}
              <tr>
                <td>{$item.description}{if $item.taxed eq "true"} <span class="text-muted small">*</span>{/if}</td>
                <td class="text-end">{$item.amount}</td>
              </tr>
              {/foreach}
            </tbody>
            <tfoot>
              <tr class="invoice-subtotal-row">
                <td class="text-end fw-medium">{$LANG.invoicessubtotal}</td>
                <td class="text-end fw-medium">{$subtotal}</td>
              </tr>
              {if $taxname}
              <tr class="invoice-subtotal-row">
                <td class="text-end">{$taxrate}% {$taxname}</td>
                <td class="text-end">{$tax}</td>
              </tr>
              {/if}
              {if $taxname2}
              <tr class="invoice-subtotal-row">
                <td class="text-end">{$taxrate2}% {$taxname2}</td>
                <td class="text-end">{$tax2}</td>
              </tr>
              {/if}
              {if $credit}
              <tr class="invoice-subtotal-row">
                <td class="text-end">{$LANG.invoicescredit}</td>
                <td class="text-end">{$credit}</td>
              </tr>
              {/if}
              <tr class="invoice-total-row">
                <td class="text-end fw-bold fs-5">{$LANG.invoicestotal}</td>
                <td class="text-end fw-bold fs-5 text-primary">{$total}</td>
              </tr>
            </tfoot>
          </table>
        </div>
        {if $taxrate}
        <div class="px-3 py-2 text-muted small">* {$LANG.invoicestaxindicator}</div>
        {/if}
      </div>
    </div>

    {* Transactions *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-arrow-left-right me-2 text-primary"></i>{$LANG.invoicestransactions}</h5>
      </div>
      <div class="dashboard-card-body p-0">
        <div class="table-responsive">
          <table class="table dashboard-table mb-0">
            <thead>
              <tr>
                <th>{$LANG.networkissuesdate}</th>
                <th>{$LANG.invoicestransgateway}</th>
                <th>{$LANG.invoicestransid}</th>
                <th class="text-end">{$LANG.invoicestransamount}</th>
              </tr>
            </thead>
            <tbody>
              {foreach from=$transactions item=transaction}
              <tr>
                <td>{$transaction.date}</td>
                <td>{$transaction.gateway}</td>
                <td>{$transaction.transid}</td>
                <td class="text-end">{$transaction.amount}</td>
              </tr>
              {foreachelse}
              <tr>
                <td colspan="4" class="text-center text-muted py-3">{$LANG.invoicestransnonefound}</td>
              </tr>
              {/foreach}
            </tbody>
            <tfoot>
              <tr class="invoice-total-row">
                <td colspan="3" class="text-end fw-bold">{$LANG.invoicesbalance}</td>
                <td class="text-end fw-bold text-primary">{$balance}</td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>

    {* Notes *}
    {if $notes}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-sticky me-2 text-primary"></i>{$LANG.invoicesnotes}</h5>
      </div>
      <div class="dashboard-card-body">
        <p class="mb-0">{$notes}</p>
      </div>
    </div>
    {/if}

    {* Pay now section *}
    {if $status eq 'Unpaid' or $status eq 'Draft'}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-credit-card me-2 text-primary"></i>{$LANG.makepayment}</h5>
      </div>
      <div class="dashboard-card-body">
        <div class="d-flex align-items-center justify-content-between flex-wrap gap-3 mb-3">
          <div>
            <div class="invoice-meta-label">{$LANG.invoicestotaldue}</div>
            <div class="fs-3 fw-bold text-primary">{$balance}</div>
          </div>
          {if $allowchangegateway}
          <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}" class="d-flex align-items-center gap-2">
            <label class="form-label mb-0 fw-medium">{$LANG.orderpaymentmethod}:</label>
            {$gatewaydropdown}
          </form>
          {/if}
        </div>
        <div class="payment-btn-container">
          {$paymentbutton}
        </div>
      </div>
    </div>
    {/if}

  </div>{* /col-lg-9 *}
</div>{* /row *}

{include file="$template/footer.tpl"}
