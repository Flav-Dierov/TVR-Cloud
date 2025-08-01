<!--
 - SPDX-FileCopyrightText: 2016 Nextcloud GmbH and Nextcloud contributors
 - SPDX-FileCopyrightText: 2012-2016 ownCLoud, Inc.
 - SPDX-License-Identifier: AGPL-3.0-or-later
-->
# Custom Themes

Themes can be used to customize the look and feel without the need to patch the source code. This makes it very easy to:

* Use your own logo (in the top left, in log in and in emails)
* Customize the text strings to replace »Nextcloud« etc. with your name of choice
* Change the main color (used in header and as log in background)
* And more …

The process is simple:

1. Put a folder here with the name of the theme as foldername
2. Activate it by putting 'theme' => 'themename', into the config.php file

The folder structure of a theme is exactly the same as the structure of the 'core' directory. CSS files are loaded additionally to the default files so you can override properties. Images are replaced. You can also override JS files and PHP templates but we do not recommend that because you will need to adjust them after every update.

You can also find a basic example here which you can build upon.
