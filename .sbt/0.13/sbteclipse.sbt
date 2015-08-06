import com.typesafe.sbteclipse.plugin.EclipsePlugin._

// Compile the project before generating Eclipse files,
// so that generated .scala or .class files for views and routes are present
EclipseKeys.preTasks := Seq(compile in Compile)

EclipseKeys.executionEnvironment := Some(EclipseExecutionEnvironment.JavaSE18)
EclipseKeys.withSource := true

EclipseKeys.skipParents in ThisBuild := false
