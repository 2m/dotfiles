//> using lib "lt.dvim.yabai::yabai-scala:2.0.1"

import lt.dvim.yabai.*

@main def run() =
  for {
    _ <- yabai.spaces.max until 10
  } yield yabai ! "space --create"

  // Query for app names and title of running apps with:
  // yabai -m query --windows | jq '.[] | {app: .app, title: .title}'
  yabai no_manage (
    Rule.App("choose"),
    Rule.App("System Preferences"),
    Rule.Title("gpg-copy"),
    Rule.App("QuickTime Player"),
    Rule.App("iMovie"),
    Rule.App("java"),
    Rule.App("zoom.us")
  )

  yabai window_topmost on
  yabai window_gap 2
  yabai window_shadow off

  yabai layout bsp
  yabai auto_balance off
  yabai window_placement second_child
  yabai split_ratio 0.5

  yabai mouse_follows_focus off
  yabai focus_follows_mouse autofocus

  yabai mouse_modifier ctrl
  yabai mouse_action1 resize
  yabai mouse_action2 move

  yabai padding 5

  yabai window_opacity on
  yabai active_window_opacity 1.0
  yabai normal_window_opacity 1.0

  yabai window_border off
