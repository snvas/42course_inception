<?php
/** The base configuration for WordPress
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 */

/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'snovaes');

/** MySQL database password */
define('DB_PASSWORD', 'password');

/** MySQL hostname */
define('DB_HOST', 'mariadb');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

//** Redis cache settings. */
define('WP_CACHE', true);
define('WP_CACHE_KEY_SALT', 'snovaes.42.fr');

//** Try Redis container */
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
// define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );
define('WP_REDIS_TIMEOUT', 1);
define('WP_REDIS_READ_TIMEOUT', 1);
define('WP_REDIS_DATABASE', 0);


/** Authentication Unique Keys and Salts.
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 */
define('AUTH_KEY',         '^ru{;eY;9RFpS]d#%*Zl?Hwi|;U%:hbFux<?l=#,+i,!G;V;1YlBUD-F}6}r&`hN');
define('SECURE_AUTH_KEY',  'AcMk[ Bfm8B=[bcy4ZWi!(|-UV%n|p3XPrhE2*7gMdl<=X;:)|A*KV|-o -A&UM ');
define('LOGGED_IN_KEY',    '>I!ss|Ri}!yH>HivfNp|4.n[_VJg_U?NL@eP%n%r$R-`Yqcw065^(6N>w<9$yVH<');
define('NONCE_KEY',        'Bf#yneSv*ik{T(Q$v/NIZ*`}QJcRgV@7e)pz02+]zc;$)tI]niG;.zfq-;Ch*/d+');
define('AUTH_SALT',        'oq!KurLewNh)F}m!r;(ZloB5k+-W5M+3D/1R4DO#!O0{:,4U&g#w(M]S+M1ZY8/S');
define('SECURE_AUTH_SALT', 'y#&PY-`dz?k%ga1A2y*M,V@E8DZXIkWbFaZ(,yi7mx9|kpWl2)?uv(?AMLitow_9');
define('LOGGED_IN_SALT',   'l+-^#9|SGefX ,Q:p.zyjTo-ol(ZGbupU^j Yd]W#[AhFR[AU;QK/Q2y!S%^3jU0');
define('NONCE_SALT',       '79cjyg=tbJDw,G%?]8XyA$Lob4_UkHU1^t+wX/j(E&7EG|c5++o}`X;SWMqM[x6o');

/** WordPress Database Table prefix. */
$table_prefix = 'wp_';

/** For developers: WordPress debugging mode. */
define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>