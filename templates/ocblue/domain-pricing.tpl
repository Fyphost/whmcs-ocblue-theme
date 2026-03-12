{include file="$template/header.tpl"}

<div class="dashboard-card animate-on-scroll mb-4">
  <div class="dashboard-card-header">
    <h5 class="mb-0"><i class="bi bi-globe me-2 text-primary"></i>{$LANG.domainpricing}</h5>
  </div>
  <div class="dashboard-card-body">

    {* Search *}
    <form method="get" action="{$smarty.server.PHP_SELF}" class="mb-4">
      <div class="input-group">
        <input type="text" name="search" class="form-control"
               placeholder="{$LANG.domainsearchplaceholder}"
               value="{$search}">
        <button class="btn btn-primary" type="submit">
          <i class="bi bi-search"></i>
        </button>
      </div>
    </form>

    {* TLD categories *}
    {if $categories}
    <ul class="nav nav-tabs mb-3 flex-nowrap overflow-x-auto" id="tldTabs">
      {foreach from=$categories item=cat key=catKey}
      <li class="nav-item">
        <a class="nav-link text-nowrap {if $catKey@first}active{/if}"
           href="#{$catKey|replace:' ':'-'}" data-bs-toggle="tab">{$cat}</a>
      </li>
      {/foreach}
    </ul>
    {/if}

    {if $domainpricing}
    <div class="table-responsive">
      <table class="table dashboard-table mb-0">
        <thead>
          <tr>
            <th>{$LANG.tld}</th>
            <th class="text-center">{$LANG.domainregperiod}</th>
            <th class="text-center">{$LANG.register}</th>
            <th class="text-center">{$LANG.domainstransfer}</th>
            <th class="text-center">{$LANG.domainsrenewal}</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$domainpricing item=tld}
          <tr>
            <td><strong>{$tld.tld}</strong></td>
            <td class="text-center">{$tld.regperiod}</td>
            <td class="text-center">{$tld.register}</td>
            <td class="text-center">{$tld.transfer}</td>
            <td class="text-center">{$tld.renew}</td>
            <td class="text-end">
              <a href="{$WEB_ROOT}/cart.php?a=add&domain=register&query=example{$tld.tld}"
                 class="btn btn-xs btn-primary rounded-pill">{$LANG.order}</a>
            </td>
          </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
    {else}
      <div class="empty-state">
        <i class="bi bi-globe empty-state-icon"></i>
        <p class="empty-state-text">{$LANG.clientareanorecords}</p>
      </div>
    {/if}
  </div>
</div>

{include file="$template/footer.tpl"}
