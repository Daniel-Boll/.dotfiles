/* See LICENSE file for copyright and license details. */

/* Teclas especiais */
#include <X11/XF86keysym.h>

#define KP_LEFT 0xff96
#define KP_RIGHT 0xff98
#define KP_BEGIN 0xff9d
#define KP_UP 0xff97
#define KP_DOWN 0xff99
#define KP_DIVIDE 0xffaf
#define KP_NEXT 0xff9b
#define KP_END 0xff9c
#define KP_SUBTRACT 0xffad
#define KP_PRIOR 0xff9a
#define KP_HOME 0xff95
#define KP_DECIMAL
#define KP_ENTER 0xff8d
#define KP_ADD 0xffab
#define KP_INSERT 0xff9e
#define KP_DELETE 0xff9f
#define SND_MUTE 0x1008ff12
#define SND_DEC 0x1008ff11
#define SND_INC 0x1008ff13
#define MIC_MUTE 0x1008ffb2
// #define BRIGH_DEC 0x1008ffb2
// #define BRIGH_DEC 0x1008ffb2
#define MONIT_SEL 0x1008ff59
#define WIFI_TOGGLE 0x1008ff95
#define CONFIG_LAUNCH 0x1008ff81
#define TOOGLE_BT 0x1008ff94
#define FAVORITES 0x1008ff30
#define SUPER 0xffeb
#define ISO3SHIFT 0xfe03
#define PRINT 0xff61

/* Programas */
#define BROWSER "firefox"
#define TERM "st"
#define GUIFM "pcmanfm"
#define CLIFM "ranger"

/* Fontes */
#define FONT "Iosevka Nerd Font:size=12:antialias=true:autohint=true"
//#define FONT2 "Noto Color Emoji:pixelsize=16:antialias=true:autohint=true"
#define FONT2 "Noto Sans Mono CJK JP:size=10:antialias=true:autohint=true"
#define DMENU_FONT "Iosevka Nerd Font:bold:size=14"

/* Cores do pywal */
#define PYWAL 0


/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 1;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 1;       /* vert inner gap between windows */
static const unsigned int gappoh    = 0;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 0;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */
static const int swallowfloating    = 1;        /* 1 means swallow floating windows by default */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 0;       /* vertical padding of bar */
static const int sidepad            = 0;       /* horizontal padding of bar */

/*  Display modes of the tab bar: never shown, always shown, shown only in  */
/*  monocle mode in the presence of several windows.                        */
/*  Modes after showtab_nmodes are disabled.                                */
enum showtab_modes { showtab_never, showtab_auto, showtab_nmodes, showtab_always};
static const int showtab = showtab_auto;        /* Default tab bar show mode */
static const int toptab = 1;               /* False means bottom tab bar */

static const char *fonts[]          = { FONT, FONT2 };
static const char dmenufont[]       = DMENU_FONT;

static const char norm_fg[] = "#fff1e8";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#000000";
static const char norm_float[] = "#000000";

static const char sel_fg[] = "#fff1e8";
static const char sel_bg[] = "#444444";
static const char sel_border[] = "#83769c";
static const char sel_float[] = "#83769c";

static const char urg_fg[] = "#fff1e8";
static const char urg_bg[] = "#ff004d";
static const char urg_border[] = "#ff004d";
static const char urg_float[] = "#ff004d";


static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#29adff";

static const char col_col1[] = "#ffffff";
static const char col_col2[] = "#ff004d";
static const char col_col3[] = "#00e756";
static const char col_col4[] = "#fff024";
static const char col_col5[] = "#83769c";
static const char col_col6[] = "#ff77a8";
static const char col_col7[] = "#29adff";
static const char col_col8[] = "#ffffff";
static const char col_col9[] = "#008751";
static const char col_col10[] = "#fff1e8";
static const char col_col11[] = "#000000";


static const char *colors[][4]      = {
    /*               fg           bg         border       float      */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border, norm_float }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border, sel_float },  // the focused win
    [SchemeUrg] = {urg_fg, urg_border, urg_border, urg_float}
};

/* tagging */
static const char *tags[] = { "壱", "弐", "参", "四","五", "六", "七", "八", "九" };

static const char *tagsel[][2] = {
	{"#1e1f26",  "#ff004d"},
	{"#1e1f26",  "#00e756"},
	{"#1e1f26",  "#fff024"},
	{"#1e1f26",  "#83769c"},
	{"#1e1f26",  "#ff77a8"},
	{"#1e1f26",  "#29adff"},
	{"#1e1f26",  "#ffffff"},
	{"#1e1f26",  "#ff79c6"},
	{"#1e1f26",  "#008751"},
};

static const unsigned int ulinepad = 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke = 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset = 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall = 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                instance    title       tags mask     isfloating   monitor */
	{ "Gimp",               NULL,       NULL,       0,              1,           -1 },
	{ "Pavucontrol",        NULL,       NULL,       1 << 8,         1,           -1 },
	{ "BloomCG",            NULL,       NULL,       0,              1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int attachdirection = 5;    /* 0 default, 1 above, 2 aside, 3 below, 4 bottom, 5 top */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"
#include "movestack.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[M]",      monocle }, /* first entry is default */
	{ "H[]",      deck },
	{ ">M>",      centeredfloatingmaster },
	{ "|M|",      centeredmaster },
	{ "[]=",      tile },    
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "DD",     doubledeck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
/* #define MODKEY Mod1Mask */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, NULL };
static const char *termcmd[]  = { TERM, NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	// { MODKEY,                       XK_r,      spawn,          SHCMD("$HOME/.config/rofi/bin/launcher_colorful") },
	{ MODKEY,                       XK_r,      spawn,          SHCMD("$HOME/.config/rofi/bin/launcher_colorful") },
	{ MODKEY,             		XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_n,      spawn,          SHCMD("$HOME/.config/rofi/bin/menu_network") },
	{ MODKEY,                       XK_x,      spawn,          SHCMD("$HOME/.config/rofi/bin/powermenu") },
	{ MODKEY,                       XK_o,      spawn,          SHCMD("$HOME/scripts/dmenu-zathura") },
	{ MODKEY,                       XK_s,      spawn,          SHCMD("maim --select | xclip -selection clipboard -target image/png") },
	{ MODKEY,                       XK_p,      spawn,          SHCMD("colorpicker --short --one-shot --preview | xsel -b") },
	{ MODKEY,                       XK_b,      spawn,          SHCMD("brave") },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	// { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_l,      spawn,          SHCMD("cat /etc/issue | tail -n +2 | xargs -0 -I {} physlock -p \"{}Artix Linux $(uname -r)\"") },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,		        XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,          {0}},
        { 0,                            SND_INC,        spawn, SHCMD("volctl up") },
        { 0,                            SND_DEC,        spawn, SHCMD("volctl down") },
        { 0,                            SND_MUTE,       spawn, SHCMD("volctl toggle") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
