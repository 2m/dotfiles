function javaOpts() {

  JAVA_VERSION=`java -version 2>&1 | grep "version" | cut -d ' ' -f3 | cut -d '.' -f2`

  JAVA_OPTS=""
  JAVA_OPTS="$JAVA_OPTS -Xmx2g"
  JAVA_OPTS="$JAVA_OPTS -Xms2g"
  JAVA_OPTS="$JAVA_OPTS -Xss2m"
  JAVA_OPTS="$JAVA_OPTS -XX:ReservedCodeCacheSize=256m" # Maximum size for the JIT's code cache
  JAVA_OPTS="$JAVA_OPTS -XX:+TieredCompilation"         # Increase startup speed with tiered compilation
  #JAVA_OPTS="$JAVA_OPTS -XX:+UseConcMarkSweepGC"        # Use Mark Sweep GC
  JAVA_OPTS="$JAVA_OPTS -XX:+CMSClassUnloadingEnabled"  # GC sweep PermGen
  JAVA_OPTS="$JAVA_OPTS -XX:+UseCompressedOops"         # Allow 32bit references in 64bit VM
  JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/urandom" # Do not block on low entropy
  JAVA_OPTS="$JAVA_OPTS -Dawt.useSystemAAFontSettings=on"      # Fixes font antialiasing

  if [ "$JAVA_VERSION" -lt "8" ]; then
    JAVA_OPTS="$JAVA_OPTS -XX:MaxPermSize=512M"
  else
    # Default JDK 8 metaspace is unlimited
  fi

  if [[ $1 == "debug" ]] ; then
    JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
  fi

  if [[ $1 == "jmx" ]] ; then
    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
  fi

  export JAVA_OPTS
}

javaOpts
