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
        <h5 class="mb-0"><i class="bi bi-server me-2 text-primary"></i>{$LANG.clientareaproducts}</h5>
        <a href="{$WEB_ROOT}/cart.php" class="btn btn-primary btn-sm rounded-pill">
          <i class="bi bi-plus-circle me-1"></i>Order New
        </a>
      </div>
      <div class="dashboard-card-body">
        {if $products}
          <div class="row g-3">
            {foreach from=$products item=product}
            <div class="col-md-6">
              <div class="service-item">
                <div class="service-icon-box">
                  <i class="bi bi-server"></i>
                </div>
                <div class="service-details flex-grow-1">
                  <div class="service-name">{$product.name}</div>
                  <div class="service-domain">{$product.domain}</div>
                  {if $product.nextduedate}
                  <div class="service-due small text-muted mt-1">
                    <i class="bi bi-calendar me-1"></i>Due: {$product.nextduedate}
                  </div>
                  {/if}
                </div>
                <div class="d-flex flex-column align-items-end gap-2">
                  {if $product.status eq 'Active'}
                    <span class="badge badge-active">Active</span>
                  {elseif $product.status eq 'Suspended'}
                    <span class="badge badge-suspended">Suspended</span>
                  {elseif $product.status eq 'Terminated'}
                    <span class="badge badge-cancelled">Terminated</span>
                  {else}
                    <span class="badge badge-pending">{$product.status}</span>
                  {/if}
                  <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$product.id}"
                     class="btn btn-xs btn-outline-primary rounded-pill">
                    <i class="bi bi-eye me-1"></i>Manage
                  </a>
                </div>
              </div>
            </div>
            {/foreach}
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-server empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.clientareanorecords}</p>
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
