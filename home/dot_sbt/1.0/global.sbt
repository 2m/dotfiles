maxErrors := 5
triggeredMessage := Watched.clearWhenTriggered

// workaround for https://github.com/coursier/coursier/issues/450
classpathTypes += "maven-plugin"

import com.typesafe.sbt.SbtPgp.autoImport._
useGpg := true

bloopExportJarClassifiers in Global := Some(Set("sources"))
