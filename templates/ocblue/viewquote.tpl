{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">

    {* Quote header *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <div class="d-flex align-items-center gap-2">
          <h5 class="mb-0"><i class="bi bi-file-text me-2 text-primary"></i>{$pagetitle}</h5>
          {if $stage eq 'Accepted'}
            <span class="badge badge-active">{$stage}</span>
          {elseif $stage eq 'Delivered'}
            <span class="badge bg-info text-white">{$stage}</span>
          {else}
            <span class="badge badge-pending">{$stage}</span>
          {/if}
        </div>
        <div class="d-flex gap-2">
          <a href="{$WEB_ROOT}/dl.php?type=q&id={$quoteid}" target="_blank"
             class="btn btn-sm btn-outline-secondary rounded-pill">
            <i class="bi bi-download me-1"></i>{$LANG.downloadpdf}
          </a>
        </div>
      </div>
      <div class="dashboard-card-body">
        <div class="row g-3">
          <div class="col-md-6">
            <div class="text-muted small">{$LANG.quotecreateddate}</div>
            <div class="fw-medium">{$datecreated}</div>
          </div>
          {if $expirationdate}
          <div class="col-md-6">
            <div class="text-muted small">{$LANG.quoteexpirationdate}</div>
            <div class="fw-medium">{$expirationdate}</div>
          </div>
          {/if}
          {if $validuntil}
          <div class="col-md-6">
            <div class="text-muted small">{$LANG.quotevaliduntil}</div>
            <div class="fw-medium">{$validuntil}</div>
          </div>
          {/if}
        </div>
      </div>
    </div>

    {* Line items *}
    <div class="dashboard-card mb-4 animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-list-ul me-2 text-primary"></i>{$LANG.quotelineitems}</h5>
      </div>
      <div class="dashboard-card-body p-0">
        <div class="table-responsive">
          <table class="table dashboard-table mb-0">
            <thead>
              <tr>
                <th>{$LANG.invoicesdescription}</th>
                <th class="text-center">{$LANG.quoteqty}</th>
                <th class="text-end">{$LANG.quoteunitprice}</th>
                <th class="text-end">{$LANG.invoicesamount}</th>
              </tr>
            </thead>
            <tbody>
              {foreach from=$lineitems item=item}
              <tr>
                <td>{$item.description}</td>
                <td class="text-center">{$item.qty}</td>
                <td class="text-end">{$item.unitprice}</td>
                <td class="text-end">{$item.amount}</td>
              </tr>
              {/foreach}
            </tbody>
            <tfoot>
              <tr class="invoice-subtotal-row">
                <td colspan="3" class="text-end fw-medium">{$LANG.invoicessubtotal}</td>
                <td class="text-end fw-medium">{$subtotal}</td>
              </tr>
              {if $tax}
              <tr class="invoice-subtotal-row">
                <td colspan="3" class="text-end">{$taxname}</td>
                <td class="text-end">{$tax}</td>
              </tr>
              {/if}
              <tr class="invoice-total-row">
                <td colspan="3" class="text-end fw-bold fs-5">{$LANG.invoicestotal}</td>
                <td class="text-end fw-bold fs-5 text-primary">{$total}</td>
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

    {* Accept/Decline *}
    {if $stage eq 'Delivered'}
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-check-circle me-2 text-primary"></i>{$LANG.quotedecision}</h5>
      </div>
      <div class="dashboard-card-body">
        <form method="post" action="{$smarty.server.PHP_SELF}">
          <input type="hidden" name="qid" value="{$quoteid}">
          <input type="hidden" name="hash" value="{$quotehash}">
          <div class="d-flex flex-wrap gap-2">
            <button type="submit" name="accept" class="btn btn-primary rounded-pill px-4">
              <i class="bi bi-check-lg me-2"></i>{$LANG.quoteaccept}
            </button>
            <button type="submit" name="decline"
                    class="btn btn-outline-danger rounded-pill px-4">
              <i class="bi bi-x-lg me-2"></i>{$LANG.quotedecline}
            </button>
          </div>
        </form>
      </div>
    </div>
    {/if}

  </div>
</div>

{include file="$template/footer.tpl"}
