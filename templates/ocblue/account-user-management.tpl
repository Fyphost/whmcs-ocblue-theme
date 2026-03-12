{include file="$template/header.tpl"}

<div class="row g-4">
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  <div class="col-lg-9">
    <div class="dashboard-card animate-on-scroll">
      <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
        <h5 class="mb-0">
          <i class="bi bi-people me-2 text-primary"></i>{$LANG.usermanagement}
        </h5>
        {if $inviteUrl}
        <a href="{$inviteUrl}" class="btn btn-primary btn-sm rounded-pill">
          <i class="bi bi-person-plus me-1"></i>{$LANG.userinvite}
        </a>
        {/if}
      </div>
      <div class="dashboard-card-body">
        {if $users}
          <div class="table-responsive">
            <table class="table dashboard-table mb-0">
              <thead>
                <tr>
                  <th>{$LANG.user}</th>
                  <th>{$LANG.clientareaemail}</th>
                  <th>{$LANG.userpermissions}</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$users item=user}
                <tr>
                  <td>
                    <div class="fw-semibold">{$user.firstname} {$user.lastname}</div>
                    {if $user.owner}<span class="badge bg-primary-subtle text-primary small">{$LANG.userisowner}</span>{/if}
                  </td>
                  <td>{$user.email}</td>
                  <td>
                    {if $user.permissions eq 'all'}
                      <span class="badge bg-success-subtle text-success">{$LANG.userpermissionsall}</span>
                    {else}
                      <span class="badge bg-secondary-subtle text-secondary">{$LANG.userpermissionslimited}</span>
                    {/if}
                  </td>
                  <td class="text-end">
                    <div class="d-flex justify-content-end gap-1">
                      {if $user.permissionsUrl}
                      <a href="{$user.permissionsUrl}" class="btn btn-xs btn-outline-primary rounded-pill">
                        <i class="bi bi-shield me-1"></i>{$LANG.userpermissions}
                      </a>
                      {/if}
                      {if !$user.owner and $user.deleteUrl}
                      <a href="{$user.deleteUrl}"
                         class="btn btn-xs btn-outline-danger rounded-pill"
                         onclick="return confirm('{$LANG.userremoveconfirm}')">
                        <i class="bi bi-trash"></i>
                      </a>
                      {/if}
                    </div>
                  </td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        {else}
          <div class="empty-state">
            <i class="bi bi-people empty-state-icon"></i>
            <p class="empty-state-text">{$LANG.usernonemsg}</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{include file="$template/footer.tpl"}
