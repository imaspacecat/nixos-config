{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "browser.tabs.insertAfterCurrent" = true;

        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.feeds.sponsored-top-sites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.discoverystream.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;

        "browser.contentblocking.category" = "standard";
        "gfx.font_rendering.cleartype_params.rendering_mode" = 5;
        "gfx.font_rendering.cleartype_params.cleartype_level" = 100;
        "gfx.font_rendering.directwrite.use_gdi_table_loading" = false;
        "permissions.default.geo" = 0;

        "gfx.content.skia-font-cache-size" = 20;
        "content.notify.interval" = 100000;

        "general.smoothScroll" = true;
        "mousewheel.default.delta_multiplier_y" = 250;

        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "browser.fullscreen.autohide" = false;
      };
    };
  };
}
