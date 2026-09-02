{ lib, pkgs, ... }:

let
  reminderDefaults = pkgs.writeText "reminders.json" ''
    {
      "reminders": [
        {
          "enabled": true,
          "title": "Verify GitHub commit email",
          "description": "Add and verify yotam@dubiner.org in GitHub Settings > Emails for imaspacecat.",
          "time": "09:00",
          "frequency": "daily",
          "urgency": "normal",
          "timeout_seconds": 300
        },
        {
          "enabled": true,
          "title": "Call Costco",
          "description": "Call Costco.",
          "time": "18:17",
          "frequency": "interval",
          "date": "2026-09-01",
          "interval_minutes": 10,
          "urgency": "normal",
          "timeout_seconds": 300
        }
      ]
    }
  '';

  reminderCheck = pkgs.writeShellApplication {
    name = "reminder-check";
    runtimeInputs = with pkgs; [
      libnotify
      python3
    ];
    text = ''
      exec python3 ${./script/reminders}
    '';
  };
in
{
  home.activation.createRemindersFile = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    reminder_dir="$HOME/.config/reminders"
    reminder_file="$reminder_dir/reminders.json"

    if [ ! -e "$reminder_file" ]; then
      ${pkgs.coreutils}/bin/mkdir -p "$reminder_dir"
      ${pkgs.coreutils}/bin/cp ${reminderDefaults} "$reminder_file"
    fi
  '';

  systemd.user.services.reminders = {
    Unit = {
      Description = "Send due reminders";
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${reminderCheck}/bin/reminder-check";
    };
  };

  systemd.user.timers.reminders = {
    Unit.Description = "Check reminders every minute";
    Timer = {
      OnCalendar = "*-*-* *:*:00";
      Persistent = true;
      Unit = "reminders.service";
    };
    Install.WantedBy = [ "timers.target" ];
  };
}
