{include file="$template/header.tpl"}

{if $tweets}
<div class="dashboard-card animate-on-scroll">
  <div class="dashboard-card-header">
    <h5 class="mb-0"><i class="fab fa-x-twitter me-2 text-primary"></i>Twitter Feed</h5>
  </div>
  <div class="dashboard-card-body">
    <div class="list-group list-group-flush">
      {foreach from=$tweets item=tweet}
      <div class="list-group-item border-0 border-bottom px-0 py-3">
        <p class="mb-1">{$tweet.text}</p>
        <small class="text-muted"><i class="bi bi-clock me-1"></i>{$tweet.created_at}</small>
      </div>
      {/foreach}
    </div>
  </div>
</div>
{/if}

{include file="$template/footer.tpl"}
