{  pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      # General settings

      live_config_reload = true;
      ipc_socket = true;

      # Environment variables
      env = {
        TERM = "alacritty";
        WINIT_X11_SCALE_FACTOR = "1.0";
      };

      # Window settings
      window = {
        position = null; # "None" in TOML
        dynamic_padding = true;
        decorations = "full";
        opacity = 0.6;
        blur = false;
        startup_mode = "Windowed";
        dynamic_title = true;
        class = {
          instance = "Alacritty";
          general = "Alacritty";
        };
        decorations_theme_variant = null; # "None" in TOML

        dimensions = {
          columns = 95;
          lines = 24;
        };

        padding = {
          x = 12;
          y = 12;
        };
      };

      # Scrolling settings
      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      # Bell settings
      bell = {
        animation = "Linear";
        duration = 20;
        command = {
          program = "paplay";
          args = [ "/usr/share/sounds/freedesktop/stereo/dialog-error.oga" ];
        };
      };

      # Selection settings
      selection = {
        save_to_clipboard = true;
      };

      # Cursor settings
      cursor = {
        vi_mode_style = null; # "None" in TOML
        blink_interval = 750;
        blink_timeout = 5;
        unfocused_hollow = false;
        thickness = 0.15;

        style = {
          shape = "Block";
          blinking = "On";
        };
      };

      # Mouse settings
      mouse = {
        hide_when_typing = false;
      };

      # Hints settings
      hints = {
        enabled = [
          {
            command = "xdg-open";
            hyperlinks = true;
            post_processing = true;
            persist = false;
            mouse = {
              enabled = true;
            };
            binding = {
              key = "U";
              mods = "Control|Shift";
            };
            regex = "(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^\u0000-\u001F\u007F-\u009F<>\"\\s{-}\\^⟨⟩‘]+";
          }
        ];
      };

      # Debug settings
      debug = {
        render_timer = false;
        persistent_logging = false;
        log_level = "Warn";
        renderer = null; # "None" in TOML
        print_events = false;
        highlight_damage = false;
        prefer_egl = false;
      };

        # Colors section
      colors = {
        bright = {
          black = "0x5b5858";
          blue = "0x3fc4de";
          cyan = "0x6be4e6";
          green = "0x3fdaa4";
          magenta = "0xf075b5";
          red = "0xec6a88";
          white = "0xd5d8da";
          yellow = "0xfbc3a7";
        };
        normal = {
          black = "0x16161c";
          blue = "0x26bbd9";
          cyan = "0x59e1e3";
          green = "0x29d398";
          magenta = "0xee64ac";
          red = "0xe95678";
          white = "0xd5d8da";
          yellow = "0xfab795";
        };
        primary = {
          background = "0x1c1e26";
          foreground = "0xe0e0e0";
        };
      };
    };

      #font
      font = {
        size = 12;
        builtin_box_drawing = true;
        normal = {
          family = "JetBrainsMono Nerd Font";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
        };
        offset = {
          x = 0;
          y = 0;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
      };

  };
}
