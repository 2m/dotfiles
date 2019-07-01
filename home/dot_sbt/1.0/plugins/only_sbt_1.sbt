addSbtPlugin("lt.dvim.authors" % "sbt-authors" % "1.0.2")
resolvers += Resolver.bintrayRepo("jypma", "maven") // for ts-reaktive

libraryDependencies ++= {
  if (!sbtVersion.value.startsWith("1.3")) {
    val sbtV = (sbtBinaryVersion in pluginCrossBuild).value
    val scalaV = (scalaBinaryVersion in update).value
    Seq(Defaults.sbtPluginExtra("io.get-coursier" % "sbt-coursier" % "1.1.0-M14-4+20-6be594e5+20190626-1606-SNAPSHOT", sbtV, scalaV))
  }
  else Seq.empty
}
