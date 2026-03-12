<!DOCTYPE html>
<html lang="{$lang}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{$pagetitle} — {$companyname}</title>
  <style>
    body { font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #333; margin: 0; padding: 20px; }
    .quote-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 24px; }
    .company-name { font-size: 20px; font-weight: bold; color: #0066cc; }
    .quote-title { font-size: 24px; font-weight: bold; text-align: right; }
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

<div class="quote-header">
  <div>
    {if $logourl}
      <img src="{$logourl}" alt="{$companyname}" height="48">
    {else}
      <div class="company-name">{$companyname}</div>
    {/if}
    <div style="margin-top:6px">{$companyname}</div>
  </div>
  <div class="quote-title">
    {$LANG.quotequote}
    <div style="font-size:14px; font-weight:normal;"># {$quoteid}</div>
    <div style="font-size:12px; font-weight:normal; margin-top:4px;">
      {$LANG.quotecreateddate}: {$datecreated}
    </div>
    {if $expirationdate}
    <div style="font-size:12px; font-weight:normal;">
      {$LANG.quoteexpirationdate}: {$expirationdate}
    </div>
    {/if}
  </div>
</div>

{if $subject}
<h2 style="font-size:16px; color:#0066cc; margin-bottom:16px;">{$subject}</h2>
{/if}

<div class="addresses">
  <div class="address-block">
    <div class="address-label">{$LANG.quotefrom}</div>
    {$companyname}
  </div>
  <div class="address-block">
    <div class="address-label">{$LANG.quoteto}</div>
    {if $clientdetails.companyname}{$clientdetails.companyname}<br>{/if}
    {$clientdetails.firstname} {$clientdetails.lastname}<br>
    {$clientdetails.address1}{if $clientdetails.address2}, {$clientdetails.address2}{/if}<br>
    {$clientdetails.city}, {$clientdetails.state} {$clientdetails.postcode}<br>
    {$clientdetails.country}
  </div>
</div>

<table>
  <thead>
    <tr>
      <th>{$LANG.invoicesdescription}</th>
      <th class="text-right">{$LANG.quoteqty}</th>
      <th class="text-right">{$LANG.quoteunitprice}</th>
      <th class="text-right">{$LANG.invoicesamount}</th>
    </tr>
  </thead>
  <tbody>
    {foreach from=$lineitems item=item}
    <tr>
      <td>{$item.description}</td>
      <td class="text-right">{$item.qty}</td>
      <td class="text-right">{$item.unitprice}</td>
      <td class="text-right">{$item.amount}</td>
    </tr>
    {/foreach}
  </tbody>
  <tfoot>
    <tr>
      <td colspan="3" class="text-right">{$LANG.invoicessubtotal}</td>
      <td class="text-right">{$subtotal}</td>
    </tr>
    {if $tax}
    <tr>
      <td colspan="3" class="text-right">{$taxname}</td>
      <td class="text-right">{$tax}</td>
    </tr>
    {/if}
    <tr class="total-row">
      <td colspan="3" class="text-right">{$LANG.invoicestotal}</td>
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
