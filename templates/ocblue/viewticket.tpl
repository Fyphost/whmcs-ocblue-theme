{include file="$template/header.tpl"}

<div class="row g-4">
  {* Sidebar *}
  <div class="col-lg-3 d-none d-lg-block">
    {include file="$template/includes/sidebar.tpl"}
  </div>

  {* Main content *}
  <div class="col-lg-9">

    {if $invalidTicketId}
    <div class="alert alert-danger" role="alert">
      <i class="bi bi-exclamation-triangle me-2"></i>{$LANG.supportticketinvalid}
    </div>
    {else}
      {if $closedticket}
      <div class="alert alert-info alert-dismissible fade show mb-3" role="alert">
        <i class="bi bi-info-circle me-2"></i>{$LANG.supportticketclosedmsg}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      {/if}
      {if $errormessage}
      <div class="alert alert-danger alert-dismissible fade show mb-3" role="alert">
        <i class="bi bi-exclamation-circle me-2"></i>{$errormessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      {/if}

      {* Ticket info header *}
      <div class="dashboard-card mb-4 animate-on-scroll">
        <div class="dashboard-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
          <h5 class="mb-0"><i class="bi bi-headset me-2 text-primary"></i>Ticket #{$tid}</h5>
          {if $status eq 'Open'}
            <span class="badge badge-open">Open</span>
          {elseif $status eq 'Answered'}
            <span class="badge badge-answered">Answered</span>
          {elseif $status eq 'Closed'}
            <span class="badge badge-closed">Closed</span>
          {elseif $status eq 'Customer-Reply'}
            <span class="badge badge-warning">Customer Reply</span>
          {else}
            <span class="badge badge-pending">{$status}</span>
          {/if}
        </div>
        <div class="dashboard-card-body">
          <div class="row g-3">
            <div class="col-sm-6 col-md-3">
              <div class="invoice-meta-label">{$LANG.supportticketsticketsubject}</div>
              <div class="fw-semibold">{$subject}</div>
            </div>
            <div class="col-sm-6 col-md-3">
              <div class="invoice-meta-label">{$LANG.supportticketsdepartment}</div>
              <div class="fw-semibold">{$department}</div>
            </div>
            <div class="col-sm-6 col-md-3">
              <div class="invoice-meta-label">{$LANG.supportticketspriority}</div>
              <div class="fw-semibold">{$urgency}</div>
            </div>
            <div class="col-sm-6 col-md-3">
              <div class="invoice-meta-label">{$LANG.supportticketsticketid}</div>
              <div class="fw-semibold">#{$tid}</div>
            </div>
          </div>
        </div>
      </div>

      {* Ticket replies *}
      {foreach from=$descreplies key=num item=reply}
      <div class="ticket-reply-card mb-3 {if $reply.admin}ticket-reply-staff{/if} animate-on-scroll">
        <div class="ticket-reply-header">
        <div class="ticket-reply-avatar {if $reply.admin}ticket-reply-avatar-staff{/if}">
          {$reply.name|truncate:1:"":true}
        </div>
          <div class="flex-grow-1">
            <div class="fw-semibold">{$reply.name}</div>
            <div class="small text-muted">{$reply.date}</div>
          </div>
          {if $reply.admin}
          <span class="badge badge-info">
            <i class="bi bi-patch-check me-1"></i>Staff
          </span>
          {/if}
        </div>
        <div class="ticket-reply-body">
          {$reply.message}
        </div>
        {if $reply.attachments}
        <div class="ticket-reply-attachments">
          <div class="small text-muted mb-1"><i class="bi bi-paperclip me-1"></i>Attachments:</div>
          {foreach from=$reply.attachments item=attachment}
          <a href="{$attachment.viewurl}" class="btn btn-xs btn-outline-secondary rounded-pill me-1 mb-1" target="_blank">
            <i class="bi bi-file-earmark me-1"></i>{$attachment.filename}
          </a>
          {/foreach}
        </div>
        {/if}
      </div>
      {/foreach}

      {* Reply form *}
      {if !$closedticket}
      <div class="dashboard-card animate-on-scroll">
        <div class="dashboard-card-header" id="replyToggle" role="button" data-bs-toggle="collapse"
             data-bs-target="#replyBox" aria-expanded="true" style="cursor:pointer;">
          <h5 class="mb-0 d-flex justify-content-between">
            <span><i class="bi bi-reply me-2 text-primary"></i>{$LANG.supportticketsreply}</span>
            <i class="bi bi-chevron-down"></i>
          </h5>
        </div>
        <div class="collapse show" id="replyBox">
          <div class="dashboard-card-body">
            <form method="post"
                  action="{$smarty.server.PHP_SELF}?tid={$tid}&c={$c}&postreply=true"
                  enctype="multipart/form-data" id="frmReply">
              <div class="row g-3 mb-3">
                <div class="col-md-6">
                  <label for="inputName" class="form-label fw-medium">{$LANG.supportticketsclientname}</label>
                  <input class="form-control" type="text" name="replyname" id="inputName"
                         value="{$replyname}"{if $loggedin} readonly{/if}>
                </div>
                <div class="col-md-6">
                  <label for="inputEmail" class="form-label fw-medium">{$LANG.supportticketsclientemail}</label>
                  <input class="form-control" type="text" name="replyemail" id="inputEmail"
                         value="{$replyemail}"{if $loggedin} readonly{/if}>
                </div>
              </div>
              <div class="mb-3">
                <label for="inputMessage" class="form-label fw-medium">{$LANG.contactmessage}</label>
                <textarea name="replymessage" id="inputMessage" rows="8"
                          class="form-control">{$replymessage}</textarea>
              </div>
              <div class="mb-3">
                <label for="inputAttachments" class="form-label fw-medium">{$LANG.supportticketsticketattachments}</label>
                <input type="file" name="attachments[]" id="inputAttachments" class="form-control"
                       accept="{$allowedfiletypes}">
                <div class="form-text">{$LANG.supportticketsallowedextensions}: {$allowedfiletypes}</div>
              </div>
              <div class="d-flex gap-2">
                <button type="submit" name="save" class="btn btn-primary rounded-pill px-4">
                  <i class="bi bi-send me-2"></i>{$LANG.supportticketsticketsubmit}
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
      {/if}

    {/if}

  </div>{* /col-lg-9 *}
</div>{* /row *}

{include file="$template/footer.tpl"}
