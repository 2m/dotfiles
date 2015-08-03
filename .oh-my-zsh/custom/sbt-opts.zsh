function sbtOpts() {

  JAVA_VERSION=`java -version 2>&1 | grep "java version" | cut -d ' ' -f3 | cut -d '.' -f2`

  SBT_OPTS=""
  SBT_OPTS="$SBT_OPTS -Xmx2g"
  SBT_OPTS="$SBT_OPTS -Xms2g"
  SBT_OPTS="$SBT_OPTS -Xss2m"
  SBT_OPTS="$SBT_OPTS -XX:ReservedCodeCacheSize=256m" # Maximum size for the JIT's code cache
  SBT_OPTS="$SBT_OPTS -XX:+TieredCompilation"         # Increase startup speed with tiered compilation
  SBT_OPTS="$SBT_OPTS -XX:+UseConcMarkSweepGC"        # Use Mark Sweep GC
  SBT_OPTS="$SBT_OPTS -XX:+CMSClassUnloadingEnabled"  # GC sweep PermGen
  SBT_OPTS="$SBT_OPTS -XX:+UseCompressedOops"         # Allow 32bit references in 64bit VM
  SBT_OPTS="$SBT_OPTS -Djava.security.egd=file:/dev/urandom" # Do not block on low entropy

  if [ "$JAVA_VERSION" -lt "8" ]; then
    SBT_OPTS="$SBT_OPTS -XX:MaxPermSize=512M"
  else
    SBT_OPTS="$SBT_OPTS -XX:MetaspaceSize=384M"         # Set JDK 8 metaspace
  fi

  if [[ $1 == "debug" ]] ; then
    SBT_OPTS="$SBT_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
  fi

  export SBT_OPTS
}

sbtOpts
