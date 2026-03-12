<!DOCTYPE html>
<html lang="{$lang}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{$pagetitle} — {$companyname}</title>
  <style>
    body { font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #333; margin: 0; padding: 20px; }
    .invoice-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 24px; }
    .company-name { font-size: 20px; font-weight: bold; color: #0066cc; }
    .invoice-title { font-size: 24px; font-weight: bold; text-align: right; }
    .invoice-meta { margin-bottom: 20px; }
    .addresses { display: flex; gap: 40px; margin-bottom: 20px; }
    .address-block { flex: 1; }
    .address-label { font-weight: bold; border-bottom: 2px solid #0066cc; padding-bottom: 4px; margin-bottom: 8px; }
    table { width: 100%; border-collapse: collapse; margin-bottom: 16px; }
    th { background: #0066cc; color: #fff; padding: 8px; text-align: left; }
    td { padding: 6px 8px; border-bottom: 1px solid #eee; }
    .text-right { text-align: right; }
    .total-row td { font-weight: bold; font-size: 14px; border-top: 2px solid #0066cc; }
    .footer { margin-top: 30px; text-align: center; color: #888; font-size: 11px; }
  </style>
</head>
<body>

<div class="invoice-header">
  <div>
    {if $logourl}
      <img src="{$logourl}" alt="{$companyname}" height="48">
    {else}
      <div class="company-name">{$companyname}</div>
    {/if}
    <div style="margin-top:6px">{$payto}</div>
  </div>
  <div class="invoice-title">
    {$LANG.invoiceinvoice}
    <div style="font-size:14px; font-weight:normal;"># {$invoicenum}</div>
    <div style="font-size:12px; font-weight:normal; margin-top:4px;">
      {$LANG.invoicesdatecreated}: {$date}
    </div>
    {if $status eq 'Unpaid'}
    <div style="font-size:12px; font-weight:normal;">
      {$LANG.invoicesdatedue}: {$datedue}
    </div>
    {/if}
    <div style="margin-top:8px; display:inline-block; padding:4px 12px; background:
      {if $status eq 'Paid'}#28a745
      {elseif $status eq 'Unpaid'}#dc3545
      {else}#6c757d
      {/if}; color:#fff; border-radius:4px; font-size:12px;">
      {$status}
    </div>
  </div>
</div>

<div class="addresses">
  <div class="address-block">
    <div class="address-label">{$LANG.invoicebilltofrom}</div>
    {$payto}
  </div>
  <div class="address-block">
    <div class="address-label">{$LANG.invoicebillto}</div>
    {if $clientsdetails.companyname}{$clientsdetails.companyname}<br>{/if}
    {$clientsdetails.firstname} {$clientsdetails.lastname}<br>
    {$clientsdetails.address1}{if $clientsdetails.address2}, {$clientsdetails.address2}{/if}<br>
    {$clientsdetails.city}, {$clientsdetails.state} {$clientsdetails.postcode}<br>
    {$clientsdetails.country}
  </div>
</div>

<table>
  <thead>
    <tr>
      <th>{$LANG.invoicesdescription}</th>
      <th class="text-right">{$LANG.invoicesamount}</th>
    </tr>
  </thead>
  <tbody>
    {foreach from=$invoiceitems item=item}
    <tr>
      <td>{$item.description}{if $item.taxed eq "true"} *{/if}</td>
      <td class="text-right">{$item.amount}</td>
    </tr>
    {/foreach}
  </tbody>
  <tfoot>
    <tr>
      <td class="text-right">{$LANG.invoicessubtotal}</td>
      <td class="text-right">{$subtotal}</td>
    </tr>
    {if $taxname}
    <tr>
      <td class="text-right">{$taxrate}% {$taxname}</td>
      <td class="text-right">{$tax}</td>
    </tr>
    {/if}
    {if $taxname2}
    <tr>
      <td class="text-right">{$taxrate2}% {$taxname2}</td>
      <td class="text-right">{$tax2}</td>
    </tr>
    {/if}
    {if $credit}
    <tr>
      <td class="text-right">{$LANG.invoicescredit}</td>
      <td class="text-right">-{$credit}</td>
    </tr>
    {/if}
    <tr class="total-row">
      <td class="text-right">{$LANG.invoicestotal}</td>
      <td class="text-right" style="color:#0066cc">{$total}</td>
    </tr>
  </tfoot>
</table>

{if $notes}
<div style="margin-top:16px; padding:12px; background:#f8f9fa; border-left:4px solid #0066cc;">
  <strong>{$LANG.invoicesnotes}:</strong><br>{$notes}
</div>
{/if}

<div class="footer">
  <p>{$companyname} &mdash; Powered by WHMCS</p>
</div>

</body>
</html>
