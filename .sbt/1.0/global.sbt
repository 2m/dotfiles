maxErrors := 5
triggeredMessage := Watched.clearWhenTriggered

// workaround for https://github.com/coursier/coursier/issues/450
import coursier.Keys._
classpathTypes += "maven-plugin"

import com.typesafe.sbt.SbtPgp.autoImport._
useGpg := true