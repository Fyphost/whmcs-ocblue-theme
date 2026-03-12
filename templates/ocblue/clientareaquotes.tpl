{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header">
        <h5 class="mb-0"><i class="bi bi-file-text me-2 text-primary"></i>{$LANG.clientareaquotes}</h5>
      </div>
      <div class="dashboard-card-body">
        {if $quotes}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>{$LANG.quoteid}</th>
                  <th>{$LANG.quotesubject}</th>
                  <th>{$LANG.quotestage}</th>
                  <th>{$LANG.quotetotal}</th>
                  <th>{$LANG.quoteexpirationdate}</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$quotes item=quote}
                <tr>
                  <td><strong>#{$quote.id}</strong></td>
                  <td>{$quote.subject}</td>
                  <td>
                    {if $quote.stage eq 'Accepted'}
                      <span class="badge badge-active">{$quote.stage}</span>
                    {elseif $quote.stage eq 'Delivered'}
                      <span class="badge bg-info text-white">{$quote.stage}</span>
                    {elseif $quote.stage eq 'Draft'}
                      <span class="badge badge-pending">{$quote.stage}</span>
                    {else}
                      <span class="badge bg-secondary">{$quote.stage}</span>
                    {/if}
                  </td>
                  <td>{$quote.total}</td>
                  <td>{$quote.expirationdate}</td>
                  <td class="text-end">
                    <a href="{$WEB_ROOT}/viewquote.php?qid={$quote.id}&qhash={$quote.hash}"
                       class="btn btn-xs btn-outline-primary rounded-pill">
                      <i class="bi bi-eye me-1"></i>{$LANG.view}
                    </a>
                  </td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-file-text empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.clientareanorecords}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
