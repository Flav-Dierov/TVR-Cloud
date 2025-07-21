<?php
$CONFIG = array (
    'log_rotate_size' => 20 * 1024 * 1024, // 20 MB
    'trusted_proxies' =>
    array (
        0 => '172.0.0.0/8', // To trust all local IPs
    ),
    'forwarded_for_headers' =>
    array (
        0 => 'HTTP_X_FORWARDED_FOR', // To trust the X-Forwarded-For header
    ),
    'htaccess.RewriteBase' => '/', // Needed to prettify URLs
    'htaccess.IgnoreFrontController' => true, // Needed to prettify URLs
    'onlyoffice' => 
    array (
        'DocumentServerUrl' => '/docs/',
        'DocumentServerInternalUrl' => 'http://office/',
        'StorageUrl' => 'http://webserver/',
    ),
);