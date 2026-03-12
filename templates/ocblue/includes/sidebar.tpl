<div class="sidebar-card card">
  {* User info *}
  <div class="sidebar-user-info">
    <div class="sidebar-avatar">
      {$clientsdetails.firstname|truncate:1:"":true}{$clientsdetails.lastname|truncate:1:"":true}
    </div>
    <div class="sidebar-user-name">{$clientsdetails.firstname} {$clientsdetails.lastname}</div>
    <div class="sidebar-user-email">{$clientsdetails.email}</div>
  </div>

  {* Navigation *}
  <nav class="sidebar-nav">
    <ul class="list-unstyled mb-0">
      <li>
        <a href="{$WEB_ROOT}/clientarea.php" class="sidebar-link {if $templatefile eq 'clientareahome'}active{/if}">
          <i class="bi bi-speedometer2"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li>
        <a href="{$WEB_ROOT}/clientarea.php?action=services" class="sidebar-link {if $templatefile eq 'clientarea' and $action eq 'services'}active{/if}">
          <i class="bi bi-server"></i>
          <span>{$LANG.navMyServices}</span>
        </a>
      </li>
      <li>
        <a href="{$WEB_ROOT}/clientarea.php?action=domains" class="sidebar-link {if $templatefile eq 'domainlist'}active{/if}">
          <i class="bi bi-globe"></i>
          <span>{$LANG.navMyDomains}</span>
        </a>
      </li>
      <li>
        <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="sidebar-link {if $templatefile eq 'invoices'}active{/if}">
          <i class="bi bi-receipt"></i>
          <span>{$LANG.navBilling}</span>
        </a>
      </li>
      <li>
        <a href="{$WEB_ROOT}/supporttickets.php" class="sidebar-link {if $templatefile eq 'supporttickets'}active{/if}">
          <i class="bi bi-headset"></i>
          <span>{$LANG.navSupport}</span>
        </a>
      </li>
      <li>
        <a href="{$WEB_ROOT}/knowledgebase.php" class="sidebar-link {if $templatefile eq 'knowledgebase'}active{/if}">
          <i class="bi bi-book"></i>
          <span>Knowledgebase</span>
        </a>
      </li>
      <li>
        <a href="{$WEB_ROOT}/announcements.php" class="sidebar-link {if $templatefile eq 'announcements'}active{/if}">
          <i class="bi bi-megaphone"></i>
          <span>Announcements</span>
        </a>
      </li>
    </ul>

    <hr class="sidebar-divider">

    <div class="sidebar-section-label">Settings</div>
    <ul class="list-unstyled mb-0">
      <li>
        <a href="{$WEB_ROOT}/clientarea.php?action=details" class="sidebar-link {if $templatefile eq 'clientdetails'}active{/if}">
          <i class="bi bi-person-gear"></i>
          <span>{$LANG.mydetails}</span>
        </a>
      </li>
      <li>
        <a href="{$WEB_ROOT}/clientarea.php?action=security" class="sidebar-link {if $templatefile eq 'security'}active{/if}">
          <i class="bi bi-shield-lock"></i>
          <span>Security Settings</span>
        </a>
      </li>
    </ul>
  </nav>
</div>
