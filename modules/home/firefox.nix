{ config, pkgs, inputs, ... }:
{
  stylix.targets.firefox = {
    profileNames = [ "nixos" ];
    colorTheme.enable = false; # looks like garb
  };

  programs.firefox = {
    enable = true;
    profiles.nixos = {
      id = 0;
      #name = "nixos";
      isDefault = true;
      extensions.force = true;
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        firefox-color
        ublock-origin
	vimium
	consent-o-matic
	keepassxc-browser
	user-agent-string-switcher
      ];

      search = {
        force = true;
	default = "ddg";
	engines = {
	  nix-packages = {
	    name = "Nix Packages";
	    urls = [{
	      template = "https://search.nixos.org/packages";
	      params = [
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];
	  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	  definedAliases = [ "@np" ];
	  };
	  nix-options = {
	    name = "Nix Options";
	    urls = [{
	      template = "https://search.nixos.org/options";
	      params = [
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];
	  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	  definedAliases = [ "@no" ];
	  };
	  home-options = {
	    name = "Home Options";
	    urls = [{
	      template = "https://search.nixos.org/options";
	      params = [
		{ name = "query"; value = "{searchTerms}"; }
		{ name = "source"; value = "home_manager"; }
	      ];
	    }];
	  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	  definedAliases = [ "@hm" ];
	  };
	};
      };

      userChrome = ''
/* Hide Tab Close Buttons */
.tabbrowser-tab .tab-close-button {
  visibility: collapse !important;
}
  .tab-label-container {
    mask-image: none !important;
}

/* 1.8.4, Firefox 149
- Fixed single-tab styling applying to grouped tabs
- Fixed hide-all-URLbar-icons not hiding new trustpanel button (fix #32)
- Removed broken truncate https option, you can change this in Firefox with browser.urlbar.trimURLs
- Tried to make customize menu a little better
*/

:root {
	--urlbar-collapsed-width: 200px;
	--urlbar-open-width: 300px; /* Only when disable-centering-of-URLbar is enabled */
}

#navigator-toolbox {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	position: relative !important;
}


/* Hide flexible spaces */
toolbarspring,
[id^="wrapper-customizableui-special-spring"] {
	display: none !important;
}


/* Tabs */
#titlebar {
	width: 0;
	flex-grow: 1;
	overflow: hidden;
}
#toolbar-menubar[inactive="true"] { /* Prevent duplicate window controls */
	display: none !important;
}
#TabsToolbar {
	display: flex !important;
	align-items: center;
	z-index: 1;
	padding-left: var(--tab-block-margin) !important;
}
#TabsToolbar-customization-target {
	display: flex !important;
	margin-block: auto !important;
	align-items: center;
}
#tabbrowser-tabs {
	overflow: hidden !important;
	width: 0 !important;
	flex: 1 !important;
}
.tabbrowser-tab {
	min-height: calc(var(--tab-min-height) - 2px) !important;
}
.tab-background { /* Just thought it looked nicer */
	margin-block: calc(2px + var(--tab-block-margin)) !important;
	box-shadow: none !important;
	transition: background-color .2s;
}

@media -moz-pref("onebar.hide-all-tabs-button") {
	@media not (max-width: 700px) {
		#alltabs-button {
			display: none !important;
		}
	}
}


/* Navigation buttons */
@media -moz-pref("onebar.conditional-navigation-buttons") {
	:root:not([customizing]) #back-button[disabled],
	:root:not([customizing]) #forward-button[disabled] {
		display: none !important;
	}
}
@media not -moz-pref("onebar.disable-hiding-navigation-buttons") {
	#urlbar-container ~ :is(#back-button, #forward-button) {
		display: none !important;
	}
	/* In the customize menu */
	:is(#wrapper-back-button, #wrapper-forward-button) {
		opacity: 1 !important;
	}
	#wrapper-urlbar-container ~ :is(#wrapper-back-button, #wrapper-forward-button) {
		opacity: .5 !important;
	}

	/* Add note in customize menu for nav buttons */
	#customization-header::after {
		content: "To hide the back & forward buttons, drag them to the right of the URL bar";
		background-color: blue;
		color: white;
		border-radius: 4px;
		padding: .4em .7em;
		margin-top: 1em;
		display: block;
		width: max-content;
	}
}
/* Customize menu */
:root[customizing] .urlbar-input-box {
	visibility: visible !important;
}
:root[customizing] .urlbar-input-box::before {
	content: "https://";
	margin-block: auto;
}
:root[customizing] #urlbar-input {
	display: none !important;
}
:root[customizing] #tabbrowser-tabs,
:root[customizing] .customization-target {
	padding-inline: 20px;
	transition: padding-inline .2s, margin-inline .2s;
}
:root[customizing] #nav-bar-customization-target {
	margin-right: 20px;
}
:root[customizing] #nav-bar-customization-target {
	border-right: 1px dashed var(--border-color-deemphasized);
}
:root[customizing] #tabbrowser-arrowscrollbox,
:root[customizing] #nav-bar-customization-target {
	border-left: 1px dashed var(--border-color-deemphasized) !important;;
}
:root[customizing] #TabsToolbar-customization-target {
	padding-left: 0;
}
:root[customizing] #tabbrowser-tabs {
	border-left: 0 !important;
	padding-left: 20px !important;
}
:root[customizing] #tabbrowser-tabs:first-child {
	padding-left: 40px !important;
}
:root[customizing] #tabbrowser-arrowscrollbox {
	padding-left: 20px;
}




/* Single Tab Styling */
@media not -moz-pref("onebar.disable-single-tab") {
	#tabbrowser-arrowscrollbox > .tabbrowser-tab:only-of-type {
		width: max-content !important;
		max-width: 80% !important;
		flex: unset !important;
		margin-inline-end: auto !important;
		--toolbar-bgcolor: transparent !important;
		--tab-selected-bgimage: transparent !important;
	}
	#tabbrowser-arrowscrollbox > .tabbrowser-tab:only-of-type .tab-text {
		font-weight: 600 !important;
	}
	#tabbrowser-arrowscrollbox >  .tabbrowser-tab:only-of-type .tab-close-button,
	#tabbrowser-tabs:not([closebuttons="activetab"]) ~ #alltabs-button {
		display: none !important;
	}
	#tabbrowser-arrowscrollbox >  .tabbrowser-tab:only-of-type .tab-background {
		opacity: 0;
	}
}



/* Match button sizes to toolbar buttons */
#TabsToolbar {
	--toolbarbutton-inner-padding: 8px !important;
}
#TabsToolbar toolbarbutton {
	margin: 0 !important;
}


#alltabs-button {
	order: -1;
}
.titlebar-buttonbox-container {
	order: -100 !important;
}

/* Toolbar */
#nav-bar {
	background: none !important;
}
#urlbar-container {
	width: var(--urlbar-collapsed-width) !important;
	flex: 1 !important;
	z-index: 10;
	justify-content: flex-end;
	transition: background-color .2s, width .2s, min-width .2s;
}
#urlbar:not([breakout-extend]) {
	min-width: max-content !important;
}
@media not -moz-pref("onebar.disable-centering-of-URLbar") {
	#urlbar {
		position: relative !important;
		top: unset !important;
		margin-block: auto !important;
	}
	#urlbar[breakout-extend] {
		position: absolute !important;
		inset-inline: 20vw !important;
		width: unset !important;
		align-self: flex-start !important;
	}
}
@media -moz-pref("onebar.disable-centering-of-URLbar") {
	#urlbar[breakout-extend] .urlbar-input-box {
		width: 400px !important;
	}
	#urlbar-container:focus-within, #urlbar-container:hover {
		width: var(--urlbar-open-width) !important;
	}
	@media (max-width: 700px) {
		#urlbar[breakout-extend] {
			width: unset !important;
		}
	}
}
@media -moz-pref("onebar.collapse-URLbar") {
	:root:not([customizing]) #urlbar-container:has(#urlbar:not([focused])) {
		justify-content: flex-end;
		width: var(--urlbar-collapsed-width) !important;
		--urlbar-collapsed-width: calc(
			var(--urlbar-min-height) - 2px + 2 * var(--urlbar-container-padding)
		);
		#urlbar {
			min-width: var(--urlbar-collapsed-width) !important;
			width: max-content !important;
			max-width: 2000px;
			transition: max-width .2s;
		}
		#urlbar-background::before {
			content: "";
			position: absolute;
			inset: 0;
			background: var(--toolbar-bgcolor);
			border-radius: var(--toolbarbutton-border-radius);
			opacity: 0;
			z-index: -1;
			transition: opacity .2s;
		}
		&:not(:hover) {
			#urlbar {
				max-width: var(--urlbar-collapsed-width);
			}
		}
		&:hover #urlbar-background::before {
			opacity: 1;
		}
		.urlbar-input-box {
			position: absolute !important;
			opacity: 0;
			pointer-events: none;
		}
		.identity-box-button {
			padding-inline: var(--urlbar-icon-padding) !important;
		}
		#identity-icon-box,
		#tracking-protection-icon-container {
			max-width: unset !important;
			opacity: 1 !important;
			padding-inline: var(--urlbar-icon-padding) !important;
			order: 3;
		}
		@media (max-width: 700px) {
			& {
				flex: unset !important;
				width: auto !important;
				margin-inline-start: auto !important;
			}
		}
	}
}

#urlbar-input-container {
	display: flex !important;
}
.urlbar-input-container > :not(.urlbar-input-box) {
	order: 2;
	margin: 0 !important;
}
.urlbar-input-box {
	flex-grow: 1 !important;
	padding-left: .5em !important;
	margin-inline-start: 0 !important;;
	width: 100px !important;
	min-width: 50px !important;
	transition: width .2s;
}
#urlbar-input:not(:focus-within) {
	mask: linear-gradient(to right, black calc(100% - 20px), transparent);
}
#urlbar-background {
	transition: border .2s;
}
#urlbar:hover:not([focused="true"]) > #urlbar-background {
	--toolbar-field-border-color: var(--toolbar-field-focus-border-color)
}

/* Hide unimportant buttons until hover */
:root {
	--in-transition: font-size .2s, padding .2s, margin .2s, max-width .2s, opacity .2s .15s;
	--out-transition: font-size .2s, padding .2s, margin .2s, max-width .2s, opacity .07s;
}
#urlbar-container:hover .urlbar-input-container > box:not(#page-action-buttons):not(.urlbar-input-box),
#urlbar-container:hover #page-action-buttons > *,
#urlbar-container:hover #userContext-label {
	transition: var(--in-transition) !important;
	max-width: 200px;
}
@media -moz-pref("onebar.disable-autohide-of-URLbar-icons") {
	#urlbar-container {
		width: var(--urlbar-open-width) !important;
	}
}
@media not -moz-pref("onebar.disable-autohide-of-URLbar-icons") {
	#urlbar-container:not(:hover) :where(
		toolbarbutton,
		#userContext-label,
		#star-button-box,
		.verifiedDomain,
		#tracking-protection-icon-container,
		#pageAction-urlbar-_testpilot-containers,
		#pageActionButton,
	) {
		font-size: 0 !important;
		max-width: 0 !important;
		padding-inline: 0 !important;
		margin-inline: 0 !important;
		opacity: 0 !important;
		transition: var(--out-transition) !important;
	}
	@media -moz-pref("onebar.hide-all-URLbar-icons") {
		#urlbar-container:not(:hover) :where(#page-action-buttons, #identity-box) > *,
		#urlbar-container:not(:hover) .urlbar-input-container > [role="button"] {
			font-size: 0 !important;
			max-width: 0 !important;
			padding-inline: 0 !important;
			margin-inline: 0 !important;
			opacity: 0 !important;
			transition: var(--out-transition) !important;
		}
	}
}
#urlbar-container #urlbar[focused="true"] .urlbar-input-container > box,
#urlbar-container #urlbar[focused="true"] #page-action-buttons > * {
	font-size: 0 !important;
	max-width: 0 !important;
	padding-inline: 0 !important;
	margin-inline: 0 !important;
	opacity: 0 !important;
	transition: var(--out-transition) !important;
}

/* Other Buttons */

.toolbarbutton-icon {
	transition: background-color .1s;
}

#nav-bar #search-container {
	min-width: 32px !important;
	transition: min-width .2s;
}

.titlebar-spacer,
#identity-icon-label,
#trust-label {
	display: none;
}

@media -moz-pref("onebar.hide-unified-extensions-button") {
	#unified-extensions-button, #unified-extensions-button > .toolbarbutton-icon {
		width: 0px !important;
		padding: 0px !important;
	}
}

/* Wrap other toolbars to bottom */
#nav-bar ~ * {
	width: 100vw !important;
}





/* Linux fixes, credits: https://github.com/ranmaru22/firefox-vertical-tabs/pull/39 */

@media (-moz-gtk-csd-available) {
	/* window control padding values (these don't change the size of the actual buttons, only the padding for the navbar) */
	:root[customtitlebar] {
		/* default button/padding size based on adw-gtk3 theme */
		--uc-win-ctrl-btn-width: 38px;
		--uc-win-ctrl-padding: 12px;
	}

	:root[customtitlebar][lwtheme] {
		/* seperate values for when using a theme, based on the Firefox defaults */
		--uc-win-ctrl-btn-width: 30px;
		--uc-win-ctrl-padding: 12px;
	}
	
	/* setting the padding value for all button combinations */
	@media (-moz-gtk-csd-minimize-button),
	(-moz-gtk-csd-maximize-button),
	(-moz-gtk-csd-close-button) {
		#navigator-toolbox {
			--uc-navbar-padding: calc(var(--uc-win-ctrl-btn-width) * 1);
		}
	}
	
	@media (-moz-gtk-csd-minimize-button) and (-moz-gtk-csd-maximize-button),
	(-moz-gtk-csd-minimize-button) and (-moz-gtk-csd-close-button),
	(-moz-gtk-csd-maximize-button) and (-moz-gtk-csd-close-button) {
		#navigator-toolbox {
			--uc-navbar-padding: calc(var(--uc-win-ctrl-btn-width) * 2);
		}
	}
	
	@media (-moz-gtk-csd-minimize-button) and (-moz-gtk-csd-maximize-button) and (-moz-gtk-csd-close-button) {
		#navigator-toolbox {
			--uc-navbar-padding: calc(var(--uc-win-ctrl-btn-width) * 3);
		}
	}

	/* only applies padding/positioning if there is 1 or more buttons */
	@media (-moz-gtk-csd-minimize-button),
	(-moz-gtk-csd-maximize-button),
	(-moz-gtk-csd-close-button) {
		.titlebar-buttonbox-container {
			left: 0;
			position: absolute;
			display: block;
			z-index: 101;
		}
		@media (-moz-gtk-csd-reversed-placement) {
			#TabsToolbar {
				padding-left: calc(var(--uc-navbar-padding, 0) + var(--uc-win-ctrl-padding)) !important;
			}
		}
		/* window controls on the right */
		@media not (-moz-gtk-csd-reversed-placement) {
			#nav-bar {
				padding-right: calc(var(--uc-navbar-padding, 0) + var(--uc-win-ctrl-padding)) !important;
			}
			.titlebar-buttonbox-container {
				right: 0;
				left: unset;
			}
		}
		.toolbar-items {
			max-width: calc(100vw - (
			  var(--uc-navbar-padding, 0) + var(--uc-win-ctrl-padding)
			));
		}
	}
}

/* MacOS fixes */
@media (-moz-platform: macos) {
	.titlebar-buttonbox-container {
		margin-right: 10px;
	}
}

/* Windows OS fixes */
@media (-moz-platform: windows-win10), (-moz-platform: windows) {
	/* Unsure if same attribute changed on windows, 
		would like confirmation or someone to fix */
	:root[tabsintitlebar], :root[customtitlebar] {
		--uc-window-control-width: 137px;
		--uc-win-ctrl-padding: 12px;
	}

	#nav-bar {
		padding-right: calc(var(--uc-window-control-width) + var(--uc-win-ctrl-padding)) !important;
	}
	.titlebar-buttonbox-container {
		top: 0 !important;
		right: 0 !important;
		height: calc(var(--tab-min-height) + var(--toolbarbutton-inner-padding) + var(--toolbarbutton-outer-padding));
		position: absolute !important;
		z-index: 101 !important;
		max-height: 100%;
	}
	.toolbar-items {
		max-width: calc(100vw - var(--uc-window-control-width)) !important;
	}

	/* Hide window buttons in fullscreen */
	#navigator-toolbox[style*="margin-top: -"] .titlebar-buttonbox-container,
	[inDOMFullscreen="true"] .titlebar-buttonbox-container {
		transform: translateY(-100px)
	}

}

/* Small window */

@media (max-width: 700px) {
	#nav-bar {
		width: 0 !important;
		flex-grow: 999;
		--toolbarbutton-outer-padding: 0px;
		--toolbar-start-end-padding: 0px;
	}
	#TabsToolbar {
		min-width: unset !important;
	}
	#tabbrowser-tabs {
		display: none !important;
	}
	#urlbar[breakout-extend] {
		inset-inline: 15px !important;
		z-index: 102 !important;
	}
}


	'';

      settings = {

        # disable single-tab styling in onebar css

	"onebar.disable-single-tab" = true;

        # tracking protection

	"browser.contentblocking.category" = "strict";
	"browser.download.start_downloads_in_tmp_dir" = true;
	"browser.uitour.enabled" = false;
	"privacy.globalprivacycontrol.enabled" = true;

        # ocsp & certs / hpkp
        "security.OCSP.enabled" = 0;
	"privacy.antitracking.isolateContentScriptResources" = true;
	"security.csp.reporting.enabled" = false;

	# ssl / tls

	"security.ssl.treat_unsafe_negotiation_as_broken" = true;
	"browser.xul.error_pages.expert_bad_cert" = true;
	"security.tls.enable_0rtt_data" = false;

	# disk avoidance

	"browser.cache.disk.enable" = false;
	"browser.privatebrowsing.forceMediaMemoryCache" = false;
	"media.memory_cache_max_size" = "65536";
	"browser.sessionstore.interval" = "60000";

	# shutdown & sanitizing

	"privacy.history.custom" = true;
	"browser.privatebrowsing.resetPBM.enabled" = true;

	# speculative loading

	"network.http.speculative-parallel-limit" = "0";
	"network.dns.disablePrefetch" = true;
	"network.dns.disablePrefetchFromHTTPS" = true;
	"browser.urlbar.speculativeConnect.enabled" = false;
	"browser.places.speculativeConnect.enabled" = false;
	"network.prefetch-next" = false;

	# search / url gun

	"browser.urlbar.trimHttps" = true;
	"browser.urlbar.untrimOnUserInteraction.featureGate" = true;
	"browser.search.separatePrivateDefault.ui.enabled" = true;
	"browser.search.suggest.enabled" = false;
	"browser.urlbar.quicksuggest.enabled" = false;
	"browser.urlbar.groupLabels.enabled" = false;
	"browser.formfill.enable" = false;
	"network.IDN_show_punycode" = true;

	# https-only mode

	"dom.security.https_only_mode" = true;
	"dom.security.https_only_mode_error_page_user_suggestions" = true;

	# passwords

	"signon.formlessCapture.enabled" = false;
	"signon.privateBrowsingCapture.enabled" = false;
	"network.auth.subresource-http-auth-allow" = "1";
	"editor.truncate_user_pastes" = false;

	# extensions

	"extensions.enabledScopes" = "5";

	# headers / referers

	"network.http.referer.XOriginTrimmingPolicy" = "2";

	# containers

	"privacy.userContext.ui.enabled" = true;

	# various

	"pdfjs.enableScripting" = true;

	# safe browsing

	"browser.safebrowsing.downloads.remote.enabled" = true;

	# mozilla

	"permissions.default.desktop-notification" = "2";
	"permissions.default.geo" = "2";
	"geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
	"browser.search.update" = false;
	"permissions.manager.defaultsUrl" = "";
	"extensions.getAddons.cache.enabled" = false;

	# telemetry

	"datareporting.policy.dataSubmissionEnabled" = false;
	"datareporting.healthreport.uploadEnabled" = false;
	"toolkit.telemetry.unified" = false;
	"toolkit.telemetry.enabled" = false;
	"toolkit.telemetry.server" = "data:,";
	"toolkit.telemetry.archive.enabled" = false;
	"toolkit.telemetry.newProfilePing.enabled" = false;
	"toolkit.telemetry.shutdownPingSender.enabled" = false;
	"toolkit.telemetry.updatePing.enabled" = false;
	"toolkit.telemetry.bhrPing.enabled" = false;
	"toolkit.telemetry.firstShutdownPing.enabled" = false;
	"toolkit.telemetry.coverage.opt-out" = true;
	"toolkit.coverage.opt-out" = true;
	"toolkit.coverage.endpoint.base" = "";
	"browser.newtabpage.activity-stream.feeds.telemetry" = false;
	"browser.newtabpage.activity-stream.telemetry" = false;
	"datareporting.usage.uploadEnabled" = false;

	# experiments

	"app.shield.optoutstudies.enabled" = false;
	"app.normandy.enabled" = false;
	"app.normandy.api_url" = "";

	# crash reports

	"breakpad.reportURL" = "";
	"browser.tabs.crashReporting.sendReport" = false;

	# section: peskyfox
	# mozilla ui

	"extensions.getAddons.showPane" = false;
	"extensions.htmlaboutaddons.recommendations.enabled" = false;
	"browser.discovery.enabled" = false;
	"browser.shell.checkDefaultBrowser" = false;
	"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
	"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
	"browser.preferences.moreFromMozilla" = false;
	"browser.aboutConfig.showWarning" = false;
	"browser.startup.homepage_override.mstone" = "ignore";
	"browser.aboutwelcome.enabled" = false;
	"browser.profiles.enabled" = true;

	# theme adjustments

	"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
	"browser.compactmode.show" = true;
	"browser.privateWindowSeparation.enabled" = false;

	# ai

	"browser.ai.control.default" = "blocked";
	"browser.ml.enable" = false;
	"browser.ml.chat.enabled" = false;
	"browser.ml.chat.menu" = false;
	"browser.tabs.groups.smart.enabled" = false;
	"browser.ml.linkPreview.enabled" = false;

	# fullscreen notice

	"full-screen-api.transition-duration.enter" = "0 0";
	"full-screen-api.transition-duration.leave" = "0 0";
	"full-screen-api.warning.timeout" = "0";

	# url bar

	"browser.urlbar.trending.featureGate" = false;

	# new tab page

	"browser.newtabpage.activity-stream.default.sites" = "";
	"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
	"browser.newtabpage.activity-stream.feeds.section.topstories" = false;
	"browser.newtabpage.activity-stream.showSponsored" = false;
	"browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;

	# downloads

	"browser.download.manager.addToRecentDocs" = false;

	# pdf

	"browser.download.open_pdf_attachments_inline" = true;

	# tab behavior

	"browser.bookmarks.openInTabClosesMenu" = false;
	"browser.menu.showViewImageInfo" = true;
	"findbar.highlightAll" = true;
	"layout.word_select.eat_space_to_next_word" = false;


      };
    };
  };
}
