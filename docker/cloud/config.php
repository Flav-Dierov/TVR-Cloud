<?php
$CONFIG = array (
  'allow_user_to_change_display_name' => false,
  'allowed_admin_ranges' => [],
  'debug' => false,
  'default_language' => 'de',
  'default_locale' => 'de_CH',
  'default_phone_region' => 'CH',
  'default_timezone' => 'Europe/Zurich',
  'defaultapp' => 'dashboard,files',
  'enforce_theme' => 'dark',
  'forbidden_filename_characters' => ['?', '<', '>', ':', '*', '|', '"'], // for Windows compatibility
  'forwarded_for_headers' => 
  array (
    0 => 'HTTP_X_FORWARDED_FOR',
  ),
  'htaccess.RewriteBase' => '/',
  'htaccess.IgnoreFrontController' => true,
  'log_rotate_size' => 20 * 1024 * 1024, // 20MB for compatibility with VS Code
  'logtimezone' => 'Europe/Zurich',
  'maintenance' => false,
  'maintenance_window_start' => 0,
  'onlyoffice' => 
  array (
    'DocumentServerUrl' => '/docs/',
    'DocumentServerInternalUrl' => 'http://office/',
    'StorageUrl' => 'http://webserver/',
  ),
  'preview_max_x' => 1024,
  'preview_max_y' => 1024,
  'reduce_to_languages' => ['de', 'en', 'fr', 'it'],
  'trusted_proxies' => 
  array (
    0 => '172.0.0.0/8',
  ),
  'upgrade.disable-web' => true,
);
