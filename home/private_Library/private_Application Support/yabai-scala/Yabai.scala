// 2> /dev/null \
/*
scala_version="3.0.0"
dependencies="
  lt.dvim.yabai:yabai-scala_3:2.0.1
"
source $(curl -sL https://git.io/boot-tsk | sh)
run
exit
 */

import lt.dvim.yabai.*

import scala.language.implicitConversions

@main def run() =
  for {
    _ <- (yabai.spaces.max until 10)
  } yield yabai ! "space --create"

  // Query for app names and title of running apps with:
  // yabai -m query --windows | jq '.[] | {app: .app, title: .title}'
  yabai no_manage (Rule.App("choose"), Rule.App("System Preferences"), Rule.Title("gpg-copy"))

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
  yabai normal_window_opacity 0.9

  yabai window_border off
