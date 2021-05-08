/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
/*"DejaVu Sans Mono:size=12"*/
static const char *fonts[] = {
	"Inconsolata Nerd Font Mono:style=Regular:size=14:antialias=true"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
		    /*     fg         bg       */
	[SchemeNorm] = { "#d32e10", "#222222" },
	[SchemeSel] = { "#eeeeee", "#6611dd"  },
	[SchemeOut] = { "#d32e10", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
