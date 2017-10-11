export GOPATH=~/.local/share/gopath
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/
export ANDROID_HOME=~/Android/Sdk

RUBY_GEM_BIN=~/.gem/ruby/2.4.0/bin
LOCAL_BIN=~/.local/bin
CARGO_STABLE_BIN=~/.multirust/toolchains/stable/cargo/bin
CARGO_BIN=~/.cargo/bin
GOPATH_BIN=$GOPATH/bin
ANDROID_BIN=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin

export PATH=$PATH:$RUBY_GEM_BIN:$LOCAL_BIN:$CARGO_STABLE_BIN:$CARGO_BIN:$GOPATH_BIN:$ANDROID_BIN