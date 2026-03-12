<!DOCTYPE html>
<html lang="{$lang}">
<head>
  {include file="$template/includes/head.tpl"}
</head>
<body class="modern-blue-theme{if $loggedin} client-area-page{/if}">

{include file="$template/includes/navbar.tpl"}

{* Breadcrumb — hidden on homepage *}
{if $templatefile neq 'index'}
<div class="breadcrumb-bar">
  <div class="container">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-0">
        <li class="breadcrumb-item"><a href="{$WEB_ROOT}"><i class="bi bi-house me-1"></i>Home</a></li>
        {if $breadcrumb}
          {foreach from=$breadcrumb item=crumb}
            {if $crumb.link}
              <li class="breadcrumb-item"><a href="{$crumb.link}">{$crumb.name}</a></li>
            {else}
              <li class="breadcrumb-item active" aria-current="page">{$crumb.name}</li>
            {/if}
          {/foreach}
        {else}
          <li class="breadcrumb-item active" aria-current="page">{$pagetitle}</li>
        {/if}
      </ol>
    </nav>
  </div>
</div>

{* Page header — hidden on homepage and client area home *}
{if $templatefile neq 'clientareahome'}
<div class="page-header-section">
  <div class="container">
    <h1 class="page-header-title">{$pagetitle}</h1>
  </div>
</div>
{/if}
{/if}

{* Alert messages *}
{if $errormessage}
<div class="container mt-3">
  <div class="alert alert-danger alert-dismissible fade show" role="alert">
    <i class="bi bi-exclamation-circle me-2"></i>{$errormessage}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
</div>
{/if}

{if $successmessage}
<div class="container mt-3">
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    <i class="bi bi-check-circle me-2"></i>{$successmessage}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
</div>
{/if}

{if $infomessage}
<div class="container mt-3">
  <div class="alert alert-info alert-dismissible fade show" role="alert">
    <i class="bi bi-info-circle me-2"></i>{$infomessage}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
</div>
{/if}

<main class="main-content">
  <div class="container py-4">
